﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HPCakes.Areas.admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
    }
}