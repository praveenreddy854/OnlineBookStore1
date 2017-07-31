using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Jashwanth Bellam
/// Date : 1-10-2016
/// This page is to add a book by admin to the system
/// </summary>
namespace OnlineBookStore
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Register user
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            BookDBContext bookDBContext = new BookDBContext();
            Users user = new Users();
            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastname.Text;
            user.Email = txtEmail.Text;
            user.UserName = txtUserId.Text;
            user.Password = txtPassword.Text;
            user.AccountStatus = "Active";
            bookDBContext.Users.Add(user);
            bookDBContext.SaveChanges();
            Response.Redirect("~/Login.aspx");
        }
    }
}