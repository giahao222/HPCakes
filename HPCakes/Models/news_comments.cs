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
    
    public partial class news_comments
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public news_comments()
        {
            this.news_comments1 = new HashSet<news_comments>();
        }
    
        public int id { get; set; }
        public Nullable<int> news_id { get; set; }
        public Nullable<int> reply_id { get; set; }
        public string username { get; set; }
        public string img { get; set; }
        public string email { get; set; }
        public string message { get; set; }
        public Nullable<int> order { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<System.DateTime> datebegin { get; set; }
    
        public virtual news news { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<news_comments> news_comments1 { get; set; }
        public virtual news_comments news_comments2 { get; set; }
    }
}
