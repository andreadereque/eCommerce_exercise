package cart;

import entity.Product;
import java.util.*;

/**
 *
 * @author juanluis
 */
public class ShoppingCart {

    List<ShoppingCartItem> items = new ArrayList<ShoppingCartItem>();
    
    public synchronized void addItem(Product product)
    {
        boolean hasproduct = false;
        for (ShoppingCartItem item : items)
        {
            if (item.getProduct().equals(product))
            {
                hasproduct = true;
                item.setQuantity(item.getQuantity()+1);
            }
        }
        
        if (!hasproduct)
            items.add(new ShoppingCartItem(product));
    }
    
    public synchronized void update(Product product, String quantity)
    {
        for (ShoppingCartItem item : items)
        {
            if (item.getProduct().equals(product))
            {
                if (Integer.parseInt(quantity) > 0)
                {
                    item.setQuantity(Integer.parseInt(quantity));
                    break;
                }
                else
                    items.remove(item);
                    break;
            }
        }

    } 
    
    public synchronized List<ShoppingCartItem> getItems()
    {
        return items;
    }
    
    public synchronized int getNumberOfItems()
    {
        int numitems = 0;
        for (ShoppingCartItem item : items)
        {
            numitems = numitems + item.getQuantity();
        }
            return numitems;
    } 
    
    public synchronized double getTotal()
    {
        double total = 0;
        
        for (ShoppingCartItem item : items)  
            total = total + item.getQuantity() * item.getProduct().getPrice();
                
        return total;
    } 
    
    public synchronized void clear()
    {
        items.clear();
    }


}