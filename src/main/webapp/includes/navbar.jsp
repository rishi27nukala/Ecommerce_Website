<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid" style="border-radius: 5px 5px 0 0; margin-left: 100px;">
        <a class="navbar-brand" href="home.jsp">
            <img src="product-images/Screenshot (364).png" alt="Logo" width="250" height="50" class="d-inline-block align-text-top">
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
            <form class="d-flex me-auto my-2 my-lg-0" style="margin-left:200px" action="search" method="get">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="query" required>
                <button class="btn btn-primary text-black rounded-pill px-3" type="submit" style="width:30%; height:40px">Search</button>
            </form>

            <ul class="navbar-nav mb-2 mb-lg-0 mx-5">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart
                        <span class="badge bg-dark px-1">${ cart_list.size() }</span>
                    </a>
                </li>
                <% if (auth != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="orders.jsp">Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="log-out">Logout</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>