/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author entel
 */
public abstract class Action {
    public abstract void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception;

}
