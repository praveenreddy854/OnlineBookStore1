using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Created by : Praveen Gaddam
/// Date : 14-10-2016
/// This page is to manage books by admin to the system
/// </summary>
namespace OnlineBookStore.Admin
{
    public partial class ManageBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        // show all the books in griidview 
        protected void gvBooks_DataBound(object sender, EventArgs e)
        {
            gvBooks.HeaderRow.Cells[4].Visible = false;
            gvBooks.HeaderRow.Cells[5].Visible = false;
            gvBooks.HeaderRow.Cells[10].Visible = false;
            int i = 0;
            foreach (GridViewRow row in gvBooks.Rows)
            {
                row.Cells[4].Visible = false;
                row.Cells[5].Visible = false;
                row.Cells[10].Visible = false;
                
            }

            
        }

        protected void gvBooks_DataBinding(object sender, EventArgs e)
        {
            
        }
    }
}