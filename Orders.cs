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
    
    public partial class Orders
    {
        public Orders()
        {
            this.OrderByItem = new HashSet<OrderByItem>();
            this.BooksInKart = new HashSet<BooksInKart>();
        }
    
        public int OrderID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> PaymentTypeID { get; set; }
        public Nullable<decimal> OrderTotal { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<int> OrderStatusID { get; set; }
        public Nullable<int> ShippingAddressId { get; set; }
    
        public virtual ICollection<OrderByItem> OrderByItem { get; set; }
        public virtual PaymentType PaymentType { get; set; }
        public virtual Users Users { get; set; }
        public virtual ICollection<BooksInKart> BooksInKart { get; set; }
        public virtual ShippingAddress ShippingAddress { get; set; }
    }
}