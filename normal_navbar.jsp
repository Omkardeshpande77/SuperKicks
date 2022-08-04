<%@page import="java.util.ArrayList"%>
<%@page import="sneakers.product.entities.Category"%>
<%@page import="sneakers.product.helper.ConnectionProvider"%>
<%@page import="sneakers.product.dao.CategoryDao"%>
<%@page import="sneakers.product.entities.User"%>
<%
    User user1 = (User) session.getAttribute("currentUser");
%>    

<!-- ------------------------------------------Navbar-------------------------------------------- -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">
        <img src="img/Untitled.png" width="50" height="50" class="d-inline-block align-top" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu bg-dark " aria-labelledby="navbarDropdown">
                    <%
                        CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list1 = catDao.getAllCategories();
                        for (Category cc : list1) {
                    %>
                    <a class="dropdown-item" href="#"style="color:gray"><%= cc.getCategoryTitle()%></a>
                    <%
                        }
                    %>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-2 mr-auto">
            <input class="form-control mr-sm-2" style="width: 300px;" type="search" placeholder="Search"
                   aria-label="Search">
        </form>
        <ul class="navbar-nav ml-auto">

            <%
                if (user1 == null) {
            %>

            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#navCartMod"> <span ><i class="fa fa-cart-plus"></i> Cart(0)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Login_page.jsp"> <span><i class="fa fa-user-circle"></i></span> LogIn</a>
            </li>

            <%
            } else {
            %>
             <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#cart-modal"> <span class="cart-items"><i class="fa fa-cart-plus">Cart(0)</i> </span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user"> </span> <%= user1.getName()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"><span><i class="fa fa-sign-out"></i> </span> LogOut</a>
            </li>
            <%
                }
            %>
        </ul>

    </div>
</nav>
<!-- --------------------------------------Navbar Ends---------------------------------------------- -->

<div class="modal fade" id="navCartMod" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Please LogIn First...</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-primary"><a href="Login_page.jsp" style="text-decoration: none; color: white">LogIn</a></button>
      </div>
    </div>
  </div>
</div>