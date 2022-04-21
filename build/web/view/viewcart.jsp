<%-- 
    Document   : viewcart
    Created on : Apr 10, 2022, 10:38:12 AM
    Author     : entel
--%>

<%@page import="cart.*"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>

<%
    ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cart Page</title>
    </head>
    <body>
        <img src="./img/cart.gif" alt="Cart"> <%=shoppingCart.getNumberOfItems() %> items<br>
        <h1>Your shopping cart contains <%=shoppingCart.getNumberOfItems() %> items</h1>
        <% if (shoppingCart.getNumberOfItems() > 0) { %>
        <a href="clearcart.do">Clear Cart</a><br><br>
        <a href="init.do">Continue Shopping</a><br><br>
        <a href="satisfaction.do">Satisfaction survey</a><br><br>
        <form action="https://paypal.me/andreadereque?country.x=ES&locale.x=es_ES" method="post"> 
            <%-- pongo el link asi porque almenos hace algo, ok?--%>
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="andrea.de.requesens@estudiantat.upc.edu">
            <input type="hidden" name="item_name" value="eCommerce Cart">
            <input type="hidden" name="currency_code" value="EUR">
            <input type="hidden" name="amount" value="<%=shoppingCart.getTotal() %>">
            <input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif" 
                   name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
        </form><br>
        <table border="1" widht="100">
            <tr>
                <th>Product</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>                       
            <% for (ShoppingCartItem item : shoppingCart.getItems()){ %>
            <tr>
                <td>
                    <img src="./img/products/<%=item.getProduct().getName()%>.png">
                </td>
                <td>
                    <b><%=item.getProduct().getName()%></b><br>
                    <%=item.getProduct().getDescription()%>
                </td>
                <td><%=item.getProduct().getPrice()%> €/unit</td>
                <td>
                    <form action="updatecart.do" >
                        <input type="text" name="itemid" 
                               value="<%=item.getProduct().getId()%>" 
                               hidden="true">
                        <input type="number" name="quantity" 
                               value="<%=item.getQuantity()%>">
                        <br>
                        <input type="submit" value="update">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <br>
        <b>Total amount: <%=shoppingCart.getTotal() %> €</b>
        <% } else { %>
        <img src="./img/empty-cart.gif" alt="Empty Cart"<br><br>
        <a href="init.do">Start shopping</a><br>
        <% } %>
    </body>
</html>
