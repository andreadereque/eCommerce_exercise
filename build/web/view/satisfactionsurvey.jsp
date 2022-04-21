<%-- 
    Document   : satisfactionsurvey
    Created on : Apr 10, 2022, 11:20:57 AM
    Author     : entel
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>


    <body>

        <form name="form1" action="formValues.do" method="post" 
              onsubmit="return validation(this)">
            <input type="hidden" name="oculto" value="valorOculto"/>


            <table width="600" id="enfasis-columna" border = "1">
                <caption>
                    Satisfaction Survey
                </caption>
                <tr>
                    <td class="columna">
                        Client: (*)
                    </td>
                    <td>
                        <input class="default" type="text" name="user" 
                               value="Write your user" onfocus="this.select()"/>
                    </td>
                </tr>
                <tr>
                    <td class="columna">
                        Rating: (*)
                    </td>
                    <td>
                        1 <input type="checkbox" name="rating" value="1">
                        &nbsp;&nbsp;&nbsp;
                        2 <input type="checkbox" name="rating" value="2">
                        &nbsp;&nbsp;&nbsp;
                        3 <input type="checkbox" name="rating" value="3">
                        &nbsp;&nbsp;&nbsp;
                        4 <input type="checkbox" name="rating" value="4">
                        &nbsp;&nbsp;&nbsp;
                        5 <input type="checkbox" name="rating" value="5">
                    </td>
                </tr>
                <tr>
                    <td class="columna">
                        First time on our ecommerce app? (*)
                    </td>
                    <td>
                        Yes<input type="radio" name="answer" value="Y">
                        &nbsp;&nbsp;&nbsp;
                        No<input type="radio" name="answer" value="N">
                    </td>
                </tr>      
                <tr>
                    <td class="columna">
                        Things to improve:
                    </td>
                    <td>
                        <textarea name="Comments" cols="30" rows="2"
                                  class="default" onfocus="this.select()">
                            Write here...
                        </textarea>
                    </td>
                </tr>
                <tr style="text-align: center">
                    <td>
                        <input type="reset" value="Clean" class="default">
                    </td>
                    <td>
                       <a href="formValues.do"></a> <input type="submit" value="Send" class="default"> 
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
