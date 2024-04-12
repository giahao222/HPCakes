using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HPCakes.Models;
using Microsoft.Ajax.Utilities;

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

        private decimal CalculateDiscountedPrice(decimal totalPrice, int discountPercent)
        {
            decimal discountAmount = totalPrice * discountPercent / 100;
            return totalPrice - discountAmount;
        }

        [HttpPost]
        public ActionResult CheckVoucher(string voucher)
        {
            /*// Kiểm tra xem voucher có tồn tại trong cơ sở dữ liệu không
            bool isVoucherValid = CheckVoucherInDatabase(voucher);

            // Trả về kết quả dưới dạng JSON
            return Json(new { success = isVoucherValid });*/

            // Kiểm tra xem voucher có tồn tại trong cơ sở dữ liệu không
            var existingVoucher = _db.Vouchers.FirstOrDefault(v => v.Code == voucher);

            if (existingVoucher != null)
            {
                // Nếu voucher tồn tại, lấy giá trị của cột value
                int discountPercent = existingVoucher.Value;

                // Lấy tổng tiền trước giảm giá từ session hoặc tính toán từ giỏ hàng
                decimal totalPriceBeforeDiscount = CalculateTotalPriceBeforeDiscount();

                // Tính toán giảm giá dựa trên tỷ lệ phần trăm và cập nhật tổng tiền cần thanh toán
                decimal totalPriceAfterDiscount = CalculateDiscountedPrice(totalPriceBeforeDiscount, discountPercent);

                // Trả về kết quả dưới dạng JSON
                return Json(new { success = true, totalPriceAfterDiscount = totalPriceAfterDiscount });
            }

            // Trả về kết quả nếu voucher không hợp lệ
            return Json(new { success = false });
        }

        private bool CheckVoucherInDatabase(string voucher)
        {
            // Thực hiện kiểm tra voucher trong cơ sở dữ liệu ở đây
            // Trả về true nếu voucher hợp lệ, ngược lại trả về false
            var check = _db.vouchers.FirstOrDefault(v => v.name == voucher);
            // Trả về true nếu voucher được tìm thấy, ngược lại trả về false
            return check != null;
        }


    }
}