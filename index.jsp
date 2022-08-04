<%@page import="sneakers.product.helper.Helper"%>
<%@page import="sneakers.product.entities.product"%>
<%@page import="java.util.List"%>
<%@page import="sneakers.product.dao.ProductDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="sneakers.product.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/homestyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Super Kicks - Sneaker Shopee</title>

        
    </head>

    <body>
        <!-- ------------------------------------------Navbar-------------------------------------------- -->

        <%@include file="normal_navbar.jsp" %>
        <!-- --------------------------------------Navbar Ends---------------------------------------------- -->
        <!-- banner section starts  -->

        <section class="banner" id="banner">

            <div class="content">
                <span>Welcome to </span>
                <h3>Super Kicks Shoe Mart</h3>
                <p>Welcome to <span>SUPERKICKS</span> where we provide you with trusted quality branded & Original Sneakers.</p>
                <a href="BuyPage.jsp" class="btn-home" style="text-decoration: none">shop now</a>
            </div>

            <div class="image">
                <img src="img/banner-product.png" alt="">
            </div>

        </section>

        <!-- banner section ends -->
        <!--product section-->
        
        
        <!--product section ends-->
        <!-- --------------------------------------Cart Modal  Starts---------------------------------------------- -->

        <div class="modal fade" id="cart-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Your Cart is Ready</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="cart-body">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-cart">Check out</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- --------------------------------------Cart Modal Ends---------------------------------------------- -->




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="JS/Script.js" type="text/javascript"></script>
    </body>
</html>