using HPCakes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HPCakes.Controllers
{
    public class HomeController : Controller
    {
        cakeshopEntities _db = new cakeshopEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getCakes()
        {
            var v = from t in _db.products
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getNews()
        {
            var v = from t in _db.news
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}