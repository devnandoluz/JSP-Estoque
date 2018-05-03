/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.DAOusuario;
import java.util.ArrayList;

/**
 *
 * @author Nando Luzy
 */
public class Usuario {
    
    private int id;
    private String username, senha;
    private Perfil perfil;
   
    
    public Usuario(){
        
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public Usuario(int id, String username, String senha, Perfil perfil) {
        this.id = id;
        this.username = username;
        this.senha = senha;
        this.perfil = perfil;
    }

    
    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
    public void setPerfil(String perfil) {
        
    }
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    
    //Create
    public void insert() throws Exception{
        DAOusuario dao = new DAOusuario();
        dao.save(this);
    }
    //Read
    public ArrayList<Usuario> findAll() throws Exception{   
        DAOusuario dao = new DAOusuario();
        return dao.findAll();
    }
    
    public Usuario findForID() throws Exception{
        DAOusuario dao = new DAOusuario();
        return dao.findForID(getId());
    }
    //Update
    public void update() throws Exception{ 
        DAOusuario dao = new DAOusuario();
        dao.update(this);
    }
    //Delete
    public void delete() throws Exception{
        DAOusuario dao = new DAOusuario();
        dao.delete(this);
    }
    
    //Validar Login
    public Usuario validarLogin(String username, String senha) throws Exception{
        DAOusuario dao = new DAOusuario();
        return dao.validar(username, senha);
    }

    

}
