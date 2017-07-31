using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Praveen Gaddam
/// Date : 12-11-2016
/// This page is to add a book by admin to the system
/// </summary>
namespace OnlineBookStore
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //display seleted book to buy or add to kart
            int bookId = Convert.ToInt32(Session["BookID"]);
            BookDBContext bookDBContext = new BookDBContext();
            dlBook.DataSource = (from book in bookDBContext.Book
                                where book.BookID == bookId
                                select book).ToList();
            dlBook.DataBind();

        }
        //Add to kart and put in the kart
        protected void btnAddToKart_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["BookID"] == null)
                Response.Redirect("~/Login.aspx");
            int userId = Convert.ToInt32(Session["UserId"]);
            int bookId = Convert.ToInt32(Session["BookID"]);
            BookDBContext bookDBContext = new BookDBContext();
            BooksInKart booksInKart = new BooksInKart();
            booksInKart.BookID = bookId;
            booksInKart.Quantity = 1;
            booksInKart.UserID = userId;
            booksInKart.StatusId = false;
            booksInKart.kartTotal = Convert.ToDecimal((from b in bookDBContext.Book
                                     where b.BookID == bookId
                                     select b.Price).FirstOrDefault().ToString());
            booksInKart.OrderId = null;

            bookDBContext.BooksInKart.Add(booksInKart);
            bookDBContext.SaveChanges();
            
        }

        //Proceed to buy the book directly instead of adding to kart
        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            
            if (Session["UserId"] == null || Session["BookID"] == null )
                Response.Redirect("~/Login.aspx");
            int userId = Convert.ToInt32(Session["UserId"]);
            int bookId = Convert.ToInt32(Session["BookID"]);
            BookDBContext bookDBContext = new BookDBContext();
            Session["OrderId"] = OrderTemp(userId, bookDBContext);
            OrderByItemTemp(bookId, Convert.ToInt32(Session["OrderId"]), bookDBContext);
            Response.Redirect("~/Customers/Payment.aspx");
        }

        private static void OrderByItemTemp(int bookId, int orderId ,BookDBContext bookDBContext)
        {
            OrderByItem orderByItem = new OrderByItem();
            orderByItem.OrderID = orderId;
            orderByItem.BookID = bookId;
            orderByItem.Quantity = 1;
            orderByItem.ItemTotal = Convert.ToDecimal((from book in bookDBContext.Book
                                     where book.BookID == bookId
                                     select book.Price).FirstOrDefault());
            bookDBContext.OrderByItem.Add(orderByItem);
            bookDBContext.SaveChanges();
        }

        private static int OrderTemp(int userId, BookDBContext bookDBContext)
        {
            Orders order = new Orders();
            order.UserID = userId;
            order.OrderStatusID = 0;
            order.PaymentTypeID = null;
            order.OrderTotal = Convert.ToDecimal((from oi in bookDBContext.OrderByItem
                                from o in bookDBContext.Orders
                                where o.OrderID == oi.OrderID
                                select oi.ItemTotal).FirstOrDefault());
            order.OrderDate = null;
            bookDBContext.Orders.Add(order);
            bookDBContext.SaveChanges();
            return order.OrderID;
        }
    }
}