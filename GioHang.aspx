<%@ Page Title="Giỏ Hàng" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="cuahangtienloi.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cart-container { padding: 30px; max-width: 900px; margin: 0 auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .table-cart { width: 100%; border-collapse: collapse; margin-top: 20px; border: 1px solid #eee; }
        .table-cart th { background-color: #007bff; color: white; padding: 15px; }
        .table-cart td { padding: 12px; border-bottom: 1px solid #eee; text-align: center; }
        .total-section { text-align: right; margin-top: 30px; border-top: 2px solid #eee; padding-top: 20px; }
        .total-label { font-size: 1.2rem; font-weight: bold; }
        .total-amount { font-size: 1.8rem; color: #e74c3c; font-weight: bold; margin-left: 10px; }
        .btn-checkout { background-color: #28a745; color: white; border: none; padding: 12px 25px; border-radius: 5px; cursor: pointer; font-size: 1rem; margin-left: 15px; }
        .btn-back { color: #007bff; text-decoration: none; font-weight: bold; }
        .btn-xoa { color: #d9534f; text-decoration: none; font-weight: bold; }
        .btn-xoa:hover { color: #c9302c; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-container">
        <h2 style="border-bottom: 2px solid #007bff; padding-bottom: 10px;">Giỏ Hàng Của Bạn 🛒</h2>
        
        <asp:GridView ID="gvGioHang" runat="server" CssClass="table-cart" AutoGenerateColumns="False" GridLines="None">
            <Columns>
                <asp:BoundField DataField="TenSP" HeaderText="Tên Sản Phẩm" />
                <asp:BoundField DataField="Gia" HeaderText="Đơn Giá" DataFormatString="{0:N0}đ" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" DataFormatString="{0:N0}đ" />
                
                <%-- CỘT NÚT XÓA ĐÃ CHÈN VÀO ĐÂY --%>
                <asp:TemplateField HeaderText="Thao tác">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnXoa" runat="server" Text="Xóa" CssClass="btn-xoa"
                            CommandArgument='<%# Eval("TenSP") %>' OnClick="btnXoa_Click" 
                            OnClientClick="return confirm('Bạn chắc chắn muốn xóa món này?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="total-section">
            <span class="total-label">Tổng thanh toán:</span>
            <asp:Label ID="lblTongTien" runat="server" CssClass="total-amount" Text="0"></asp:Label><span class="total-amount">đ</span>
            
            <div style="margin-top: 25px;">
                <a href="Default.aspx" class="btn-back">← Tiếp tục mua sắm</a>
                <%-- ĐÃ THÊM OnClick CHO NÚT THANH TOÁN --%>
                <asp:Button ID="btnThanhToan" runat="server" Text="Thanh Toán Ngay" CssClass="btn-checkout" OnClick="btnThanhToan_Click" />
            </div>
        </div>
    </div>
</asp:Content>