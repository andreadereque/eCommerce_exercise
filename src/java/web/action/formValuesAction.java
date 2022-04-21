/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.ViewManager;

/**
 *
 * @author entel
 */
public class formValuesAction extends Action{
    
    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String user = req.getParameter("user");
        String rating = req.getParameter("rating");
        String answer = req.getParameter("answer");
        String comment = req.getParameter("comment");
        req.setAttribute("user", user);
        req.setAttribute("rating", rating);
        req.setAttribute("answer", answer);
        req.setAttribute("comment", comment);
        ViewManager.nextView(req, resp, "/view/formValues.jsp");
    }

}
