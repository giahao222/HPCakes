//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HPCakes.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class orders_detail
    {
        public int id { get; set; }
        public int order_id { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> quantity { get; set; }
        public Nullable<double> price { get; set; }
        public Nullable<double> total { get; set; }
    
        public virtual product product { get; set; }
        public virtual order order { get; set; }
    }
}
