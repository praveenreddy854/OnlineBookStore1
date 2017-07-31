using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Praveen Gaddam
/// Date : 12-10-2016
/// This page is to add a book by admin to the system
/// </summary>
namespace OnlineBookStore.Customers
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");

            }

            if (!IsPostBack)
            {
                BindOrdersDataList();
            }


        }
        //Bind orders to the datalist
        private void BindOrdersDataList()
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            BookDBContext bookDBContext = new BookDBContext();
            dlOrders.DataSource = (from orderByItem in bookDBContext.OrderByItem
                                   from order in bookDBContext.Orders
                                   from book in bookDBContext.Book
                                   where order.UserID == userId && order.OrderID == orderByItem.OrderID && book.BookID == orderByItem.BookID && order.OrderStatusID == 0
                                   select new { Quantity = orderByItem.Quantity, OrderByItemID = orderByItem.OrderByItemID, BookURL = book.BookURL, ItemTotal = orderByItem.ItemTotal, BookPrice = book.Price, BookName = book.BookName }).Distinct().ToList();
            dlOrders.DataBind();

            var orderTotal = (from order1 in bookDBContext.Orders
                             from orderByItem1 in bookDBContext.OrderByItem
                             where orderByItem1.OrderID == order1.OrderID && order1.UserID == userId && order1.OrderStatusID==0
                             group order1 by order1.UserID into g
                             select  new { ToatlOfAllOrders = g.Sum(i=>i.OrderTotal)  } ).FirstOrDefault();
            lblPrice.Text = orderTotal == null ? "0" : orderTotal.ToatlOfAllOrders.ToString();
        }
        //Update quantity after clicking on save button
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int orderByItemID = Convert.ToInt32(((Button)sender).CommandArgument);
            Session["OrderByItemID"] = orderByItemID;
            BookDBContext bookDBCOntext = new BookDBContext();
            OrderByItem orderByItem = new OrderByItem();
            orderByItem = (from orderByItm in bookDBCOntext.OrderByItem
                           where orderByItm.OrderByItemID == orderByItemID
                           select orderByItm).FirstOrDefault();
            foreach (DataListItem item in dlOrders.Items)
            {

                HiddenField hfID = (HiddenField)item.FindControl("hfID");
                string lblSubTot = "0";
                decimal orderTotal = 0;
                if (hfID.Value == orderByItemID.ToString())
                {
                    string txtQuantity = ((TextBox)item.FindControl("txtQuantity")).Text;
                    lblSubTot = ((HiddenField)item.FindControl("hfBookPrice")).Value;
                    int x = 0;
                    decimal y = 0;
                    Int32.TryParse(txtQuantity, out x);

                    orderByItem.Quantity = x;
                    Decimal.TryParse((Convert.ToDecimal(lblSubTot) * Convert.ToInt32(txtQuantity)).ToString(), out y);
                    orderByItem.ItemTotal = y;

                }
                
            }
            bookDBCOntext.SaveChanges();
            BindOrdersDataList();
            


        }
        //delete order on clickof delete button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int orderByItemID = Convert.ToInt32(((Button)sender).CommandArgument);
            BookDBContext bookDBCOntext = new BookDBContext();
            OrderByItem orderByItem = new OrderByItem();
            orderByItem = (from orderByItm in bookDBCOntext.OrderByItem
                           where orderByItm.OrderByItemID == orderByItemID
                           select orderByItm).FirstOrDefault();
            bookDBCOntext.OrderByItem.Remove(orderByItem);
            bookDBCOntext.SaveChanges();
            BindOrdersDataList();
            
        }
        //Place order on click of confirm order button click
        protected void btnConfrimOrder_Click(object sender, EventArgs e)
        {
            BookDBContext bookDBContext = new BookDBContext();
            try
            {
                UpdateShippingAddress(bookDBContext);
                UpdatePaymentDetails(bookDBContext);
                UpdateOrderStatus(bookDBContext);
                Response.Redirect("~/Customers/ThankYou.aspx");
            }

            catch (DbEntityValidationException e1)
            {
                foreach (var eve in e1.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }

        }
        //save shipping address details after clicking confirm order button

        private void UpdateShippingAddress(BookDBContext bookDBContext)
        {
            if (Session["UserId"] == null)
                Response.Redirect("~/Login.aspx");
            int userId = Convert.ToInt32(Session["UserId"]);
            ShippingAddress shipping = new ShippingAddress();
            shipping.FirstName = txtName.Text;
            shipping.Email = txtEmail.Text;
            shipping.HouseNumber = txtAdress2.Text;
            shipping.Street = txtAdress1.Text;
            shipping.City = txtCity.Text;
            shipping.Zip = txtZip.Text;
            shipping.Phone1 = txtPhone.Text;
            shipping.USerID = userId;
            shipping.State = txtState.Text;
            shipping.LastName = txtLastName.Text;
            shipping.Phone2 = "0000000000";
            bookDBContext.ShippingAddress.Add(shipping);
            bookDBContext.SaveChanges();
            Session["ShippingId"] = shipping.ShippingAddressId;
        }

        private void UpdatePaymentDetails(BookDBContext bookDBContext)
        {
            PaymentType paymentType = new PaymentType();
            paymentType.PaymentTypeID = Convert.ToInt32(bookDBContext.PaymentType.Max(p => p.PaymentTypeID)) + 1;
            paymentType.CardNumber = txtCardNum.Text;
            paymentType.CVV = Convert.ToInt16(txtCVV.Text);
            paymentType.ExpiryDate = ddlMonth.SelectedItem.Text + "-" + ddlYear.SelectedItem.Text;
            if (rblVisa.Checked)
                paymentType.PaymentName = "Visa";
            else if (rblMaster.Checked)
                paymentType.PaymentName = "Master";
            else if (rblDiscover.Checked)
                paymentType.PaymentName = "Discover";
            else
                paymentType.PaymentName = "American Express";
            bookDBContext.PaymentType.Add(paymentType);
            bookDBContext.SaveChanges();
            Session["PaymentTypeId"] = paymentType.PaymentTypeID;
        }

        private void UpdateOrderStatus(BookDBContext bookDBContext)
        {
            if (Session["OrderId"] == null)
                Response.Redirect("~/Customers/Kart.aspx");
            int orderId = Convert.ToInt32(Session["OrderId"]);
            List<Orders> listOrders = new List<Orders>();
             listOrders = (from o in bookDBContext.Orders
                         where o.OrderID == orderId || o.OrderStatusID == 0
                         select o).ToList();
            foreach(Orders order in listOrders)
            {
                order.OrderStatusID = 1;
                order.ShippingAddressId = Convert.ToInt32(Session["ShippingId"]);
                order.PaymentTypeID = Convert.ToInt32(Session["PaymentTypeId"]);
                order.OrderDate = DateTime.Now;
                bookDBContext.SaveChanges();
            }
            
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        
    }
}