package model;

import dao.DAOproduto;
import java.util.ArrayList;
/**
 *
 * @author Nando Luz
 */
public class Produto {
    
    private int id;
    private String nome;
    private int quantidade;
    private double valor;
    private String categoria;
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    
    //Create
    public void insert() throws Exception{
        DAOproduto dao = new DAOproduto();
        dao.save(this);
    }
    //Read
    public ArrayList<Produto> findAll() throws Exception{  
        DAOproduto dao = new DAOproduto();
        return dao.findAll();
    }
    
    public Produto findForID(int id) throws Exception{
        DAOproduto dao = new DAOproduto();
        return dao.findForID(id);
    }
    //Update
    public void update() throws Exception{ 
        DAOproduto dao = new DAOproduto();
        dao.update(this);
    }
    //Delete
    public void delete() throws Exception{
        DAOproduto dao = new DAOproduto();
        dao.delete(this);
    }


}
