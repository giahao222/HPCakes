﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HPCakes
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Product",
                "{type}/{meta}",
                new { controller = "Product", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","san-pham"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" });

        
            routes.MapRoute(
                "ProductDetail",
                "{type}/{meta}/{id}",
                new { controller = "Product", action = "ProductDetail", id = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","san-pham"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "Blogss",
                "{type}/{meta}",
                new { controller = "Blog", action = "Blogs", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","tin-tuc"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "BlogsDetail",
                "{type}/{meta}/{id}",
                new { controller = "Blog", action = "BlogsDetail", id = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","tin-tuc"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "About Us",
                "{type}/{meta}",
                new { controller = "AboutUs", action = "AboutUs", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","thong-tin"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "Home",
                "{type}/{meta}",
                new { controller = "Home", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","trang-chu"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "Index_getProduct",
                "{controller}/{type}/{meta}/{id}",
                new { controller = "Product", action = "ProductDetail", meta = UrlParameter.Optional, id = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "controller","Home"
                    },
                    {
                        "type","san-pham"
                    }
                },
                namespaces: new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "Cart",
                "{type}/{meta}",
                new { controller = "Cart", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","gio-hang"
                    }
                },
                new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "Bill",
                "{type}/{meta}",
                new { controller = "Cart", action = "Bill", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","thanh-toan"
                    }
                },
                new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                "Contact Us",
                "{type}/{meta}",
                new { controller = "ContactUs", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary {
                    {
                        "type","lien-he"
                    }
                },
                new[] { "HPCakes.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "HPCakes.Controllers" }
            );
        }
    }
}
