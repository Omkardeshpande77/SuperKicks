<%@page import="java.util.List"%>
<%@page import="sneakers.product.dao.ProductDao"%>
<%@page import="sneakers.product.entities.product"%>
<%@page import="sneakers.product.entities.Message"%>
<%@page import="sneakers.product.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("Login_page.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>SuperKicks-Admin Page</title>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        <%            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>
        <!----------------------------------------------------------------Navbar Ends--------------------------------------------------->

        <div class="container admin">
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card ">
                        <div class="card-body text-center">
                            <img style="max-height: 250px;max-width: 400px;" class="card-img-top img-fluid " src="img/teamwork.png" alt="Card image cap">

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center" style=" color: white !important">
                            <img  style="max-height: 250px;max-width: 400px;" class="card-img-top" src="img/product.png" alt="Card image cap">

                        </div>
                    </div>
                </div>
                <div class="col-md-4"style="background: #000 !important;">
                    <div class="card">
                        <div class="card-body text-center">
                            <img  style="max-height: 250px;max-width: 400px;" class="card-img-top" src="img/online-shopping.png" alt="Card image cap">

                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-md-6">
                    <div class="card align-items-center  cardop" data-toggle="modal" data-target="#add-category-modal" style="background: black !important;">
                        <div class="card-body text-center" >
                            <h1>Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card align-items-center cardop" data-toggle="modal" data-target="#add-product-modal"style="background: black !important;">
                        <div class="card-body text-center">
                            <h1>Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-md-6">
                    <div class="card align-items-center  cardop" data-toggle="modal" data-target="#delete-category-modal" style="background: black !important;">
                        <div class="card-body text-center" >
                            <h1>Delete Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card align-items-center cardop" data-toggle="modal" data-target="#delete-product-modal"style="background: black !important;">
                        <div class="card-body text-center">
                            <h1>Delete Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-------------------------------------------------------------Modal----------------------------------------------------->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill The Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="categoryServlet"id="cat-form">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle"  placeholder="Enter Category Title" required="true"/>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter Category Decription" name="catDescription" ></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success" type="submit">Add Category</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-------------------------------------------------------------Modal Ends----------------------------------------------------->
        <!-------------------------------------------------------------Modal Starts----------------------------------------------------->




        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details...</h5>
                        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body bg-dark text-white">
                        <form action="ProductServlet" method="post" enctype="multipart/form-data" id="Productform">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Name of Product" name="pName"/>
                            </div>
                            <div class="form-group">
                                <textarea name="pDesc" class="form-control" style="height: 200px" placeholder="Enter Decription of your Product"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Price of Product" name="pPrice" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Price of Quantity" name="pQuantity" required="true"/>
                            </div>

                            <div class="form-group">
                                <select name="catId" id=""class="form-control">

                                    <%
                                        for (Category c : list1) {

                                    %>
                                    <option value=<%= c.getCategoryId()%>><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="#pPic">Add a Picture of your Product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required />
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-secondary ">Add Product</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer bg-dark">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!-------------------------------------------------------------Modal Ends----------------------------------------------------->
        <!-------------------------------------------------------------Modal Starts----------------------------------------------------->

        <!-- Modal -->
        <div class="modal fade" id="delete-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <%
                                ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());

                                List<product> plist = pdao.getAllProduct();

                                for (product p : plist) {
                            %>

                            <div class="col-4"><%= p.getpName()%></div>
                            <div class="col-4">₹<%= p.getpPrice()%></div>
                            <div class="col-4"><a  href="DeletePost?pid=<%= p.getpId()%>"type="button" onclick="" class="btn btn-danger">Delete</a></div>
                            <hr>
                            
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <!-- comment -->

                            <% }%>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-------------------------------------------------------------Modal Ends----------------------------------------------------->
        <!-------------------------------------------------------------Modal Starts----------------------------------------------------->

        <!-- Modal -->



        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="delete-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <%
                                CategoryDao cdao = new CategoryDao(ConnectionProvider.getConnection());
                                List<Category> clist = cdao.getAllCategories();

                                for (Category c : clist) {
                            %>
                            <div class="col-6"><%= c.getCategoryTitle()%></div>
                            <div class="col-6"><a  href="DeleteCategory?cid=<%= c.getCategoryId()%>"type="button" onclick="" class="btn btn-danger">Delete</a>
                                <br>
                                <br>
                                <br>
                            </div>



                            <% }%>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>





        <!-------------------------------------------------------------Modal Ends----------------------------------------------------->

        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...")
                $('#cat-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({
                        url: "categoryServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            if (data.trim() === 'Succesfully Added')
                            {
//                               swal("Registered successfully...","We are going to redirect to login page","success")
//                                       .then((value) => {
//                                            window.location = "Login_page.jsp"
//                                        });
                                swal("Good job!", "We are redirecting you to the login page", "success").then(function () {
                                    window.location = "Admin_page.jsp";
                                });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });

                $('#Productform').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({
                        url: "ProductServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            if (data.trim() === 'done')
                            {
//                               swal("Registered successfully...","We are going to redirect to login page","success")
//                                       .then((value) => {
//                                            window.location = "Login_page.jsp"
//                                        });
                                swal("Good job!", "We are redirecting you to the login page", "success").then(function () {
                                    window.location = "Admin_page.jsp";
                                });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });

            });
        </script>
    </body>
</html>
