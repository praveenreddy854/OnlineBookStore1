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
    
    public partial class PaymentType
    {
        public PaymentType()
        {
            this.Orders = new HashSet<Orders>();
        }
    
        public int PaymentTypeID { get; set; }
        public string PaymentName { get; set; }
        public string CardNumber { get; set; }
        public Nullable<short> CVV { get; set; }
        public string ExpiryDate { get; set; }
        public string PaymentDetails { get; set; }
    
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
