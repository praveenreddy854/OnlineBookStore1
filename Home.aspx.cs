using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Praveen Gaddam
/// Date : 12-10-2016
/// This page is to add a book by admin to the system
/// </summary>

namespace OnlineBookStore
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            TextBox txt = Master.FindControl("txtSearch") as TextBox;
            if (!IsPostBack)
            {
                    BindBooksDataList();    
            }
            else
            {
                if (txt.Text !="")
                {
                    BookDBContext bookDBCOntext = new BookDBContext();
                    dlBooks.DataSource = (from b in bookDBCOntext.Book
                                          where b.BookName.Contains(txt.Text)
                                          select b).ToList();
                    dlBooks.DataBind();
                }
                else
                {
                    BindBooksDataList();
                }
            }
            
            
        }
        //Bind oall the books to the master page
        private void BindBooksDataList()
        {
            BookDBContext bookDBCOntext = new BookDBContext();
            dlBooks.DataSource = (from b in bookDBCOntext.Book
                                  select b).ToList();
            dlBooks.DataBind();
        }

        protected void imgButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["BookID"] = ((ImageButton)sender).CommandArgument.ToString();
            Response.Redirect("~/Purchase.aspx");
        }
    }
}