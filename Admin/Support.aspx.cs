using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jagadeesh Kanoori
/// Date : 18-10-2016
/// This page is to add a book by admin to the system
/// </summary>
namespace OnlineBookStore.Admin
{
    public partial class Support : System.Web.UI.Page
    {
        // Show all the messages sent by customer
        protected void Page_Load(object sender, EventArgs e)
        {
            BookDBContext bookDBContext = new BookDBContext();
            dlMessages.DataSource = (from m in bookDBContext.CustomerMessage
                                     select m).ToList();
            dlMessages.DataBind();
        }
    }
}