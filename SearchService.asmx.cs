using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace OnlineBookStore
{
    /// <summary>
    /// Summary description for SearchService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    //Web servie to return the books based on the search
    public class SearchService : System.Web.Services.WebService
    {

        [WebMethod]
        public List<string> Search(string bookName)
        {
            BookDBContext bookDBContext = new BookDBContext();
            List<Book> books = new List<Book>();

            books = (from b in bookDBContext.Book
                     where b.BookName.Contains(bookName)
                     select b).ToList();
            List<string> booksList = new List<string>();
            foreach (Book b in books)
            {
                booksList.Add(b.BookName);
            }
            return booksList;
        }
    }
}
