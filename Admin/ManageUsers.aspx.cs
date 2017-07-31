using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Praveen Gaddam
/// Date : 15-10-2016
/// This page is to manage users
/// </summary>
namespace OnlineBookStore.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //after databind hide some of the fileds from the select query
        protected void gvBooks_DataBound(object sender, EventArgs e)
        {
            gvBooks.HeaderRow.Cells[3].Visible = false;
            
            foreach (GridViewRow row in gvBooks.Rows)
            {
                row.Cells[3].Visible = false;
                
            }

        }
    }
}