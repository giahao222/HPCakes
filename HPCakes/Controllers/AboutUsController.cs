using HPCakes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HPCakes.Controllers
{
    public class AboutUsController : Controller
    {
        cakeshopEntities _db = new cakeshopEntities();
        // GET: AboutUs
        public ActionResult AboutUs()
        {
            return View();
        }
        public ActionResult getTeam()
        {
            var v = from t in _db.teams
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getCategoryRec()
        {
            ViewBag.meta = "san-pham";
            var v = from t in _db.categories
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}