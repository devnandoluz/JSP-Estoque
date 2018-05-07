package model;

import dao.DAOestoque;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Nando Luz
 */
public class Estoque {
    
    private int id;
    private int quantidade;
    private Date data_entrada;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Date getData_entrada() {
        return data_entrada;
    }

    public void setData_entrada(Date data_entrada) {
        this.data_entrada = data_entrada;
    }
    
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    //Create
    public void insert() throws Exception{
        DAOestoque dao = new DAOestoque();
        dao.save(this);
    }
    //Read
    public ArrayList<Estoque> findAll() throws Exception{ 
        DAOestoque dao = new DAOestoque();
        return dao.findAll();
    }
    
    public Estoque findForID(int id) throws Exception{
        DAOestoque dao = new DAOestoque();
        return dao.findForID(id);
    }
    //Update
    public void update() throws Exception{ 
        DAOestoque dao = new DAOestoque();
        dao.update(this);
    }
    //Delete
    public void delete() throws Exception{
        DAOestoque dao = new DAOestoque();
        dao.delete(this);
    }
}
