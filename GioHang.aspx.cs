using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cuahangtienloi
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chỉ hiển thị dữ liệu khi trang được nạp lần đầu
            if (!IsPostBack)
            {
                LoadGiỏHang();
            }
        }

        private void LoadGiỏHang()
        {
            // Lấy giỏ hàng từ Session. 
            List<CartItem> gioHang = (List<CartItem>)Session["Cart"];

            if (gioHang != null && gioHang.Count > 0)
            {
                gvGioHang.DataSource = gioHang;
                gvGioHang.DataBind();

                double tongTien = gioHang.Sum(x => x.ThanhTien);
                lblTongTien.Text = tongTien.ToString("N0");
            }
            else
            {
                // Nếu giỏ trống thì xóa dữ liệu bảng và hiện số 0
                gvGioHang.DataSource = null;
                gvGioHang.DataBind();
                lblTongTien.Text = "0";
            }
        }

        // 1. HÀM XỬ LÝ KHI BẤM NÚT XÓA
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string tenCanXoa = btn.CommandArgument;

            List<CartItem> gioHang = (List<CartItem>)Session["Cart"];
            if (gioHang != null)
            {
                // Tìm món hàng có tên trùng để xóa
                var item = gioHang.FirstOrDefault(x => x.TenSP == tenCanXoa);
                if (item != null)
                {
                    gioHang.Remove(item);
                }

                // Cập nhật lại Session và load lại bảng cho mới
                Session["Cart"] = gioHang;
                LoadGiỏHang();
            }
        }

        
        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            List<CartItem> gioHang = (List<CartItem>)Session["Cart"];

            if (gioHang != null && gioHang.Count > 0)
            {
               
                Response.Write("<script>alert('Thanh toán thành công! Đơn hàng của bạn đang được xử lý.');</script>");

                Session["Cart"] = null;

               
                Response.Write("<script>window.location='Default.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Giỏ hàng trống, bạn mua thêm đồ nhé!');</script>");
            }
        }
    }
}