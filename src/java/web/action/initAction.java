/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import cart.ShoppingCart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryModel;
import web.ViewManager;

/**
 *
 * @author entel
 */
public class initAction extends Action {
    CategoryModel categoryModel;

    public initAction(CategoryModel categoryModel)
    {
        this.categoryModel = categoryModel;
    }

    public void perform(HttpServletRequest req, HttpServletResponse resp) 
    {
        if (req.getAttribute("categories") == null)
            req.setAttribute("categories", categoryModel.retrieveAll());
        
        if (req.getSession().getAttribute("shoppingCart") == null)
            req.getSession().setAttribute("shoppingCart", new ShoppingCart());
        
        ViewManager.nextView(req, resp, "/view/init.jsp");
    }
}
