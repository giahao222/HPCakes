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
    
    public partial class team
    {
        public int id { get; set; }
        public string name { get; set; }
        public string job_title { get; set; }
        public string img { get; set; }
        public string twitter { get; set; }
        public string facebook { get; set; }
        public string instagram { get; set; }
        public string linked_in { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public Nullable<System.DateTime> date_of_birth { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<int> order { get; set; }
    }
}
