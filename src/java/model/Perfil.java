package model;

import dao.DAOperfil;
import java.util.ArrayList;

/**
 *
 * @author Nando Luz
 */
public class Perfil {
    
    private int id;
    private int status;
    private String perfil;
    private int[] menu;
    int i = 0;
        
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
    
    public int[] getMenu() {
        return menu;
    }

    public void setMenu(int menu) {
        this.menu[i] = menu;
        i++;
    }
    
    public void adicionarMenu(int menu, int posicao){
        this.menu[posicao] = menu;
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
    //Read
    public Perfil findForName() throws Exception{   
        DAOperfil dao = new DAOperfil();
        return dao.findForName(perfil);
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
