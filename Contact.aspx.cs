using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBookStore
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            BookDBContext bookDBContext = new BookDBContext();
            CustomerMessage messge = new CustomerMessage();
            messge.Name = txtName.Text;
            messge.Email = txtEmail.Text;
            messge.Message = txtDescription.Text;
            bookDBContext.CustomerMessage.Add(messge);
            bookDBContext.SaveChanges();
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Your message successfully sent";
        }
    }
}