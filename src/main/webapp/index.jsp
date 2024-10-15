<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time Space - Welcome</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #fff;
            color: #343F4F;
            padding: 0 35px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 3rem;
            color: #343F4F;
            margin-bottom: 20px;
        }

        p.slogan {
            font-size: 1.5rem;
            margin-top: 20px;
            margin-bottom: 40px;
            text-align: center;
            color: #555;
            font-family: 'Poppins', sans-serif;
            font-size: 2rem;
            
        }

        h2 {
        	margin-left: 50px;
            font-size: 2rem;
            margin-top: 40px;
            color: #343F4F;
            margin-bottom: 20px;
        }

        .wrapper {
        	margin-top:-15px;
            display: flex;
            max-width: 1200px;
            position: relative;
            margin-bottom: 50px;
        }

        .wrapper i {
            top: 50%;
            height: 44px;
            width: 44px;
            color: #343F4F;
            cursor: pointer;
            font-size: 1.15rem;
            position: absolute;
            text-align: center;
            line-height: 44px;
            background: #f2f2f2;
            border-radius: 50%;
            transform: translateY(-50%);
            transition: background 0.1s linear;
        }

        .wrapper i:hover {
            background: #ddd;
        }

        .wrapper i:first-child {
            left: -22px;
        }

        .wrapper i:last-child {
            right: -22px;
        }

        .wrapper .carousel {
            font-size: 0px;
            cursor: pointer;
            overflow: hidden;
            white-space: nowrap;
            scroll-behavior: smooth;
        }

        .carousel .item {
            display: inline-block; /* Make item inline-block */
            text-align: center; /* Center text under the image */
            width:calc(100% /4);
            margin: 0 6px; /* Add horizontal margin for spacing */
        }

        .carousel img {
            height: 350px;
            object-fit: contain;
            user-select: none;
            width: 100%; /* Full width of the item */
            cursor: pointer; /* Change cursor to pointer for the image */
        }

        .carousel .name {
            font-size: 1rem; /* Adjust font size for product name */
            margin-top: -15px; /* Space between image and name */
            color: #343F4F; /* Dark color for product name */
        }

        .carousel .price {
            font-size: 1.2rem; /* Adjust font size for price */
            color: #f05454; /* Color for price */
        }

        button.shop-now {
            padding: 15px 30px;
            background-color: #f05454;
            color: white;
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 40px;
            text-transform: uppercase;
        }

        button.shop-now:hover {
            background-color: #f77f7f;
        }
        .btn-primary {
        background-color: #007bff; /* Bootstrap primary color */
        border-color: #007bff;
    }
    </style>
</head>
<body>
    <div class="container">
		<img src="product-images/Screenshot (364).png" alt="Logo" width="300" height="60" style="margin-left:35px;margin-top:10px;margin-bottom:5px;" class="d-inline-block align-text-top">
		<p class="slogan">Find Your Time in Our Space - Where Every Moment Tells a Story</p>

        <h2>Recommended for You</h2>
        <div class="wrapper">
            <i id="left" class="fa-solid fa-angle-left"></i>
            <div id="carousel" class="carousel">
                <div class="item">
                    <a href="home.jsp">
                        <img src="product-images/Screenshot_20241013_220706_Google.jpg" alt="Product 1" draggable="false">
                    </a>
                    <div class="name">Product 1 Name</div>
                    <div class="price">&#8377;999.99</div>
                </div>
                <div class="item">
                    <a href="home.jsp">
                        <img src="product-images/Screenshot_20241013_220706_Google.jpg" alt="Product 2" draggable="false">
                    </a>
                    <div class="name">Product 2 Name</div>
                    <div class="price">&#8377;2999.99</div>
                </div>
                <div class="item">
                    <a href="home.jsp">
                        <img src="product-images/Screenshot_20241013_220706_Google.jpg" alt="Product 3" draggable="false">
                    </a>
                    <div class="name">Product 3 Name</div>
                    <div class="price">&#8377;4999.00</div>
                </div>
                <div class="item">
                    <a href="home.jsp">
                        <img src="product-images/Screenshot_20241013_220706_Google.jpg" alt="Product 4" draggable="false">
                    </a>
                    <div class="name">Product 4 Name</div>
                    <div class="price">&#8377;1659.99</div>
                </div>
                <div class="item">
                    <a href="home.jsp">
                        <img src="product-images/Screenshot_20241013_220706_Google.jpg" alt="Product 5" draggable="false">
                    </a>
                    <div class="name">Product 5 Name</div>
                    <div class="price">$59.99</div>
                </div>
            </div>
            <i id="right" class="fa-solid fa-angle-right"></i>
        </div>

    <script>
        const carousel1 = document.getElementById('carousel');
        document.getElementById('left').onclick = () => carousel1.scrollLeft -= carousel1.offsetWidth / 3;
        document.getElementById('right').onclick = () => carousel1.scrollLeft += carousel1.offsetWidth / 3;
    </script>
</body>
</html>
