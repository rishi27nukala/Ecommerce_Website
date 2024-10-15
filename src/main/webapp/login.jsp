<%@page import="bean.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserDetails auth = (UserDetails) request.getSession().getAttribute("auth");
if (auth != null) {
    response.sendRedirect("home.jsp");
}
%>
<!doctype html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp"%>
    <title>Login & Registration</title>
    <style>
        body {
            background-color: #f8f9fa; 
        }

        .card-header {
            background-color: #BBA14F;
            color: white;
            font-size: 1.5rem;
        }

        .card-body {
            background-color: #ffffff; 
            border-radius: 8px;
        }

        .login-card {
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1); 
            border-radius: 8px;
            width: 100%;
            max-width: 650px;
            margin: auto;
        }

        .partition {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-group input {
            border-radius: 5px; 
        }

        .btn-primary {
            background-color: #007bff; 
        }

        .img-fluid {
            width: 100%; 
            height: auto; 
        }

        .large-image {
            width: 400px; 
            height: 400px; 
            object-fit: cover; 
        }

        .align-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px; 
        }

        .align-section h6 {
            margin: 0; 
        }
    </style>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>
    <div class="container my-5">
        <div class="card login-card">
        
            <div class="card-header text-center">User Login</div>

            <div class="card-body">
            
                <div class="row">
                    <div class="col-md-6 partition">
                        <img src="product-images/goldwatch2.gif" alt="Watch GIF" class="img-fluid large-image">
                    </div>

                    <div class="col-md-6">
                        <form action="user-login" method="post" onsubmit="return checkUserType();">
                            <div class="form-group my-3">
                                <label>Email Address</label>
                                <input type="email" class="form-control" name="login-email" placeholder="Enter your Email" required>
                            </div>

                            <div class="form-group my-3">
                                <label>Password</label>
                                <input type="password" class="form-control" name="login-password" placeholder="**********" required>
                            </div>

                            <div class="form-group my-3">
                                <label for="user-role">Select Role</label>
                                <select id="user-role" class="form-control" name="user-role" required>
                                    <option value="">Select User Type</option>
                                    <option value="User">User</option>
                                    <option value="Data Manager">Data Manager</option>
                                </select>
                            </div>

                            <div class="form-group my-3">
                                <input type="checkbox" id="terms" name="terms" required>
                                <label for="terms">I agree to the <a href="terms-and-conditions.jsp">Terms and Conditions</a></label>
                            </div>

                            <div class="form-group my-3 d-flex justify-content-between align-items-center">
                                <h6 class="mb-0 me-3">Forgot Password?</h6>
                                <a href="forgot-password.jsp" class="btn btn-link">Reset Password</a>
                            </div>

                            <div class="form-group my-3 d-flex justify-content-between align-items-center">
                                <h6 class="mb-0">No account?</h6>
                                <a href="register.jsp" class="btn btn-link">Create account</a>
                            </div>

                            <div class="text-center my-3">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>
