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
    
    public partial class ShippingAddress
    {
        public ShippingAddress()
        {
            this.Orders = new HashSet<Orders>();
        }
    
        public int ShippingAddressId { get; set; }
        public Nullable<int> USerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Email { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string HouseNumber { get; set; }
    
        public virtual Users Users { get; set; }
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
