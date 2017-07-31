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
namespace OnlineBookStore.Admin
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            txtNewCategory.Visible = true;
            ddlExistingCategory.Visible = false;
        }
        //if clikced on existing category radio button show drop down list 
        protected void rblExistingCategory_CheckedChanged(object sender, EventArgs e)
        {
            if(rblExistingCategory.Checked)
            {
                txtNewCategory.Visible = false;
                ddlExistingCategory.Visible = true;
                BookDBContext bookDBCOntext = new BookDBContext();
                ddlExistingCategory.DataSource = bookDBCOntext.Category.Select(c => new { CategoryId = c.CategoryId, CategoryName = c.CategoryName }).ToList();
                ddlExistingCategory.DataValueField = "CategoryId";
                ddlExistingCategory.DataTextField = "CategoryName";
                ddlExistingCategory.DataBind();
            }
        }
        // if clicked on new category radio button, show textbox
        protected void rblNewCategory_CheckedChanged(object sender, EventArgs e)
        {
            if(rblNewCategory.Checked)
            {
                
                txtNewCategory.Visible = true;

            }
        }
        //add book details to the database on button click
        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            Category category = new Category();
            BookDBContext bdc = new BookDBContext();
            Book book = new Book();
            List<Book> listBook = new List<Book>();
            if (rblExistingCategory.Checked)
            {
                var categoryID = (from cat in bdc.Category
                                 where cat.CategoryName == ddlExistingCategory.SelectedItem.Text
                                 select cat.CategoryId).Single();
                book.CategoryID = Convert.ToInt32(categoryID);
            }
            else
            {
                if (IsCategoryAdded())
                {
                    var categoryID = (from cat in bdc.Category
                                      where cat.CategoryName == txtNewCategory.Text
                                      select cat.CategoryId).Single();
                    book.CategoryID = Convert.ToInt32(categoryID);
                }
                
            }

            book.BookName = txtBookName.Text;
            book.AuthorName = txtAuthorName.Text;
            imageUpload.SaveAs(Server.MapPath("~/Uploads/" + imageUpload.FileName));
            book.BookURL = "~/Uploads/"+imageUpload.FileName;
            book.Price = Convert.ToDecimal(txtPrice.Text);
            book.BookDescription = txtDescription.Text;
            book.BookStatusId = 1;
            book.DateAdded = DateTime.Now;
            book.DateUpdated = DateTime.Now;
            listBook.Add(book);

            BookDBContext bookDBContext = new BookDBContext();
            bookDBContext.Book.Add(book);
            bookDBContext.SaveChanges();
        }

        //Add category if before adding the book, if new category is choosen
        private bool IsCategoryAdded()
        {
            
            Category cat1 = new Category();
            cat1.CategoryName = txtNewCategory.Text;
            BookDBContext dbc1 = new BookDBContext();
            var categoyId = (from cat in dbc1.Category
                            where cat.CategoryName == txtNewCategory.Text
                            select cat.CategoryId).FirstOrDefault();
            int car = Convert.ToInt32(categoyId);
            if (car == 0)
            {
                dbc1.Category.Add(cat1);
                try
                {
                    dbc1.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }

            }
            return false;

        }
       
    }
}