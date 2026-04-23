using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cuahangtienloi
{
    
    public class CartItem
    {
        public string TenSP { get; set; }
        public double Gia { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get { return Gia * SoLuong; } }
    }

    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            
            Button btn = (Button)sender;
            string tenSanpham = btn.CommandArgument;

            
            double gia = 0;
            if (tenSanpham.Contains("Mì")) gia = 8000;
            else if (tenSanpham.Contains("Coca")) gia = 10000;
            else if (tenSanpham.Contains("Snack")) gia = 12000;
            else if (tenSanpham.Contains("Sữa")) gia = 7000;

           
            List<CartItem> gioHang = (List<CartItem>)Session["Cart"];

            
            if (gioHang == null)
            {
                gioHang = new List<CartItem>();
            }

            
            var item = gioHang.FirstOrDefault(x => x.TenSP == tenSanpham);
            if (item != null)
            {
                
                item.SoLuong++;
            }
            else
            {
               
                gioHang.Add(new CartItem { TenSP = tenSanpham, Gia = gia, SoLuong = 1 });
            }

            
            Session["Cart"] = gioHang;

            Response.Write("<script>alert('Đã thêm " + tenSanpham + " vào giỏ hàng của bạn!');</script>");
        }
    }
}