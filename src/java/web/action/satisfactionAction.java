/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.ViewManager;

/**
 *
 * @author entel
 */
public class satisfactionAction extends Action{
        
    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        
        ViewManager.nextView(req, resp, "/view/satisfactionsurvey.jsp");
    }    
        
}
        
  
