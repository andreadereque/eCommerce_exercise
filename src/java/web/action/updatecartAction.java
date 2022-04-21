/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import cart.ShoppingCart;
import entity.Product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductModel;
import web.ViewManager;

/**
 *
 * @author entel
 */
public class updatecartAction extends Action{
    ProductModel productModel;

    public updatecartAction(ProductModel productModel)
    {
        this.productModel = productModel;
    }

    public void perform(HttpServletRequest req, HttpServletResponse resp) 
    {   
        int iditem = 0;
        String quantity = "";
        ShoppingCart shoppingcart = null;
        Product product = null;
        
        iditem = Integer.parseInt(req.getParameterValues("itemid")[0]);
        quantity = (String) req.getParameterValues("quantity")[0];
        product = productModel.retrieveById(iditem);
        
        shoppingcart = (ShoppingCart) req.getSession().getAttribute("shoppingCart");
        shoppingcart.update(product, quantity);
        
        ViewManager.nextView(req, resp, "/view/viewcart.jsp");
    }
}
