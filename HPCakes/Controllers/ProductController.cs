using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HPCakes.Models;
using PagedList;

namespace HPCakes.Controllers
{
    public class ProductController : Controller
    {
        cakeshopEntities _db=new cakeshopEntities();
        // GET: Product
        public ActionResult Index(string meta)
        {
            var t = from v in _db.categories
                    where v.meta == meta
                    select v;
            return View(t.FirstOrDefault());
        }

        public ActionResult ProductDetail(long id)
        {
            var v = from t in _db.products
                    where t.id == id
                    select t;
            return View(v.FirstOrDefault());
        }

        public ActionResult getCategory()
        {
            ViewBag.meta = "san-pham";
            var v = from t in _db.categories
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getProduct(int? page)
        {
            ViewBag.meta = "san-pham";
            int pageSize = 6; // số sản phẩm trên mỗi trang
            int pageNumber = (page ?? 1);
            var products = (from t in _db.products
                            where t.hide == true
                            orderby t.order ascending
                            select t).ToList();
            IPagedList<product> pagedProducts = products.ToPagedList(pageNumber, pageSize);
            return PartialView(pagedProducts);
        }

        public ActionResult getProductByCategory(long id, int? page)
        {
            ViewBag.meta = "san-pham";
            int pageSize = 6; // số sản phẩm trên mỗi trang
            int pageNumber = (page ?? 1);
            var products = (from t in _db.products
                            where t.categoryid == id && t.hide == true
                            orderby t.order ascending
                            select t).ToList();
            IPagedList<product> pagedProducts = products.ToPagedList(pageNumber, pageSize);
            return PartialView(pagedProducts);
        }

        public ActionResult getProductASC(int? page)
        {
            ViewBag.meta = "san-pham";
            /*int pageSize = 6; // số sản phẩm trên mỗi trang
            int pageNumber = (page ?? 1);*/
            var products = (from t in _db.products
                            where t.hide == true
                            orderby t.price ascending
                            select t).ToList();
            /*IPagedList<product> pagedProducts = products.ToPagedList(pageNumber, pageSize);*/
            return PartialView(products);
        }

        public ActionResult getProductDESC(int? page)
        {
            ViewBag.meta = "san-pham";
            /*int pageSize = 6; // số sản phẩm trên mỗi trang
            int pageNumber = (page ?? 1);*/
            var products = (from t in _db.products
                            where t.hide == true
                            orderby t.price descending
                            select t).ToList();
            /*IPagedList<product> pagedProducts = products.ToPagedList(pageNumber, pageSize);*/
            return PartialView(products);
        }

        public ActionResult getProductRecommend(long id)
        {
            ViewBag.meta = "san-pham";
            var products = (from t in _db.products
                            where t.categoryid == id && t.hide == true
                            orderby t.order ascending
                            select t).ToList();
            return PartialView(products);
        }

    }
}