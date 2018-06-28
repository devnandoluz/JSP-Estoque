package model;

import dao.DAOperfil;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nando Luz
 */
public class Perfil {
    
    private int id;
    private int status;
    private String perfil;
    private List<Menu> menu;
        
    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<Menu> getMenu() {
        return (List<Menu>) menu;
    }

    public void setMenu(List<Menu> menu) {
        this.menu = menu;
    }

    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    
    //Create
    public void insert() throws Exception{
        DAOperfil dao = new DAOperfil();
        dao.save(this);
    }
    //Read
    public ArrayList<Perfil> findAll() throws Exception{   
        DAOperfil dao = new DAOperfil();
        return dao.findAll();
    }
    
    public Perfil findForName() throws Exception{   
        DAOperfil dao = new DAOperfil();
        return dao.findForName(getPerfil());
    }
    
    public Perfil findForID(int id) throws Exception{
        DAOperfil dao = new DAOperfil();
        return dao.findForID(id);
    }
    public int getID(String nome) throws Exception{
        DAOperfil dao = new DAOperfil();
        return dao.getID(nome);
    }
    //Update
    public void update() throws Exception{ 
        DAOperfil dao = new DAOperfil();
        dao.update(this);
    }
    //Delete
    public void delete() throws Exception{
        DAOperfil dao = new DAOperfil();
        dao.delete(this);
    }


}
