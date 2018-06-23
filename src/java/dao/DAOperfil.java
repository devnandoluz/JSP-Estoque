/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Perfil;

/**
 *
 * @author Nando Luzy
 */
public class DAOperfil {
    private final Connection con;
    private PreparedStatement pstm = null;
    
    public DAOperfil(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Perfil perfil) throws Exception{
        
        String sql = "INSERT INTO perfil (perfil, status) VALUES (?,?);";
        String sqlMenuPerfil = "INSERT INTO menu_perfil (idmenu, idperfil) VALUES (?,?);";
        
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, perfil.getPerfil());
            pstm.setInt(2, perfil.getStatus());
            pstm.executeUpdate();
            pstm.close();
            try{
                for(int i = 0; i < perfil.getMenu().size(); i++){
                    pstm = con.prepareStatement(sqlMenuPerfil);
                    pstm.setInt(1, perfil.getMenu().get(i).getId());
                    pstm.setInt(2, perfil.findForName().getId());
                    pstm.executeUpdate();
                    pstm.close();                    
                }
            }catch(SQLException e){
                System.err.println("erro ao salvar MENU " + e);
            }
            return true;
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao salvar: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Perfil> findAll(){
        
        ArrayList<Perfil> listaDePerfil = new ArrayList();
        
        String sql = "SELECT * FROM perfil;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Perfil perfil = new Perfil();
                
                perfil.setId(rs.getInt("idPerfil"));
                perfil.setPerfil(rs.getString("PERFIL"));
                perfil.setStatus(rs.getInt("STATUS"));
                listaDePerfil.add(perfil);
            }
            
            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao buscar todos: " + ex);
        }
        
        return listaDePerfil;
    }
    
    public Perfil findForID(int id){
        Perfil perfil = new Perfil();
        String sql = "SELECT * FROM perfil WHERE idPERFIL = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                perfil.setId(rs.getInt("idPerfil"));
                perfil.setPerfil(rs.getString("PERFIL"));
                perfil.setStatus(rs.getInt("STATUS"));
            }
            ConnectionDB.closeConnection(con, pstm, rs); //fecha
            
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao buscar por ID: " + ex);
        }
        return perfil;
    }
    public Perfil findForName(String name){
        Perfil perfil = new Perfil();
        String sql = "SELECT * FROM perfil WHERE perfil = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, name);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                perfil.setId(rs.getInt("idPerfil"));
                perfil.setPerfil(rs.getString("PERFIL"));
                perfil.setStatus(rs.getInt("STATUS"));
            }
            ConnectionDB.closeConnection(con, pstm, rs); //fecha
            
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao buscar por NOME: " + ex);
        }
        return perfil;
    }
    
    public int getID(String nome){
        Perfil perfil = new Perfil();
        String sql = "SELECT * FROM perfil WHERE perfil = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, nome);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                perfil.setId(rs.getInt("idPerfil"));
            }
            ConnectionDB.closeConnection(con, pstm, rs); //fecha
            
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao buscar por NOME: " + ex);
        }
        return perfil.getId();
    }
    
    //Update (Alterar)
    public boolean update(Perfil perfil){
        String sql = "UPDATE perfil SET PERFIL = ?, STATUS = ? WHERE idPERFIL = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, perfil.getPerfil());
            pstm.setInt(2, perfil.getStatus());
            pstm.setInt(3, perfil.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao alterar: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Delete (Apagar)
    public boolean delete(Perfil perfil){
        String sql = "DELETE FROM perfil WHERE idPERFIL = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, perfil.getId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("PERFIL Erro ao deletar: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
}
