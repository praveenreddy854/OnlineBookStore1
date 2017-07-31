using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jagadeesh Kanoori
/// Date : 14-11-2016
/// This page is to add a book by admin to the system
/// </summary>
namespace OnlineBookStore
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        //filter books by category
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request["categoryName"].Trim() != string.Empty && Request["categoryName"] != null )
            {
                string categoryName = Request["categoryName"].ToString();
                categoryName.Replace("%20", " ");
                BookDBContext bookDBContext = new BookDBContext();
                dlBooks.DataSource = (from b in bookDBContext.Book
                                      from c in bookDBContext.Category
                                      where c.CategoryName == categoryName && c.CategoryId == b.CategoryID
                                      select b).ToList();
                dlBooks.DataBind();
            }
            
        }
        protected void imgButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["BookID"] = ((ImageButton)sender).CommandArgument.ToString();
            Response.Redirect("~/Purchase.aspx");
        }
    }
}