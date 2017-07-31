using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jashwanth Bellam
/// Date : 1-11-2016
/// This page is to show the kart items to the customer
/// </summary>
namespace OnlineBookStore.Customers
{
    public partial class Kart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");

            }
            if (!IsPostBack)
            {
                BindDataListOfKart();

               
            }

           

        }
        // Bind the customer kart details
        private void BindDataListOfKart()
        {
            BookDBContext bookDBContext = new BookDBContext();
            
            int userId = Convert.ToInt32(Session["UserId"]);

            dlKart.DataSource = (from b in bookDBContext.Book
                                 from k in bookDBContext.BooksInKart
                                 where k.UserID == userId && b.BookID == k.BookID && k.StatusId == false
                                 select (new { BookID = b.BookID, Quantity = k.Quantity, BookURL = b.BookURL, BookName = b.BookName, KartTotal = k.kartTotal, KartId = k.BooksInKart1, BookPrice = b.Price })).ToList();
            dlKart.DataBind();

            var kartTotal = (from k in bookDBContext.BooksInKart
                              from b in bookDBContext.Book
                              where k.BookID == b.BookID && k.UserID == userId && k.StatusId == false
                              group k by k.UserID into g
                              select new { ToatlOfAllOrders = g.Sum(i => i.kartTotal) }).FirstOrDefault();
            lblPrice.Text = kartTotal == null ? "0" : kartTotal.ToatlOfAllOrders.ToString();
            if (dlKart.Items.Count == 0)
            {
                pnlTotal.Visible = false;
                btnConfrimOrder.Visible = false;
            }
        }
        //update quantity after clicking on save button

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int kartId = Convert.ToInt32(((Button)sender).CommandArgument);
            Session["kartId"] = kartId;
            BookDBContext bookDBCOntext = new BookDBContext();
            BooksInKart booksInKat = new BooksInKart();
            booksInKat = (from k in bookDBCOntext.BooksInKart
                           where k.BooksInKart1 == kartId
                           select k).FirstOrDefault();
            foreach (DataListItem item in dlKart.Items)
            {

                HiddenField hfID = (HiddenField)item.FindControl("hfID");
                if (hfID.Value == kartId.ToString())
                {
                    string txtQuantity = ((TextBox)item.FindControl("txtQuantity")).Text;
                    string lblSubTot = ((HiddenField)item.FindControl("hfBookPrice")).Value;
                    int x = 0;
                    decimal y = 0;
                    Int32.TryParse(txtQuantity, out x);

                    booksInKat.Quantity = x;
                    Decimal.TryParse((Convert.ToDecimal(lblSubTot) * Convert.ToInt32(txtQuantity)).ToString(), out y);
                    booksInKat.kartTotal = y;

                }


            }
            bookDBCOntext.SaveChanges();
            BindDataListOfKart();

        }
        //Delete kart item after clicking on delete button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int kartId = Convert.ToInt32(((Button)sender).CommandArgument);
            BookDBContext bookDBCOntext = new BookDBContext();
            BooksInKart booksInKart = new BooksInKart();
            booksInKart = (from k in bookDBCOntext.BooksInKart
                           where k.BooksInKart1 == kartId
                           select k).FirstOrDefault();
            bookDBCOntext.BooksInKart.Remove(booksInKart);
            bookDBCOntext.SaveChanges();
            BindDataListOfKart();

        }

        protected void btnConfrimOrder_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("~/Login.aspx");
            int userId = Convert.ToInt32(Session["UserId"]);
            BookDBContext bookDBContext = new BookDBContext();
            Orders order = new Orders();
            order.UserID = userId;
            order.OrderStatusID = 0;
            var totalOrderValue = (from k in bookDBContext.BooksInKart
                                   where k.StatusId == false && k.UserID == userId
                                group k by k.UserID into g
                                select new { ToatlOfAllOrders = g.Sum(i => i.kartTotal) }).FirstOrDefault();
            order.OrderTotal = Convert.ToDecimal(totalOrderValue.ToatlOfAllOrders);

            bookDBContext.Orders.Add(order);
            bookDBContext.SaveChanges();
            Session["OrderId"] = order.OrderID;
            Response.Redirect("~/Customers/KartPayment.aspx");
        }
    }
}