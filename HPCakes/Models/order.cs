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
    
    public partial class order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public order()
        {
            this.orders_detail = new HashSet<orders_detail>();
        }
    
        public int id { get; set; }
        public Nullable<System.DateTime> oderDate { get; set; }
        public string customerName { get; set; }
        public string productName { get; set; }
        public string address { get; set; }
        public Nullable<double> totalAmount { get; set; }
        public string payment { get; set; }
        public Nullable<System.DateTime> lastUpdateDate { get; set; }
        public string orderStatus { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<orders_detail> orders_detail { get; set; }
    }
}
