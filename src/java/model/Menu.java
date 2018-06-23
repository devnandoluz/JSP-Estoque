/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.DAOmenu;
import java.util.ArrayList;

/**
 *
 * @author Nando Luzy
 */
public class Menu {
    private int id;
    private String menu;
    private String link;
    private String icone;
    private int status;
    
    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }
    
    
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    
    //Create
    public void insert() throws Exception{
        DAOmenu dao = new DAOmenu();
        dao.save(this);
    }
    //Read
    public ArrayList<Menu> findAll() throws Exception{   
        DAOmenu dao = new DAOmenu();
        return dao.findAll();
    }
    
    public ArrayList<Menu> findForUse(int id) throws Exception{   
        DAOmenu dao = new DAOmenu();
        return dao.findForUse(id);
    }
    
    public Menu findForID(int id) throws Exception{
        DAOmenu dao = new DAOmenu();
        return dao.findForID(id);
    }
    
    //Update
    public void update() throws Exception{ 
        DAOmenu dao = new DAOmenu();
        dao.update(this);
    }
    //Delete
    public boolean delete() throws Exception{
        DAOmenu dao = new DAOmenu();
        return dao.delete(this);
    }

    
    
}
