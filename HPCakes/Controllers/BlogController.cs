using HPCakes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace HPCakes.Controllers
{
    public class BlogController : Controller
    {
        cakeshopEntities _db = new cakeshopEntities();
        // GET: News
        public ActionResult Blogs()
        {
            return View();
        }

        public ActionResult BlogsDetail(long id)
        {
            var v = from t in _db.news
                    where t.id == id
                    select t;
            return View(v.FirstOrDefault());
        }

        /* public ActionResult getNews()
         {

             var v = from t in _db.news
                     where t.hide == true
                     orderby t.order descending
                     select t;
             return PartialView(v.ToList());
         }*/
        public ActionResult getBlogs(int? page)
        {
            ViewBag.meta = "tin-tuc";
            int pageSize = 2; // số sản phẩm trên mỗi trang
            int pageNumber = (page ?? 1);
            var news = (from t in _db.news
                        where t.hide == true
                        orderby t.order descending
                        select t).ToList();
            IPagedList<news> pagedProducts = news.ToPagedList(pageNumber, pageSize);
            return PartialView(pagedProducts);
        }
    }
}
