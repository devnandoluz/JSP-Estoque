/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cliente;
import model.Instalacao;

/**
 *
 * @author Nando Luz
 */
public class DAOinstalacao {
     private final Connection con;
        private PreparedStatement pstm = null;
    
    public DAOinstalacao(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Instalacao servico){
        
        String sql = "INSERT INTO instalacao (tipo, valor, data_inicial, data_final, cliente_idcliente) VALUES (?,?,?,?,?);";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, servico.getTipo());
            pstm.setDouble(2, servico.getValor());
            pstm.setDate(3, new Date(servico.getData_inicial().getTime()));
            pstm.setDate(4, new Date(servico.getData_final().getTime()));
            pstm.setInt(5, servico.getCliente().getId());
           
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("INSTALAÇÃO Erro ao salvar: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Instalacao> findAll(){
        
        ArrayList<Instalacao> listaDeClientes = new ArrayList();
        
        String sql = "SELECT * FROM instalacao;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Instalacao servico = new Instalacao();
                Cliente cliente = new Cliente();
                servico.setId(rs.getInt("idinstalacao"));
                servico.setTipo(rs.getString("tipo"));
                servico.setValor(rs.getDouble("valor"));
                servico.setData_inicial(rs.getDate("data_inicial"));
                servico.setData_final(rs.getDate("data_final"));
                try {
                    servico.setCliente(cliente.findForID(rs.getInt("cliente_idcliente")));
                } catch (Exception ex) {
                    System.err.println("INSTALAÇÃO erro ao buscar cliente" + ex);
                }
                
                listaDeClientes.add(servico);
            }
        } catch (SQLException ex) {
            System.err.println("Instalação erro ao buscar todas: " + ex);
        }
        ConnectionDB.closeConnection(con);
        return listaDeClientes;
    }
    
    public Instalacao findForID(int id){
        Instalacao servico = new Instalacao();
        String sql = "SELECT * FROM instalacao WHERE idinstalacao = ?;";
        try {
            pstm = con.prepareStatement(sql);
            
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();   
            while(rs.next()){
                Cliente cliente = new Cliente();
                servico.setId(rs.getInt("idinstalacao"));
                servico.setTipo(rs.getString("tipo"));
                servico.setValor(rs.getDouble("valor"));
                servico.setData_inicial(rs.getDate("data_inicial"));
                servico.setData_final(rs.getDate("data_final"));
                try {
                    servico.setCliente(cliente.findForID(rs.getInt("cliente_idcliente")));
                } catch (Exception ex) {
                    System.err.println("INSTALAÇÃO erro ao buscar cliente" + ex);
                }
        }
            
        } catch (SQLException ex) {
            System.err.println("INSTALACAO Erro ao buscar por ID: " + ex);
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
        return servico;
    }
    
    //Update (Alterar)
    public boolean update(Instalacao servico){
        String sql = "UPDATE instalacao SET "
                + "tipo = ?,"
                + "valor = ?,"
                + "data_inicial = ?,"
                + "data_final = ?,"
                + "cliente_idcliente = ?"
                + "WHERE idinstalacao = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, servico.getTipo());
            pstm.setDouble(2, servico.getValor());
            pstm.setDate(3, (Date) servico.getData_inicial());
            pstm.setDate(4, (Date) servico.getData_final());
            pstm.setInt(5, servico.getCliente().getId());
            pstm.setInt(6, servico.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar instalacao: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Delete (Apagar)
    public boolean delete(Instalacao servico){
        String sql = "DELETE FROM instalacao WHERE idinstalacao = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, servico.getId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao deletar instalacao: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }

}
