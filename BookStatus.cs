//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineBookStore
{
    using System;
    using System.Collections.Generic;
    
    public partial class BookStatus
    {
        public BookStatus()
        {
            this.Book = new HashSet<Book>();
        }
    
        public int StatusID { get; set; }
        public string StatusName { get; set; }
    
        public virtual ICollection<Book> Book { get; set; }
    }
}