using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HPCakes.Help;
using HPCakes.Models;

namespace HPCakes.Areas.admin.Controllers
{
    public class news_commentsController : Controller
    {
        private cakeshopEntities db = new cakeshopEntities();

        // GET: admin/news_comments
        public ActionResult Index()
        {
            var news_comments = db.news_comments.Include(n => n.news).Include(n => n.news_comments2);
            return View(news_comments.ToList());
        }


        // GET: admin/news_comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news_comments news_comments = db.news_comments.Find(id);
            if (news_comments == null)
            {
                return HttpNotFound();
            }
            return View(news_comments);
        }

        // GET: admin/news_comments/Create
        public ActionResult Create()
        {
            List<SelectListItem> replyList = new List<SelectListItem>
            {
                new SelectListItem { Text = "--------- No reply ---------", Value = "" },
                // Các SelectListItem khác nếu cần
            };
            var reply_id = db.news_comments.ToList();
            foreach (var comment in reply_id)
            {
                replyList.Add(new SelectListItem { Text = comment.username, Value = comment.id.ToString() });
            }
            ViewBag.ReplyList = replyList;
            ViewBag.news_id = new SelectList(db.news, "id", "name");
            ViewBag.reply_id = new SelectList(db.news_comments, "id", "username");
            return View();
        }

        // POST: admin/news_comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,news_id,reply_id,username,img,email,message,order,hide,datebegin")] news_comments news_comments, HttpPostedFileBase img)
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
                        path = Path.Combine(Server.MapPath("~/Content/upload/img/comment"), filename);
                        img.SaveAs(path);
                        news_comments.img = filename; //Lưu ý
                    }
                    else
                    {
                        news_comments.img = "comment/comment-1.jpg";
                    }
                    news_comments.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    db.news_comments.Add(news_comments);
                    db.SaveChanges();
                    return RedirectToAction("Index", "news_comments");
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
            return View(news_comments);
        }

        // GET: admin/news_comments/Edit/5
        public ActionResult Edit(int? id)
        {
            List<SelectListItem> replyList = new List<SelectListItem>
            {
                new SelectListItem { Text = "--------- No reply ---------", Value = "" },
                // Các SelectListItem khác nếu cần
            };
            var reply_id = db.news_comments.ToList();
            foreach (var comment in reply_id)
            {
                replyList.Add(new SelectListItem { Text = comment.username, Value = comment.id.ToString() });
            }
            ViewBag.ReplyList = replyList;


            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news_comments news_comments = db.news_comments.Find(id);
            if (news_comments == null)
            {
                return HttpNotFound();
            }
            ViewBag.news_id = new SelectList(db.news, "id", "name", news_comments.news_id);
            ViewBag.reply_id = new SelectList(db.news_comments, "id", "username", news_comments.reply_id);
            return View(news_comments);
        }

        // POST: admin/news_comments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,news_id,reply_id,username,img,email,message,order,hide,datebegin")] news_comments news_comments, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                news_comments temp = db.news_comments.Find(news_comments.id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        //filename = Guid.NewGuid().ToString() + img.FileName;
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/upload/img/comment"), filename);
                        img.SaveAs(path);
                        temp.img = filename; //Lưu ý
                    }
                    temp.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());                   
                    temp.username = news_comments.username;
                    temp.email = news_comments.email;
                    temp.message = news_comments.message;
                    temp.reply_id = news_comments.reply_id;
                    temp.news_id = news_comments.news_id;
                    temp.hide = news_comments.hide;
                    temp.order = news_comments.order;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    //return RedirectToAction("Index");
                    return RedirectToAction("Index", "news_comments");
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
            return View(news_comments);
        }

        // GET: admin/news_comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            news_comments news_comments = db.news_comments.Find(id);
            if (news_comments == null)
            {
                return HttpNotFound();
            }
            return View(news_comments);
        }

        // POST: admin/news_comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult DeleteConfirmed(int id)
        {
            news_comments news_comments = db.news_comments.Find(id);
            db.news_comments.Remove(news_comments);
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
