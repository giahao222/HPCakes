﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HPCakes.Models;
using HPCakes.Help;
using System.Data.Entity.Validation;
using System.IO;

namespace HPCakes.Areas.admin.Controllers
{
    public class newsController : Controller
    {
        private cakeshopEntities db = new cakeshopEntities();

        // GET: admin/news
        public ActionResult Index(long? id = null)
        {
            getCategory(id);
            return View();
        }

        public void getCategory(long? selectedId = null)
        {
            ViewBag.Category_News = new SelectList(db.category_news.Where(x => x.hide == true)
                .OrderBy(x => x.order), "id", "name", selectedId);
        }

        public ActionResult getNews(long? id)
        {
            if (id == null)
            {
                var v = db.news.OrderBy(x => x.order).ToList();
                return PartialView(v);
            }
            var m = db.news.Where(x => x.categoryid == id).OrderBy(x => x.order).ToList();
            return PartialView(m);
        }

        // GET: admin/news/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news news = db.news.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: admin/news/Create
        public ActionResult Create()
        {
            getCategory();
            return View();
        }

        // POST: admin/news/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,categoryid,name,img,description,detail,meta,hide,order,datebegin")] news news, HttpPostedFileBase img)
        {
           try
           {
                var path = "";
                var filename = "";
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/upload/img/news"), filename);
                        img.SaveAs(path);
                        news.img = filename; //Lưu ý
                    }
                    else
                    {
                        news.img = "logo.png";
                    }
                    news.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    news.meta = Functions.ConvertToUnSign(news.meta); //convert Tiếng Việt không dấu
                    news.order = getMaxOrder(news.categoryid);
                    db.news.Add(news);
                    db.SaveChanges();
                    return RedirectToAction("Index", "news", new { id = news.categoryid });
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return View(news);
        }

        // GET: admin/news/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news news = db.news.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            getCategory(news.categoryid);
            return View(news);
        }

        // POST: admin/news/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,categoryid,name,img,description,link,detail,meta,hide,order,datebegin")] news news, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                news temp = db.news.Find(news.id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/upload/img/news"), filename);
                        img.SaveAs(path);
                        temp.img = filename; //Lưu ý
                    }
                    // temp.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());                   
                    temp.name = news.name;
                    temp.description = news.description;
                    temp.meta = Functions.ConvertToUnSign(news.meta); //convert Tiếng Việt không dấu
                    temp.hide = news.hide;
                    temp.order = news.order;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                    return RedirectToAction("Index", "news", new { id = news.categoryid });
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return View(news);
        }

        // GET: admin/news/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news news = db.news.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: admin/news/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            news news = db.news.Find(id);
            db.news.Remove(news);
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

        public int getMaxOrder(long? CategoryId)
        {
            if (CategoryId == null)
                return 1;
            return db.news.Where(x => x.categoryid == CategoryId).Count();
        }
    }
}

