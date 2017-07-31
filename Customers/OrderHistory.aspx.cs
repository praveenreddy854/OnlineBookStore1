using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jagadeesh Kanoori
/// Date : 11-11-2016
/// This page is to see the customer's order history
/// </summary>
namespace OnlineBookStore.Customers
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        // bind previous orders to the grid
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");

            }
            int userId = Convert.ToInt32(Session["UserId"]);
            BookDBContext bookDBContext = new BookDBContext();
            gvOrders.DataSource = ((from o in bookDBContext.Orders
                                   from b in bookDBContext.Book
                                   from oi in bookDBContext.OrderByItem
                                   where o.UserID == userId && (b.BookID == oi.BookID) && (o.OrderID == oi.OrderID) && o.OrderStatusID == 1
                                    select new { BookURL = b.BookURL, BookName = b.BookName, OrderTotal = o.OrderTotal, OrderId = o.OrderID, OrderDate = o.OrderDate })
                                   .Concat
                                   (from o in bookDBContext.Orders
                                    from b in bookDBContext.Book
                                    from k in bookDBContext.BooksInKart
                                    where o.UserID == userId && (b.BookID == k.BookID) && (o.OrderID == k.OrderId) && o.OrderStatusID == 1
                                    select new { BookURL = b.BookURL, BookName = b.BookName, OrderTotal = o.OrderTotal, OrderId = o.OrderID, OrderDate = o.OrderDate })).Distinct().ToList();
            gvOrders.DataBind();
        }
    }
}