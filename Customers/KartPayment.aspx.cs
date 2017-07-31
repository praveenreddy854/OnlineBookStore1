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
    public partial class KartPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");

            }
        }
        //PlaceHolder order after clicking on confirm order button
        protected void btnConfrimOrder_Click(object sender, EventArgs e)
        {
            BookDBContext bookDBContext = new BookDBContext();
            try
            {
                UpdateShippingAddress(bookDBContext);
                UpdatePaymentDetails(bookDBContext);
                UpdateOrderStatus(bookDBContext);
                UpdateKartAfterOrder(bookDBContext);
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
        //update kart after placing order,put the status to true
        private void UpdateKartAfterOrder(BookDBContext bookDBContext)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            int orderId = Convert.ToInt32(Session["OrderId"]);
            List<BooksInKart> booksInKart = new List<BooksInKart>();
            booksInKart = (from b in bookDBContext.BooksInKart
                           where b.UserID == userId
                           select b).ToList();
            foreach (BooksInKart b in booksInKart)
            {
                b.StatusId = true;
                b.OrderId = orderId;
            }
            bookDBContext.SaveChanges();
        }

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
        //update payment details

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
        //update order status to 1
        private void UpdateOrderStatus(BookDBContext bookDBContext)
        {
            if (Session["OrderId"] == null)
                Response.Redirect("~/Customers/Kart.aspx");
            int orderId = Convert.ToInt32(Session["OrderId"]);
            
            var order = (from o in bookDBContext.Orders
                         where o.OrderID == orderId
                         select o).FirstOrDefault();
            order.OrderStatusID = 1;
            order.ShippingAddressId = Convert.ToInt32(Session["ShippingId"]);
            order.PaymentTypeID = Convert.ToInt32(Session["PaymentTypeId"]);
            order.OrderDate = DateTime.Now;
            bookDBContext.SaveChanges();
        }
    }
}