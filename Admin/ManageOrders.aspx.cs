using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jashwanth Bellam
/// Date : 13-10-2016
/// This page is to manage orders by admin to the system
/// </summary>
namespace OnlineBookStore.Admin
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                //bind data after deletion
                gvOrders.DataBind();
            }
        }

        protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        // delete order on click of delete button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int orderId = Convert.ToInt32(((Button)sender).CommandArgument);
                BookDBContext bookDBContext = new BookDBContext();
                List<OrderByItem> oi = new List<OrderByItem>();
                Orders o = new Orders();
                List<BooksInKart> k = new List<BooksInKart>();
                oi = (from oi1 in bookDBContext.OrderByItem
                      where oi1.OrderID == orderId
                      select oi1).ToList();
                o = (from o1 in bookDBContext.Orders
                     where o1.OrderID == orderId
                     select o1).FirstOrDefault();
                k = (from k1 in bookDBContext.BooksInKart
                     where k1.OrderId == orderId
                     select k1).ToList();
                foreach (OrderByItem oi2 in oi)
                {
                    bookDBContext.OrderByItem.Remove(oi2);
                    bookDBContext.SaveChanges();
                }
                foreach (BooksInKart k2 in k)
                {
                    bookDBContext.BooksInKart.Remove(k2);
                    bookDBContext.SaveChanges();
                }

                bookDBContext.Orders.Remove(o);
                bookDBContext.SaveChanges();
                gvOrders.DataBind();
            }

            catch
            {
                gvOrders.DataBind();
            }

        }
    }
}