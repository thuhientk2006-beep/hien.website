<%@ Page Title="Sản Phẩm - Cửa Hàng Tiện Lợi" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="cuahangtienloi.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        .welcome-section {
            text-align: center;
            padding: 40px 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .welcome-section h2 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .welcome-section p {
            font-size: 1.1rem;
            opacity: 0.95;
        }
        
        .search-filter-section {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
            align-items: center;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .search-box {
            flex: 1;
            min-width: 250px;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .search-box:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0,123,255,0.2);
        }
        
        .filter-select {
            padding: 10px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.95rem;
            transition: all 0.3s;
        }
        
        .filter-select:focus {
            outline: none;
            border-color: #007bff;
        }
        
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            padding: 20px;
        }
        
        .product-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        
        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }
        
        .product-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: bold;
            text-transform: uppercase;
            z-index: 10;
        }
        
        .badge-new {
            background: #28a745;
            color: white;
        }
        
        .badge-hot {
            background: #ff6b6b;
            color: white;
        }
        
        .wishlist-btn {
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(255,255,255,0.9);
            border: none;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.2rem;
            transition: all 0.3s;
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .wishlist-btn:hover {
            background: #ff6b6b;
            color: white;
            transform: scale(1.1);
        }
        
        .product-image-container {
            position: relative;
            width: 100%;
            height: 180px;
            overflow: hidden;
            background: #f8f9fa;
        }
        
        .product-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .product-card:hover img {
            transform: scale(1.05);
        }
        
        .product-info {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        
        .product-name {
            font-size: 1.1rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
            line-height: 1.3;
        }
        
        .product-description {
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 10px;
            line-height: 1.4;
            flex-grow: 1;
        }
        
        .product-rating {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 10px;
            font-size: 0.9rem;
        }
        
        .stars {
            color: #ffc107;
        }
        
        .rating-count {
            color: #999;
            font-size: 0.8rem;
        }
        
        .product-price {
            color: #d9534f;
            font-size: 1.3rem;
            font-weight: bold;
            margin-bottom: 12px;
        }
        
        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 12px;
            background: #f5f5f5;
            border-radius: 8px;
            padding: 5px;
        }
        
        .qty-btn {
            background: white;
            border: 1px solid #ddd;
            width: 28px;
            height: 28px;
            cursor: pointer;
            border-radius: 4px;
            font-weight: bold;
            transition: all 0.2s;
        }
        
        .qty-btn:hover {
            background: #007bff;
            color: white;
            border-color: #007bff;
        }
        
        .qty-input {
            flex: 1;
            border: none;
            background: transparent;
            text-align: center;
            font-weight: bold;
            width: 40px;
        }
        
        .qty-input:focus {
            outline: none;
        }
        
        .add-button {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
            transition: all 0.3s;
            font-size: 1rem;
        }
        
        .add-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,123,255,0.4);
        }
        
        .add-button:active {
            transform: translateY(0);
        }
        
        @media (max-width: 768px) {
            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }
            
            .search-filter-section {
                flex-direction: column;
            }
            
            .search-box {
                min-width: 100%;
            }
        }
    </style>
    <script>
        // Wishlist toggle
        function toggleWishlist(element) {
            element.style.color = element.style.color === 'rgb(255, 107, 107)' ? '#333' : '#ff6b6b';
        }

        // Quantity selector
        function updateQuantity(input, delta) {
            let val = parseInt(input.value) || 1;
            val = Math.max(1, val + delta);
            input.value = val;
        }

        // Filter & Search
        function filterProducts() {
            const searchText = document.getElementById('searchInput').value.toLowerCase();
            const sortValue = document.getElementById('sortSelect').value;
            const categoryValue = document.getElementById('categorySelect').value;
            const products = document.querySelectorAll('.product-card');

            let visibleProducts = [];

            products.forEach(product => {
                const name = product.querySelector('.product-name').textContent.toLowerCase();
                const category = product.dataset.category;
                const matchSearch = name.includes(searchText);
                const matchCategory = categoryValue === 'all' || category === categoryValue;

                if (matchSearch && matchCategory) {
                    product.style.display = 'flex';
                    product.style.animation = 'fadeIn 0.3s ease-in';
                    visibleProducts.push(product);
                } else {
                    product.style.display = 'none';
                }
            });

            // Sort visible products
            const parent = document.querySelector('.product-grid');
            if (sortValue === 'price-low') {
                visibleProducts.sort((a, b) => parseInt(a.dataset.price) - parseInt(b.dataset.price));
            } else if (sortValue === 'price-high') {
                visibleProducts.sort((a, b) => parseInt(b.dataset.price) - parseInt(a.dataset.price));
            } else if (sortValue === 'rating') {
                visibleProducts.sort((a, b) => parseFloat(b.dataset.rating) - parseFloat(a.dataset.rating));
            }

            // Reorder DOM
            visibleProducts.forEach(product => parent.appendChild(product));
        }

        // Quick view modal
        function quickView(productName, productDesc, price, rating, ratingCount) {
            const modal = document.getElementById('quickViewModal');
            if (!modal) return;

            modal.querySelector('.modal-product-name').textContent = productName;
            modal.querySelector('.modal-product-desc').textContent = productDesc;
            modal.querySelector('.modal-product-price').textContent = price;
            modal.querySelector('.modal-product-rating').innerHTML = `<span class="stars">${'★'.repeat(Math.floor(rating))}${'☆'.repeat(5 - Math.floor(rating))}</span> (${ratingCount})`;
            modal.style.display = 'block';
        }

        function closeModal() {
            const modal = document.getElementById('quickViewModal');
            if (modal) modal.style.display = 'none';
        }

        // Event listeners
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('searchInput');
            const sortSelect = document.getElementById('sortSelect');
            const categorySelect = document.getElementById('categorySelect');

            searchInput?.addEventListener('keyup', filterProducts);
            sortSelect?.addEventListener('change', filterProducts);
            categorySelect?.addEventListener('change', filterProducts);

            // Close modal on outside click
            window.addEventListener('click', function (event) {
                const modal = document.getElementById('quickViewModal');
                if (event.target === modal) closeModal();
            });
        });

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </script>
    
    <style>
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .breadcrumb {
            padding: 10px 20px;
            background: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }
        
        .breadcrumb a {
            color: #007bff;
            text-decoration: none;
            margin: 0 5px;
        }
        
        .breadcrumb a:hover {
            text-decoration: underline;
        }
        
        .benefits-section {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            flex-wrap: wrap;
        }
        
        .benefit-item {
            flex: 1;
            min-width: 150px;
            text-align: center;
            padding: 10px;
        }
        
        .benefit-icon {
            font-size: 2rem;
            margin-bottom: 8px;
        }
        
        .benefit-text {
            font-size: 0.9rem;
            color: #666;
            font-weight: 500;
        }
        
        .combo-section {
            margin-bottom: 40px;
        }
        
        .combo-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .combo-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }
        
        .combo-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border: 2px solid #ff6b6b;
            position: relative;
            animation: slideInUp 0.5s ease-out;
        }
        
        .combo-header {
            background: linear-gradient(135deg, #ff6b6b 0%, #ff5252 100%);
            color: white;
            padding: 15px;
            text-align: center;
        }
        
        .combo-price {
            font-size: 1.8rem;
            font-weight: bold;
        }
        
        .combo-items {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .combo-item {
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 8px 0;
            font-size: 0.9rem;
        }
        
        .combo-item::before {
            content: '✓';
            color: #28a745;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .combo-save {
            color: #ff6b6b;
            font-weight: bold;
            padding: 10px;
            text-align: center;
            background: #fff0f0;
            font-size: 0.9rem;
        }
        
        .combo-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #ff6b6b 0%, #ff5252 100%);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
        }
        
        .combo-btn:hover {
            transform: scale(1.02);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }
        
        .quick-view-btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 123, 255, 0.95);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            opacity: 0;
            transition: all 0.3s;
            z-index: 5;
        }
        
        .product-card:hover .quick-view-btn {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }
        
        .stock-status {
            color: #ff6b6b;
            font-size: 0.8rem;
            font-weight: bold;
            margin-top: 5px;
        }
        
        .discount-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: #ff6b6b;
            color: white;
            padding: 8px 12px;
            border-radius: 8px;
            font-weight: bold;
            z-index: 8;
            font-size: 0.9rem;
        }
        
        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            animation: fadeIn 0.3s ease-out;
        }
        
        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 30px;
            border-radius: 15px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            animation: slideInUp 0.3s ease-out;
        }
        
        .modal-close {
            color: #aaa;
            float: right;
            font-size: 2rem;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }
        
        .modal-close:hover {
            color: #000;
        }
        
        .modal-product-name {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 15px 0;
            color: #333;
        }
        
        .modal-product-price {
            font-size: 1.8rem;
            color: #ff6b6b;
            font-weight: bold;
            margin: 15px 0;
        }
        
        .modal-product-rating {
            color: #ffc107;
            margin: 10px 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Navigation -->
    <div class="breadcrumb">
        <a href="Default.aspx">🏠 Trang Chủ</a> > 
        <span>📦 Sản Phẩm</span>
    </div>

    <!-- Welcome Section -->
    <div class="welcome-section">
        <h2>🛒 Chào mừng bạn đến với Cửa Hàng Tiện Lợi</h2>
        <p>Hàng mới về mỗi ngày - Tươi ngon & Tiện lợi 24/7</p>
    </div>

    <!-- Benefits Section -->
    <div class="benefits-section">
        <div class="benefit-item">
            <div class="benefit-icon">🚚</div>
            <div class="benefit-text">Giao hàng nhanh trong 30 phút</div>
        </div>
        <div class="benefit-item">
            <div class="benefit-icon">↩️</div>
            <div class="benefit-text">Đổi trả trong 7 ngày</div>
        </div>
        <div class="benefit-item">
            <div class="benefit-icon">✅</div>
            <div class="benefit-text">Đảm bảo chất lượng 100%</div>
        </div>
        <div class="benefit-item">
            <div class="benefit-icon">🔒</div>
            <div class="benefit-text">Thanh toán an toàn</div>
        </div>
    </div>

    <!-- Search & Filter Section -->
    <div class="search-filter-section">
        <input type="text" class="search-box" id="searchInput" placeholder="🔍 Tìm kiếm sản phẩm..." />
        <select class="filter-select" id="sortSelect">
            <option value="popular">📊 Phổ biến nhất</option>
            <option value="price-low">💰 Giá: Thấp đến Cao</option>
            <option value="price-high">💸 Giá: Cao đến Thấp</option>
            <option value="newest">✨ Hàng mới nhất</option>
            <option value="rating">⭐ Đánh giá cao nhất</option>
        </select>
        <select class="filter-select" id="categorySelect">
            <option value="all">📁 Tất cả danh mục</option>
            <option value="food">🍜 Thực phẩm</option>
            <option value="drink">🥤 Thức uống</option>
            <option value="snack">🍿 Snack</option>
        </select>
    </div>

    <!-- Combo Deals Section -->
    <div class="combo-section">
        <div class="combo-title">🎁 Gói Combo Tiết Kiệm</div>
        <div class="combo-grid">
            <div class="combo-card">
                <div class="combo-header">
                    <div style="font-size: 1.2rem; margin-bottom: 8px;">Combo Sáng Tươi</div>
                    <div class="combo-price">32,000đ</div>
                </div>
                <div class="combo-items">
                    <div class="combo-item">Mì Ly Hảo Hảo (2)</div>
                    <div class="combo-item">Sữa Tươi Vinamilk (1)</div>
                    <div class="combo-item">Snack Khoai Tây (1)</div>
                </div>
                <div class="combo-save">💰 Tiết kiệm 3,000đ</div>
                <button class="combo-btn" onclick="alert('Thêm combo vào giỏ!')">🛒 Thêm Combo Vào Giỏ</button>
            </div>

            <div class="combo-card">
                <div class="combo-header">
                    <div style="font-size: 1.2rem; margin-bottom: 8px;">Combo Thức Uống</div>
                    <div class="combo-price">22,000đ</div>
                </div>
                <div class="combo-items">
                    <div class="combo-item">Coca Cola 330ml (2)</div>
                    <div class="combo-item">Nước Ép Cam Tươi (1)</div>
                </div>
                <div class="combo-save">💰 Tiết kiệm 3,000đ</div>
                <button class="combo-btn" onclick="alert('Thêm combo vào giỏ!')">🛒 Thêm Combo Vào Giỏ</button>
            </div>

            <div class="combo-card">
                <div class="combo-header">
                    <div style="font-size: 1.2rem; margin-bottom: 8px;">Combo Snack & Chocolate</div>
                    <div class="combo-price">28,000đ</div>
                </div>
                <div class="combo-items">
                    <div class="combo-item">Snack Khoai Tây Lays (2)</div>
                    <div class="combo-item">Chocolate Lindt Premium (1)</div>
                </div>
                <div class="combo-save">💰 Tiết kiệm 2,000đ</div>
                <button class="combo-btn" onclick="alert('Thêm combo vào giỏ!')">🛒 Thêm Combo Vào Giỏ</button>
            </div>
        </div>
    </div>

    <!-- Products Grid -->
    <div class="product-grid">
        <!-- Sản phẩm 1 -->
        <div class="product-card" data-price="8000" data-category="food" data-rating="4.8">
            <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
            <span class="product-badge badge-new">Mới</span>
            <span class="discount-badge">-10%</span>
            <button class="quick-view-btn" onclick="quickView('Mì Ly Hảo Hảo', 'Mì ăn liền tuyệt ngon, hương vị đậm đà. Nấu nước sôi 3 phút là ăn được!', '8,000đ', 4.8, '142')">👁️ Xem chi tiết</button>
            <div class="product-image-container">
                <img src="Images/mihaohao.jpg" alt="Mì Ly Hảo Hảo" />
            </div>
            <div class="product-info">
                <div class="product-name">Mì Ly Hảo Hảo</div>
                <div class="product-description">Mì ăn liền tuyệt ngon, hương vị đậm đà. Nấu nước sôi 3 phút là ăn được!</div>
                <div class="product-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-count">(142 đánh giá)</span>
                </div>
                <div class="product-price">8,000đ</div>
                <div class="stock-status">✅ Còn 245 sản phẩm</div>
                <div class="quantity-selector">
                    <button class="qty-btn" onclick="updateQuantity(this.nextElementSibling, -1)">−</button>
                    <input type="number" class="qty-input" value="1" min="1" max="100" />
                    <button class="qty-btn" onclick="updateQuantity(this.previousElementSibling, 1)">+</button>
                </div>
                <asp:Button ID="btnMì" runat="server" Text="🛒 Thêm vào giỏ" CssClass="add-button" 
                    OnClick="btnAddToCart_Click" CommandArgument="Mì Ly Hảo Hảo" />
            </div>
        </div>

        <!-- Sản phẩm 2 -->
        <div class="product-card" data-price="10000" data-category="drink" data-rating="4.5">
            <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
            <span class="product-badge badge-hot">Hot</span>
            <span class="discount-badge">-15%</span>
            <button class="quick-view-btn" onclick="quickView('Coca Cola 330ml', 'Nước ngọt thanh mát, sảng khoái. Hương vị quen thuộc yêu thích của hàng triệu người.', '10,000đ', 4.5, '89')">👁️ Xem chi tiết</button>
            <div class="product-image-container">
                <img src="Images/cocacola.jpg" alt="Coca Cola 330ml" />
            </div>
            <div class="product-info">
                <div class="product-name">Coca Cola 330ml</div>
                <div class="product-description">Nước ngọt thanh mát, sảng khoái. Hương vị quen thuộc yêu thích của hàng triệu người.</div>
                <div class="product-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-count">(89 đánh giá)</span>
                </div>
                <div class="product-price">10,000đ</div>
                <div class="stock-status">✅ Còn 567 sản phẩm</div>
                <div class="quantity-selector">
                    <button class="qty-btn" onclick="updateQuantity(this.nextElementSibling, -1)">−</button>
                    <input type="number" class="qty-input" value="1" min="1" max="100" />
                    <button class="qty-btn" onclick="updateQuantity(this.previousElementSibling, 1)">+</button>
                </div>
                <asp:Button ID="btncocacola" runat="server" Text="🛒 Thêm vào giỏ" CssClass="add-button" 
                    OnClick="btnAddToCart_Click" CommandArgument="Coca Cola 330ml" />
            </div>
        </div>

        <!-- Sản phẩm 3 -->
        <div class="product-card" data-price="12000" data-category="snack" data-rating="4.6">
            <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
            <button class="quick-view-btn" onclick="quickView('Snack Khoai Tây Lays', 'Snack giòn tan, vị mặn đậm đà. Lý tưởng để ăn vặt hoặc khi xem phim.', '12,000đ', 4.6, '156')">👁️ Xem chi tiết</button>
            <div class="product-image-container">
                <img src="Images/snack.jpg" alt="Snack Khoai Tây Lays" />
            </div>
            <div class="product-info">
                <div class="product-name">Snack Khoai Tây Lays</div>
                <div class="product-description">Snack giòn tan, vị mặn đậm đà. Lý tưởng để ăn vặt hoặc khi xem phim.</div>
                <div class="product-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-count">(156 đánh giá)</span>
                </div>
                <div class="product-price">12,000đ</div>
                <div class="stock-status">✅ Còn 389 sản phẩm</div>
                <div class="quantity-selector">
                    <button class="qty-btn" onclick="updateQuantity(this.nextElementSibling, -1)">−</button>
                    <input type="number" class="qty-input" value="1" min="1" max="100" />
                    <button class="qty-btn" onclick="updateQuantity(this.previousElementSibling, 1)">+</button>
                </div>
                <asp:Button ID="btnsnack" runat="server" Text="🛒 Thêm vào giỏ" CssClass="add-button" 
                    OnClick="btnAddToCart_Click" CommandArgument="Snack Khoai Tây Lays" />
            </div>
        </div>

        <!-- Sản phẩm 4 -->
        <div class="product-card" data-price="7000" data-category="drink" data-rating="4.7">
            <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
            <span class="product-badge badge-new">Mới</span>
            <button class="quick-view-btn" onclick="quickView('Sữa Tươi Vinamilk', 'Sữa tươi nguyên chất, bổ dưỡng và tươi ngon. Giàu canxi cho sức khỏe.', '7,000đ', 4.7, '203')">👁️ Xem chi tiết</button>
            <div class="product-image-container">
                <img src="Images/sua1.jpg" alt="Sữa Tươi Vinamilk" />
            </div>
            <div class="product-info">
                <div class="product-name">Sữa Tươi Vinamilk</div>
                <div class="product-description">Sữa tươi nguyên chất, bổ dưỡng và tươi ngon. Giàu canxi cho sức khỏe.</div>
                <div class="product-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-count">(203 đánh giá)</span>
                </div>
                <div class="product-price">7,000đ</div>
                <div class="stock-status">✅ Còn 128 sản phẩm</div>
                <div class="quantity-selector">
                    <button class="qty-btn" onclick="updateQuantity(this.nextElementSibling, -1)">−</button>
                    <input type="number" class="qty-input" value="1" min="1" max="100" />
                    <button class="qty-btn" onclick="updateQuantity(this.previousElementSibling, 1)">+</button>
                </div>
                <asp:Button ID="btnsua" runat="server" Text="🛒 Thêm vào giỏ" CssClass="add-button" 
                    OnClick="btnAddToCart_Click" CommandArgument="Sữa Tươi Vinamilk" />
            </div>
        </div>

        <!-- Sản phẩm 5 -->
        <div class="product-card" data-price="15000" data-category="drink" data-rating="4.9">
            <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
            <span class="product-badge badge-hot">Hot</span>
            <span class="discount-badge">-20%</span>
            <button class="quick-view-btn" onclick="quickView('Nước Ép Cam Tươi', 'Nước ép cam 100% tươi, giàu vitamin C. Tốt cho sức khỏe và năng lượng.', '15,000đ', 4.9, '98')">👁️ Xem chi tiết</button>
            <div class="product-image-container">
                <img src="Images/cocacola.jpg" alt="Nước ép cam tươi" />
            </div>
            <div class="product-info">
                <div class="product-name">Nước Ép Cam Tươi</div>
                <div class="product-description">Nước ép cam 100% tươi, giàu vitamin C. Tốt cho sức khỏe và năng lượng.</div>
                <div class="product-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-count">(98 đánh giá)</span>
                </div>
                <div class="product-price">15,000đ</div>
                <div class="stock-status">✅ Còn 95 sản phẩm</div>
                <div class="quantity-selector">
                    <button class="qty-btn" onclick="updateQuantity(this.nextElementSibling, -1)">−</button>
                    <input type="number" class="qty-input" value="1" min="1" max="100" />
                    <button class="qty-btn" onclick="updateQuantity(this.previousElementSibling, 1)">+</button>
                </div>
                <asp:Button ID="btnNuocEp" runat="server" Text="🛒 Thêm vào giỏ" CssClass="add-button" 
                    OnClick="btnAddToCart_Click" CommandArgument="Nước Ép Cam Tươi" />
            </div>
        </div>

        <!-- Sản phẩm 6 -->
        <div class="product-card" data-price="18000" data-category="snack" data-rating="4.4">
            <button class="wishlist-btn" onclick="toggleWishlist(this)">🤍</button>
            <span class="discount-badge">-5%</span>
            <button class="quick-view-btn" onclick="quickView('Chocolate Lindt Premium', 'Chocolate cao cấp nhập khẩu, vị ngon tuyệt vời. Quà tặng hoàn hảo.', '18,000đ', 4.4, '76')">👁️ Xem chi tiết</button>
            <div class="product-image-container">
                <img src="Images/snack.jpg" alt="Chocolate Lindt" />
            </div>
            <div class="product-info">
                <div class="product-name">Chocolate Lindt Premium</div>
                <div class="product-description">Chocolate cao cấp nhập khẩu, vị ngon tuyệt vời. Quà tặng hoàn hảo.</div>
                <div class="product-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-count">(76 đánh giá)</span>
                </div>
                <div class="product-price">18,000đ</div>
                <div class="stock-status">⚠️ Chỉ còn 12 sản phẩm</div>
                <div class="quantity-selector">
                    <button class="qty-btn" onclick="updateQuantity(this.nextElementSibling, -1)">−</button>
                    <input type="number" class="qty-input" value="1" min="1" max="100" />
                    <button class="qty-btn" onclick="updateQuantity(this.previousElementSibling, 1)">+</button>
                </div>
                <asp:Button ID="btnChoco" runat="server" Text="🛒 Thêm vào giỏ" CssClass="add-button" 
                    OnClick="btnAddToCart_Click" CommandArgument="Chocolate Lindt Premium" />
            </div>
        </div>
    </div>

    <!-- Quick View Modal -->
    <div id="quickViewModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeModal()">&times;</span>
            <div class="modal-product-name"></div>
            <div class="modal-product-rating"></div>
            <div class="modal-product-price"></div>
            <div style="color: #666; margin: 15px 0; line-height: 1.6;" class="modal-product-desc"></div>
            <div style="display: flex; gap: 10px; margin-top: 20px;">
                <input type="number" value="1" min="1" style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 1rem;" />
                <button onclick="closeModal()" style="flex: 2; padding: 10px 20px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; font-weight: bold;">🛒 Thêm vào giỏ</button>
            </div>
        </div>
    </div>
</asp:Content>