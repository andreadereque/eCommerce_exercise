<%-- 
    Document   : formValues
    Created on : Apr 10, 2022, 1:05:54 PM
    Author     : entel
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Satisfaction Survey Summary</title>
    </head>
    <body>
        <h1>Form Values</h1>
        <table border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">
            <tr>
                <td width="150px" valign="center" align="middle" class="columna">
                 Client: 
                </td>
                <td> 
                 <% String user = (String) getServletContext().getAttribute("user");%>
                 <%=user%>
                </td>
                </tr>
              <tr> 
                 <td width="150px" valign="center" align="middle" class="columna">
                 Rating: 
                </td> 
                <td>
                 <% String rating = (String) getServletContext().getAttribute("rating");%>
                 <%=rating%>
                </td>
                </tr>
                <tr> 
                 <td width="300px" valign="center" align="middle"class="columna">
                 First time in our ecommerceApp: 
                </td> 
                <td>
                 <% String answer = (String) getServletContext().getAttribute("answer");%>
                 <%= answer%>
                </td>
                </tr>
                <tr>
                <td width="150px" valign="center" align="middle"class="columna">
                 Comment: 
                </td>    
                <td>
                <% String comment = (String) getServletContext().getAttribute("comment");%>
                <% if (comment != null ) { %>
                <%= comment%>
                <% } else { %>
                  No hay respuesta
                <% } %>
                </td>
                </tr>    
        </table>
                <a href="viewcart.do"> View Cart</a><br><br>
                <a href="checkout.do">Proceed to checkout</a>
    </body>
</html>
