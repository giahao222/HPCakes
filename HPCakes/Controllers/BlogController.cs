using HPCakes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Data.Entity.Validation;
using System.IO;

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
            ViewBag.NewsId = id;
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

        public ActionResult getBlogCate()
        {
            ViewBag.meta = "tin-tuc";
            var v = from t in _db.categories
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getBlogComment(long? id)
        {
            ViewBag.id = id;
            var v = from t in _db.news_comments
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult getBlogSaveComment()
        {
           
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult getBlogSaveComment([Bind(Include = "id,news_id,reply_id,username,img,email,message,order,hide,datebegin")] news_comments comment, HttpPostedFileBase img)
        {
            try
            {
                string path = "";
                string filename = "";
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Content/upload/img/comment"), filename);
                        img.SaveAs(path);
                        comment.img = filename;
                    }
                    else
                    {
                        comment.img = "comment/comment-1.jpg";
                    }
                    comment.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    comment.news_id = comment.id;
                    comment.hide = true;
                    comment.order = 1;
                    

                    _db.news_comments.Add(comment);
                    _db.SaveChanges();

                    // Lấy thông tin về tin tức liên quan để chuyển hướng
                    var news = _db.news.FirstOrDefault(n => n.id == comment.news_id);
                    if (news != null)
                    {
                        // Tạo URL dựa trên thông tin của tin tức
                        string returnUrl = $"/tin-tuc/{news.meta}/{news.id}";

                        // Thực hiện chuyển hướng đến URL mới
                        return Redirect(returnUrl);
                    }
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
           
            // Nếu không thành công, chuyển hướng về trang chủ hoặc trang nào đó khác
            return Content("<script>alert('Failed to submit comment. Please try again later.'); window.location = '/tin-tuc';</script>");

        }


    }
}
