/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.DAOinstalacao;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Nando Luz
 */
public class Instalacao {
    private int id;
    private String tipo;
    private double valor;
    private Date data_inicial;
    private Date data_final;
    private Cliente cliente;

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Date getData_inicial() {
        return data_inicial;
    }

    public void setData_inicial(Date data_inicial) {
        this.data_inicial = data_inicial;
    }

    public Date getData_final() {
        return data_final;
    }

    public void setData_final(Date data_final) {
        this.data_final = data_final;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    //Create
    public void insert() throws Exception{
        DAOinstalacao dao = new DAOinstalacao();
        dao.save(this);
    }
    //Read
    public ArrayList<Instalacao> findAll() throws Exception{   
        DAOinstalacao dao = new DAOinstalacao();
        return dao.findAll();
    }
    
    public Instalacao findForID(int id) throws Exception{
        DAOinstalacao dao = new DAOinstalacao();
        return dao.findForID(id);
    }
    
    //Update
    public void update() throws Exception{ 
        DAOinstalacao dao = new DAOinstalacao();
        dao.update(this);
    }
    //Delete
    public boolean delete() throws Exception{
        DAOinstalacao dao = new DAOinstalacao();
        return dao.delete(this);
    }
}
