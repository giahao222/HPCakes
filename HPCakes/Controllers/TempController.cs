using HPCakes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HPCakes.Models;

namespace HPCakes.Controllers
{
    public class TempController : Controller
    {
        cakeshopEntities _db = new cakeshopEntities();
        // GET: Temp
        public ActionResult getMenu()
        {
            var v = from t in _db.menus
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        

    }
}