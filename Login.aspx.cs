using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jashwanth Bellam
/// Date : 12-11-2016
/// This page is to login for all the users
/// </summary>
namespace OnlineBookStore
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Login in the user if userid and password matches
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            BookDBContext bookDBContext = new BookDBContext();
            Users user = new Users();
            Admins admin = new Admins();
            user = (from u in bookDBContext.Users
                    where u.UserName == txtUserId.Text && u.Password == txtPassword.Text && u.AccountStatus == "Active"
                    select u).FirstOrDefault();
            admin = (from a in bookDBContext.Admins
                     where a.AdminUserName == txtUserId.Text && a.AdminPassword == txtPassword.Text && a.AccountStatus == "Active"
                     select a).FirstOrDefault();
            if(user ==null && admin == null)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter valid User name and password";
            }
            else
            {
                if(user != null)
                {
                    Session["User"] = user.UserName;
                    Session["UserId"] = user.UserID;
                    Response.Redirect("~/Home.aspx"); 
                }
                else
                {
                    Session["Admin"] = admin.AdminUserName;
                    Response.Redirect("~/Admin/AddBook.aspx");
                }
            }
        }
    }
}