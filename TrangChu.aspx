<%@ Page Title="Trang Chủ - Cửa Hàng Tiện Lợi" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cuahangtienloi.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
            padding: 100px 20px;
            position: relative;
            overflow: hidden;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('Images/mihaohao.jpg') no-repeat center center;
            background-size: cover;
            opacity: 0.1;
            z-index: 1;
        }
        .hero-section > * {
            position: relative;
            z-index: 2;
        }
        .hero-section h2 {
            font-size: 3rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }
        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .cta-button {
            display: inline-block;
            padding: 15px 30px;
            background-color: #ff6b6b;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .cta-button:hover {
            background-color: #ff5252;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }
        .cta-button.secondary {
            background-color: #4ecdc4;
        }
        .cta-button.secondary:hover {
            background-color: #45b7aa;
        }
        .features-section {
            padding: 60px 20px;
            background-color: #f8f9fa;
        }
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .feature-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .feature-card h3 {
            color: #333;
            margin-bottom: 15px;
        }
        .feature-card p {
            color: #666;
        }
        .stats-section {
            padding: 40px 20px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            text-align: center;
        }
        .stats-grid {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }
        .stat-item h4 {
            font-size: 2rem;
            margin-bottom: 5px;
        }
        .stat-item p {
            font-size: 1.1rem;
        }
        .carousel-section {
            padding: 60px 20px;
            background-color: #fff;
        }
        .carousel-container {
            max-width: 1200px;
            margin: 0 auto;
            overflow: hidden;
            position: relative;
        }
        .carousel {
            display: flex;
            transition: transform 0.5s ease;
        }
        .carousel-item {
            min-width: 100%;
            box-sizing: border-box;
            padding: 20px;
            text-align: center;
        }
        .carousel-item img {
            width: 100%;
            max-width: 300px;
            height: 200px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .carousel-item h3 {
            margin: 20px 0 10px;
            color: #333;
        }
        .carousel-item p {
            color: #666;
            font-size: 1.1rem;
        }
        .carousel-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .carousel-button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s;
        }
        .carousel-button:hover {
            background: #0056b3;
        }
        .testimonials-section {
            padding: 60px 20px;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
        }
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .testimonial-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
            position: relative;
        }
        .testimonial-card::before {
            content: '"';
            font-size: 4rem;
            color: #007bff;
            position: absolute;
            top: -10px;
            left: 20px;
        }
        .testimonial-text {
            font-style: italic;
            color: #555;
            margin-bottom: 20px;
        }
        .testimonial-author {
            font-weight: bold;
            color: #333;
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .fade-in-up {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('.carousel-item');
        const totalSlides = slides.length;

        function showSlide(index) {
            const carousel = document.querySelector('.carousel');
            carousel.style.transform = `translateX(-${index * 100}%)`;
        }

        function nextSlide() {
            currentSlide = (currentSlide + 1) % totalSlides;
            showSlide(currentSlide);
        }

        function prevSlide() {
            currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
            showSlide(currentSlide);
        }

        document.addEventListener('DOMContentLoaded', function () {
            showSlide(currentSlide);
            setInterval(nextSlide, 5000); // Auto slide every 5 seconds
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-section">
        <h2>🏪 Chào Mừng Đến Với Cửa Hàng Tiện Lợi!</h2>
        <p>Mua sắm dễ dàng, tiện lợi 24/7 với hàng ngàn sản phẩm chất lượng cao.</p>
        <p>🚚 Giao hàng nhanh chóng - 💳 Thanh toán an toàn - ⭐ Đánh giá 5 sao</p>
        <div class="cta-buttons">
            <a href="SanPham.aspx" class="cta-button">🛒 Khám Phá Sản Phẩm</a>
            <a href="GioHang.aspx" class="cta-button secondary">🛍️ Xem Giỏ Hàng</a>
        </div>
    </div>

    <div class="features-section">
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">🚚</div>
                <h3>Giao Hàng Nhanh</h3>
                <p>Giao hàng trong vòng 30 phút tại khu vực nội thành.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💳</div>
                <h3>Thanh Toán An Toàn</h3>
                <p>Nhiều phương thức thanh toán, bảo mật 100%.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">⭐</div>
                <h3>Chất Lượng Đảm Bảo</h3>
                <p>Sản phẩm tươi ngon, nguồn gốc rõ ràng.</p>
            </div>
        </div>
    </div>

    <div class="stats-section">
        <div class="stats-grid">
            <div class="stat-item">
                <h4>10,000+</h4>
                <p>Khách Hàng Hài Lòng</p>
            </div>
            <div class="stat-item">
                <h4>5,000+</h4>
                <p>Sản Phẩm Đa Dạng</p>
            </div>
            <div class="stat-item">
                <h4>24/7</h4>
                <p>Hỗ Trợ Online</p>
            </div>
        </div>
    </div>

    <div class="carousel-section">
        <h2 style="text-align: center; color: #333; margin-bottom: 40px;">Sản Phẩm Nổi Bật</h2>
        <div class="carousel-container">
            <div class="carousel">
                <div class="carousel-item">
                    <img src="Images/mihaohao.jpg" alt="Mì Ly Hảo Hảo" />
                    <h3>Mì Ly Hảo Hảo</h3>
                    <p>Món ăn nhanh tiện lợi, hương vị tuyệt vời.</p>
                </div>
                <div class="carousel-item">
                    <img src="Images/cocacola.jpg" alt="Coca Cola" />
                    <h3>Coca Cola 330ml</h3>
                    <p>Nước ngọt giải khát, sảng khoái tức thì.</p>
                </div>
                <div class="carousel-item">
                    <img src="Images/snack.jpg" alt="Snack Lays" />
                    <h3>Snack Khoai Tây Lays</h3>
                    <p>Snack giòn tan, nhiều vị ngon miệng.</p>
                </div>
                <div class="carousel-item">
                    <img src="Images/sua1.jpg" alt="Sữa" />
                    <h3>Sữa Tươi</h3>
                    <p>Sữa tươi nguyên chất, bổ dưỡng cho sức khỏe.</p>
                </div>
            </div>
        </div>
        <div class="carousel-buttons">
            <button type="button" class="carousel-button" onclick="prevSlide(); return false;">Trước</button>
            <button type="button" class="carousel-button" onclick="nextSlide(); return false;">Tiếp</button>
        </div>
    </div>

    <div class="testimonials-section">
        <h2 style="text-align: center; color: #333; margin-bottom: 40px;">Ý Kiến Khách Hàng</h2>
        <div class="testimonials-grid">
            <div class="testimonial-card fade-in-up">
                <p class="testimonial-text">Cửa hàng tiện lợi này thật tuyệt vời! Giao hàng nhanh và sản phẩm chất lượng cao.</p>
                <p class="testimonial-author">- Nguyễn Văn A</p>
            </div>
            <div class="testimonial-card fade-in-up">
                <p class="testimonial-text">Tôi luôn tin tưởng mua sắm ở đây. Giá cả hợp lý và dịch vụ khách hàng xuất sắc.</p>
                <p class="testimonial-author">- Trần Thị B</p>
            </div>
            <div class="testimonial-card fade-in-up">
                <p class="testimonial-text">Sản phẩm đa dạng, tươi ngon. Rất hài lòng với trải nghiệm mua sắm online.</p>
                <p class="testimonial-author">- Lê Văn C</p>
            </div>
        </div>
    </div>
</asp:Content>