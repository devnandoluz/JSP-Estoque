package model;

import dao.DAOproduto;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Nando Luz
 */
public class Produto {
    
    private int id;
    private String nome;
    private String status;
    private String categoria;
    private int quantidade;
    private double valor;

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
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
