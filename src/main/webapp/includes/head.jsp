<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
    body {
        background-color: #ffffff; /* Light teal color for background */
        font-family: Arial, sans-serif; /* Set a clean font */
        margin: 0; /* Remove default margin */
        padding: 0; /* Remove default padding */
    }
    .card-img-top {
    width: 100%; /* Makes the image fill the width of the card */
    height: 300px; /* Fixed height to ensure uniformity */
    object-fit: cover; /* Maintains aspect ratio while covering the area */
}
    

    /* Navbar styling */
    .navbar {
        background-color: #000000; /* Teal color for navbar */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Optional shadow for navbar */
    }

    .navbar-brand img {
        max-height: 60px; /* Adjust the height of the logo */
    }
	.nav-item {
		font-size:18px;
    	margin-right: 20px; /* Adjust the space between each item */
    	color: #ffffff;      /* Dark purple text color */
	}
    .nav-link {
        color: #3c3c3c; !important; /* Dark purple for links */
        font-weight:none;
    }

    .nav-link:hover {
        color: #3c3c3c !important; /* Teal on hover */
    }

    /* Badge styling */
    .badge {
        background-color: #3c3c3c; /* Badge color matching logo */
    }

    /* Container for main content */
    .container {
        max-width: 1200px; /* Limit the maximum width */
        margin: auto; /* Center the container */
        padding: 20px; /* Add padding around */
    }

    /* Card styling */
    .card {
        background-color: #efefef; /* White background for cards */
        border: 1px solid #3c3c3c; /* Light purple border */
        border-radius: 10px; /* Rounded corners */
        transition: box-shadow 0.3s; /* Smooth transition for shadow */
    }

    .card:hover {
        box-shadow: #3c3c3c; /* Shadow on hover */
    }

    .card-title {
        color: #3c3c3c; /* Dark purple for card titles */
        font-weight: bold; /* Bold titles */
    }

    .price {
        color: #3c3c3c; /* Price color */
        font-weight: bold; /* Bold price */
    }

    .category {
        color: #3c3c3c; /* Light purple for category */
    }

    /* Button styling */
    .btn-dark {
        background-color: white; /* Dark purple button */
        color: black; /* White text */
    	border-color: black; /* Border width, style, and color */
        border-radius: 3px; /* Rounded corners */
        transition: background-color 0.3s; /* Smooth transition for background */
    }
    .btn-primary{
    	background-color: #BBA14F !important; /* Keep the same background color */
    	color: black; /* Keep the text color consistent */
    	outline: none; /* Remove focus outline (optional) */
    	box-shadow: none; /* Disable any default shadow effects */
	}

}
</style>


