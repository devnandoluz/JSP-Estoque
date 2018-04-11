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
import model.Cliente;

/**
 *
 * @author Nando Luzy
 */
public class DAOcliente {
        private final Connection con;
        private PreparedStatement pstm = null;
    
    public DAOcliente(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Cliente cliente){
        
        String sql = "INSERT INTO cliente (nome_fantasia, cnpj, servico_contratado, telefone, email, descricao) VALUES (?,?,?,?,?,?);";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, cliente.getNomeFantasia());
            pstm.setString(2, cliente.getCnpj());
            pstm.setString(3, cliente.getServicoContratado());
            pstm.setString(4, cliente.getTelefone());
            pstm.setString(5, cliente.getEmail());
            pstm.setString(6, cliente.getDescricao());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Cliente> findAll(){
        
        ArrayList<Cliente> listaDeClientes = new ArrayList();
        
        String sql = "SELECT * FROM cliente;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("idCliente"));
                cliente.setNomeFantasia(rs.getString("nome_fantasia"));
                cliente.setCnpj(rs.getString("cnpj"));
                cliente.setServicoContratado(rs.getString("servico_contratado"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEmail(rs.getString("email"));
                cliente.setDescricao(rs.getString("descricao"));
                
                listaDeClientes.add(cliente);
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar: " + ex);
        }
        ConnectionDB.closeConnection(con);
        return listaDeClientes;
    }
    
    public Cliente findForID(int id){
        Cliente cliente = new Cliente();
        String sql = "SELECT * FROM cliente WHERE idCliente = ?;";
        try {
            pstm = con.prepareStatement(sql);
            
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();            
            cliente.setId(rs.getInt("idCliente"));
            cliente.setNomeFantasia(rs.getString("nome_fantasia"));
            cliente.setCnpj(rs.getString("cnpj"));
            cliente.setServicoContratado(rs.getString("servico_contratado"));
            cliente.setTelefone(rs.getString("telefone"));
            cliente.setEmail(rs.getString("email"));
            cliente.setDescricao(rs.getString("descricao"));
            
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar: " + ex);
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
        return cliente;
    }
    
    //Update (Alterar)
    public boolean update(Cliente cliente){
        String sql = "UPDATE cliente SET "
                + "nome_fantasia = ?,"
                + "cnpj = ?,"
                + "servico_contratado = ?,"
                + "telefone = ?,"
                + "email = ?,"
                + "descricao = ?"
                + "WHERE idcliente = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, cliente.getNomeFantasia());
            pstm.setString(2, cliente.getCnpj());
            pstm.setString(3, cliente.getServicoContratado());
            pstm.setString(4, cliente.getTelefone());
            pstm.setString(5, cliente.getEmail());
            pstm.setString(6, cliente.getDescricao());
            pstm.setInt(7, cliente.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Delete (Apagar)
    public boolean delete(Cliente cliente){
        String sql = "DELETE FROM cliente WHERE idCLIENTE = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, cliente.getId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao deletar: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
}
