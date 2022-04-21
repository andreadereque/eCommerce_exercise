<%-- 
    Document   : category.jsp
    Created on : Apr 10, 2022, 10:37:18 AM
    Author     : entel
--%>

<%@page import="cart.ShoppingCart"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="model.CategoryModel"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>

<% int categoryId = Integer.parseInt(request.getParameterValues("categoryid")[0]); %>


<%
    CategoryModel category1 = (CategoryModel) getServletContext().getAttribute("categoryModel");
    String categoryName = category1.getNamefromId(categoryId);
    List<Category> categories = category1.retrieveAll();

    List<Product> items = (List<Product>) request.getAttribute("items");

    ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Categories Page</title>
    </head>
    <body>
        <h1>Products of <%=categoryName%> </h1>
        <img src="./img/cart.gif" alt="Cart"> <%=shoppingCart.getNumberOfItems()%> items
        <% if (shoppingCart.getNumberOfItems() != 0) { %>
        <a href="viewcart.do"> View Cart</a><br><br>
        <a href="checkout.do">Proceed to checkout</a>
        <%}%>
        <br><br>

        <%
            for (Category category : categories) {
        %>
    <tr>
        <td>
            <a href="category.do?categoryid=<%=category.getId()%>"><%=category.getName()%></a>
        </td>
    </tr>
    <%
        }
    %>


    <tr>

        <td>
            <table border="1" >
                <tr>
                    <td width="200">
                        <b>Product</b>
                    </td>
                    <td width="200">
                        <b>Name</b>
                    </td>
                    <td width="200">
                        <b>Price</b>
                    </td>
                    <td width="200">
                        <b>Add to chart</b>
                    </td>
                </tr>
                <%
                    for (Product product : items) {
                %>
                <tr>
                    <td>
                        <img src="./img/products/<%=product.getName()%>.png">
                    </td>
                    <td>
                        <b><%=product.getName()%></b><br>
                        <%=product.getDescription()%>
                    </td>
                    <td>
                        <%=product.getPrice()%>€
                    </td>
                    <td>
                        <form action="neworder.do" method="POST">
                            <input type="text" name="categoryid"
                                   value="<%=categoryId%>"
                                   hidden="true">
                            <input type="text" name="itemid" 
                                   value="<%=product.getId()%>" 
                                   hidden="true">
                            <input type="submit" value="Add to chart">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </td>
    </tr>

</body>
</html>
