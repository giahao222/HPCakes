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
    public class orders_detailController : Controller
    {
        private cakeshopEntities db = new cakeshopEntities();

        // GET: admin/orders_detail
        public ActionResult Index(long? id)
        {
            /*if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }*/

            // Lấy các sản phẩm thuộc về đơn hàng có id tương ứng
            var orders_detail = db.orders_detail.Include(o => o.product).Include(o => o.order)
                                .Where(o => o.order_id == id);

            if (orders_detail == null)
            {
                return HttpNotFound();
            }
            ViewBag.OrderId = id;
            return View(orders_detail.ToList());
        }


        // GET: admin/orders_detail/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            orders_detail orders_detail = db.orders_detail.Find(id);
            ViewBag.OrderId = id;
            if (orders_detail == null)
            {
                return HttpNotFound();
            }
            return View(orders_detail);
        }

        // GET: admin/orders_detail/Create
        public ActionResult Create(long? id)
        {
            ViewBag.OrderId = id;
            orders_detail orders_detail = db.orders_detail.Find(id);
            ViewBag.product_id = new SelectList(db.products, "id", "name");
            ViewBag.order_id = new SelectList(db.orders, "id", "customerName");
            return View(orders_detail);
        }

        // POST: admin/orders_detail/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,order_id,product_id,quantity,price,total")] orders_detail orders_detail)
        {
            if (ModelState.IsValid)
            {

                db.orders_detail.Add(orders_detail);
                db.SaveChanges();

                var orderId = orders_detail.order_id;
                var totalOrder = db.orders_detail.Where(o => o.order_id == orderId).Sum(o => o.total);
                var order = db.orders.Find(orderId);
                order.totalAmount = totalOrder;
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index", "orders_detail", new { id = orders_detail.order_id });
            }

            ViewBag.product_id = new SelectList(db.products, "id", "name", orders_detail.product_id);
            ViewBag.order_id = new SelectList(db.orders, "id", "name", orders_detail.order_id);
            return View(orders_detail);
        }

        // GET: admin/orders_detail/Edit/5
        public ActionResult Edit(int? id, long? order_id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.OrderId = order_id;
            orders_detail orders_detail = db.orders_detail.Find(id);
            if (orders_detail == null)
            {
                return HttpNotFound();
            }


            // Tính tổng tiền của hóa đơn
            var totalOrder = db.orders_detail.Where(o => o.order_id == order_id).Sum(o => o.total);
            var order = db.orders.Find(order_id);
            order.totalAmount = totalOrder;
            ViewBag.product_id = new SelectList(db.products, "id", "name", orders_detail.product_id);
            ViewBag.order_id = new SelectList(db.orders, "id", "customerName", orders_detail.order_id);
            return View(orders_detail);
        }

        // POST: admin/orders_detail/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,order_id,product_id,quantity,price,total")] orders_detail orders_detail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(orders_detail).State = EntityState.Modified;
                db.SaveChanges();

                // Lấy id của hóa đơn từ chi tiết đơn hàng
                long? orderId = orders_detail.order_id;

                // Tính tổng tiền của hóa đơn
                var totalOrder = db.orders_detail.Where(o => o.order_id == orderId).Sum(o => o.total);
                var order = db.orders.Find(orderId);
                order.totalAmount = totalOrder;
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "orders_detail", new { id = orders_detail.order_id });
            }
            ViewBag.product_id = new SelectList(db.products, "id", "name", orders_detail.product_id);
            ViewBag.order_id = new SelectList(db.orders, "id", "customerName", orders_detail.order_id);
            return View(orders_detail);
        }

        // GET: admin/orders_detail/Delete/5
        public ActionResult Delete(int? id, long? order_id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            orders_detail orders_detail = db.orders_detail.Find(id);
            ViewBag.OrderId = order_id;
            if (orders_detail == null)
            {
                return HttpNotFound();
            }
            return View(orders_detail);
        }

        // POST: admin/orders_detail/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            orders_detail orders_detail = db.orders_detail.Find(id);
            db.orders_detail.Remove(orders_detail);
            db.SaveChanges();
            return RedirectToAction("Index", "orders_detail", new { id = orders_detail.order_id });
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
