using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HPCakes.Models;
using Microsoft.Ajax.Utilities;
using static HPCakes.Controllers.CartController;

namespace HPCakes.Controllers
{
    public class CartController : Controller
    {
        cakeshopEntities _db = new cakeshopEntities();

        // GET: Cart
        public ActionResult Index()
        {
            List<product> cartItems = Session["CartItems"] as List<product> ?? new List<product>();
            return View(cartItems);
        }

        [HttpPost]
        public ActionResult CheckOut(List<CartItem> cartItems)
        {
            if (cartItems == null || !cartItems.Any())
            {
                return Json(new { success = false, message = "Giỏ hàng trống." });
            }

            var sessionId = Session.SessionID;
            List<product> sessionCartItems = Session["CartItems"] as List<product>;

            if (sessionCartItems == null || !sessionCartItems.Any())
            {
                return Json(new { success = false, message = "Giỏ hàng trong session trống." });
            }

            foreach (var item in cartItems)
            {
                var sessionProduct = sessionCartItems.FirstOrDefault(p => p.id == item.ProductId);
                if (sessionProduct != null)
                {
                    bill newCart = new bill
                    {
                        session_id = sessionId,
                        product_id = sessionProduct.id,
                        name = sessionProduct.name,
                        price = sessionProduct.price,
                        quantity = item.Quantity,
                        voucher = item.Voucher,
                        subtotal = item.Subtotal,
                        total = item.Total
                    };
                    _db.bills.Add(newCart);
                }
            }

            _db.SaveChanges();

            return Json(new { success = true, message = "Thanh toán thành công." });
        }

        public ActionResult Bill()
        {
            var sessionId = Session.SessionID;
            var v = from t in _db.bills
                    where t.session_id == sessionId
                    select t;
            return PartialView(v.ToList());
        }

        [HttpPost]
        public ActionResult AddToCart(int productId)
        {
            // Ở đây, bạn có thể thực hiện các bước xử lý để thêm sản phẩm vào giỏ hàng,
            // như lưu thông tin sản phẩm vào Session hoặc Database.

            // Ví dụ: Lưu productId vào Session để biểu diễn giỏ hàng
            product prod = GetProductFromDatabase(productId);
            List<product> productsList = Session["CartItems"] as List<product>;
            if (productsList == null)
            {
                productsList = new List<product>();
                Session["CartItems"] = productsList;
            }

            productsList.Add(prod);

            return Json(new { success = true }); // Trả về một JSON object để xử lý trong JavaScript
        }

        private product GetProductFromDatabase(int productId)
        {
            // Khởi tạo đối tượng DbContext (hoặc bất kỳ cơ chế nào để kết nối đến cơ sở dữ liệu)
            using (var dbContext = new cakeshopEntities())
            {
                // Thực hiện truy vấn để lấy thông tin sản phẩm từ cơ sở dữ liệu
                var product = dbContext.products.FirstOrDefault(p => p.id == productId);

                // Kiểm tra xem sản phẩm có tồn tại không
                if (product != null)
                {
                    // Trả về sản phẩm nếu tồn tại
                    return product;
                }
                else
                {
                    // Nếu sản phẩm không tồn tại, bạn có thể trả về một giá trị mặc định hoặc xử lý theo cách khác
                    return null;
                }
            }
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int productId)
        {
            // Lấy giỏ hàng từ Session
            List<product> cartItems = Session["CartItems"] as List<product>;

            // Tìm và xóa sản phẩm khỏi giỏ hàng
            product productToRemove = cartItems.FirstOrDefault(p => p.id == productId);
            if (productToRemove != null)
            {
                cartItems.Remove(productToRemove);
            }

            // Cập nhật lại giỏ hàng trong Session
            Session["CartItems"] = cartItems;

            // Trả về kết quả thành công
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult CheckVoucher(string voucher)
        {
            // Kiểm tra xem voucher có tồn tại trong cơ sở dữ liệu không
            var existingVoucher = _db.vouchers.FirstOrDefault(v => v.name == voucher);

            if (existingVoucher != null)
            {
                // Trả về giá trị của voucher nếu voucher hợp lệ
                return Json(new { success = true, voucherValue = existingVoucher.value });
            }

            // Trả về kết quả nếu voucher không hợp lệ
            return Json(new { success = false });
        }

        // Action để lấy Session ID
        public ActionResult SessionInfo()
        {
            var sessionId = Session.SessionID;
            return Content($"Session ID: {sessionId}");
        }

        public class CartItem
        {
            public int ProductId { get; set; }
            public int Quantity { get; set; }
            public int Voucher { get; set; }
            public int Subtotal { get; set; }
            public int Total { get; set; }
        }

        public ActionResult Orders(string Name, string Phone, string Address, int Total)
        {
            var sessionId = Session.SessionID;
            
            order newOrders = new order
            {
                customerName = Name,
                totalAmount = Total,
                address = Address,
            };
            _db.orders.Add(newOrders);

            _db.SaveChanges();

            var orders_id = _db.orders.OrderByDescending(o => o.id).FirstOrDefault().id;

            var bills = _db.bills.Where(b => b.session_id == sessionId).ToList();
            if (bills == null || !bills.Any())
            {
                return Json(new { success = false, message = "Không có hóa đơn nào cho session này." }, JsonRequestBehavior.AllowGet);
            }

            foreach (var b in bills)
            {
                orders_detail newOrders_detail = new orders_detail
                {
                    order_id = orders_id,
                    product_id = b.product_id,
                    quantity = b.quantity,
                    price = b.price
                };
                _db.orders_detail.Add(newOrders_detail);
            }

            _db.SaveChanges();

            return Json(new { success = true, message = "Thanh toán thành công." });
        }


    }
}