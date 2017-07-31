using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBookStore
{
    public partial class CustomerMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                pnlSignIn.Visible = true;
                PnlSignOut.Visible = false;

            }
            else
            {
                PnlSignOut.Visible = true;
                pnlSignIn.Visible = false;
            }
            
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Customers/Kart.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void lbSingOur_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            pnlSignIn.Visible = true;
            PnlSignOut.Visible = false;

        }
    }
}