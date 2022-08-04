<%@page import="sneakers.product.helper.Helper"%>
<%@page import="sneakers.product.entities.product"%>
<%@page import="java.util.List"%>
<%@page import="sneakers.product.dao.UserDao" %>
<%@page import="sneakers.product.entities.User"%>
<%@page import="sneakers.product.dao.ProductDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="sneakers.product.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
%> 
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Super Kicks - Sneaker Shopee</title>
        
        
        
    </head>

    <body>
        <!-- ------------------------------------------Navbar-------------------------------------------- -->

        <%@include file="normal_navbar.jsp" %>
        <!-- --------------------------------------Navbar Ends---------------------------------------------- -->
        <!-- --------------------------------------Carousel Starts---------------------------------------------- -->

        <div class="container-fluid primary-background" >

            <div id="carouselExampleIndicators" class="carousel slide" style="width: 100%;" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" style="height: 600px; " src="img/Untitled.png"
                             alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 600px;" src="img/imagesnik.jfif" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 600px;" src="img/images.jfif" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 600px;" src="img/download.jfif" alt="Fourth slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <!-- --------------------------------------Carousel Ends---------------------------------------------- -->
        <br>
        <br>
        <!-- --------------------------------------products Strts---------------------------------------------- -->

        <div class="row mt-4 mx-2">

            <%                String Cate = request.getParameter("Category");
//                out.println(Cate);
                ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());

                List<product> list = null;
                if (Cate == null || Cate.trim().equals("All")) {
                    list = pdao.getAllProduct();
                } else {
                    list = pdao.getProductByCatId(Integer.parseInt(Cate));
                }

                CategoryDao cdao = new CategoryDao(ConnectionProvider.getConnection());
                List<Category> clist = cdao.getAllCategories();
            %>


            <!--Show Categories-->
            <div class="col-md-2">


                <div class="list-group">
                    <a href="BuyPage.jsp?Category=All" class="list-group-item list-group-item-action active bg-dark border-0">
                        All Sneakers
                    </a>




                    <!--<h1><%= clist.size()%></h1>-->

                    <%

                        for (Category c : clist) {
                    %>

                    <a href="BuyPage.jsp?Category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                    <%
                        }

                    %>

                </div>

            </div>


            <!--Show Product-->
            <div class="col-md-10">

                <!--rows-->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%                               for (product p : list) {
                            %>
                            <a  href="Showproduct.jsp?pid=<%= p.getpId() %>">
                            <div class="card" data-toggle="modal" >
                                <img class="card-img-top" src="productimg/<%= p.getpPhoto()%>" style="max-height: 270px ; max-width: 100%" alt="Card image cap">
                                <div class="card-body">
                                    <form>
                                        <h5 class="card-title" name="pname"><%= p.getpName()%></h5>
                                        <p class="card-text"> <%= Helper.get10Words(p.getpDecs())%></p>

                                        <h3>₹ <%= p.getpPrice()%></h3>
                                        <% 
                                            if (user == null) {
                                        %>
                                        <button class="btn btn-dark disabled " onclick="add_to_cart(<%=p.getpId()%>, '<%= p.getpName()%>',<%= p.getpPrice()%>)" >Add to Cart</button>
                                        
                                        <% 
                                            }
                                            else{
                                        %>
                                        <button class="btn btn-dark" onclick="add_to_cart(<%=p.getpId()%>, '<%= p.getpName()%>',<%= p.getpPrice()%>)" >Add to Cart</button>
                                        <% } %>
                                </div>
                            </div>
                            </a>
                                
                                

                                
                                
                                
                                
                                
                            <%

                                }
                                if (list.size() == 0) {
                            %>
                            <h1 style="color: red">No Product of this Category Yet...</h1>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- --------------------------------------products Ends---------------------------------------------- -->
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

                                          <!-- Modal -->
                                         

        

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