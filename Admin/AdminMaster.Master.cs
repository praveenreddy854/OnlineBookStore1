using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Praveen Gaddam
/// Date : 12-10-2016
/// This page is maste page for all administrators
/// </summary>
namespace OnlineBookStore.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                pnlSignIn.Visible = true;
                PnlSignOut.Visible = false;
                Response.Redirect("~/Login.aspx");

            }
            else
            {
                PnlSignOut.Visible = true;
                pnlSignIn.Visible = false;
            }

        }
        // On click of sign out empty the sessions
        protected void lbSingOur_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            pnlSignIn.Visible = true;
            PnlSignOut.Visible = false;
            Response.Redirect("~/Login.aspx");

        }

    }
}