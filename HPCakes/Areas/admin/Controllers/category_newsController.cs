using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HPCakes.Models;

namespace HPCakes.Areas.admin.Controllers
{
    public class category_newsController : Controller
    {
        private cakeshopEntities db = new cakeshopEntities();

        // GET: admin/category_news
        public ActionResult Index()
        {
            return View(db.category_news.ToList());
        }

        // GET: admin/category_news/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_news category_news = db.category_news.Find(id);
            if (category_news == null)
            {
                return HttpNotFound();
            }
            return View(category_news);
        }

        // GET: admin/category_news/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/category_news/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,meta,hide,order,datebegin")] category_news category_news)
        {
            if (ModelState.IsValid)
            {
                db.category_news.Add(category_news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category_news);
        }

        // GET: admin/category_news/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_news category_news = db.category_news.Find(id);
            if (category_news == null)
            {
                return HttpNotFound();
            }
            return View(category_news);
        }

        // POST: admin/category_news/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,meta,hide,order,datebegin")] category_news category_news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category_news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category_news);
        }

        // GET: admin/category_news/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category_news category_news = db.category_news.Find(id);
            if (category_news == null)
            {
                return HttpNotFound();
            }
            return View(category_news);
        }

        // POST: admin/category_news/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            category_news category_news = db.category_news.Find(id);
            db.category_news.Remove(category_news);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
