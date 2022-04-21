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
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

/**
 *
 * @author entel
 */
public class neworderAction extends Action{
    CategoryModel categoryModel;
    ProductModel productsModel;

    public neworderAction(CategoryModel categoryModel, ProductModel productsModel)
    {
        this.categoryModel = categoryModel;
        this.productsModel = productsModel;
    }
    
    public void perform(HttpServletRequest req, HttpServletResponse resp) 
    {
        
        int categoryId = Integer.parseInt(req.getParameterValues("categoryid")[0]);
 
        int itemId = Integer.parseInt(req.getParameterValues("itemid")[0]);
        
        ShoppingCart shoppingcart = (ShoppingCart) req.getSession().getAttribute("shoppingCart");
        
        Product product = productsModel.retrieveById(itemId);
        shoppingcart.addItem(product);
        req.setAttribute("items", productsModel.retrieveAllbyCategory(categoryId));
        
        ViewManager.nextView(req, resp, "/view/category.jsp");
    }
}
