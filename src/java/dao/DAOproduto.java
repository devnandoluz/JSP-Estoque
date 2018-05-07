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
import model.Produto;

/**
 *
 * @author Nando Luzy
 */
public class DAOproduto {
     private final Connection con;
    private PreparedStatement pstm = null;
    
    public DAOproduto(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Produto produto){
        
        String sql = "INSERT INTO PRODUTO (NOME,STATUS,CATEGORIA, QUANT_ENTRADA, VALOR_UNIT) VALUES (?,?,?,?,?);";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, produto.getNome());
            pstm.setString(2, produto.getStatus());
            pstm.setString(3, produto.getCategoria());
            pstm.setInt(4, produto.getQuantidade());
            pstm.setDouble(5, produto.getValor());
            
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar PRODUTO: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Produto> findAll(){
        
        ArrayList<Produto> listaDeProdutos = new ArrayList();
        
        String sql = "SELECT * FROM PRODUTO;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Produto produto = new Produto();
                
                produto.setId(rs.getInt("idPRODUTO"));
                produto.setNome(rs.getString("NOME"));
                produto.setStatus(rs.getString("STATUS"));
                produto.setCategoria(rs.getString("CATEGORIA"));
                produto.setQuantidade(rs.getInt("QUANT_ENTRADA"));
                produto.setValor(rs.getDouble("VALOR_UNIT"));
              
                listaDeProdutos.add(produto);
            }
            
            ConnectionDB.closeConnection(con, pstm, rs); //close conections
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar PRODUTO: " + ex);
        }
        
        return listaDeProdutos;
    }
    
    public Produto findForID(int id){
        
        Produto produto = new Produto();
        String sql = "SELECT * FROM PRODUTO WHERE idProduto = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                produto.setId(rs.getInt("idPRODUTO"));
                produto.setNome(rs.getString("NOME"));
                produto.setStatus(rs.getString("STATUS"));
                produto.setCategoria(rs.getString("CATEGORIA"));
                produto.setQuantidade(rs.getInt("QUANT_ENTRADA"));
                produto.setValor(rs.getDouble("VALOR_UNIT"));
            }
            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar PRODUTO: " + ex);
        }
        
        return produto;
    }
    
    //Update (Alterar)
    public boolean update(Produto produto){
        String sql = "UPDATE PRODUTO SET "
                + "NOME = ?,"
                + "STATUS = ?,"
                + "CATEGORIA = ?,"
                + "QUANT_ENTRADA = ?,"
                + "VALOR_UNIT = ?"
                + "WHERE idPRODUTO = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, produto.getNome());
            pstm.setString(2, produto.getStatus());
            pstm.setString(3, produto.getCategoria());
            pstm.setInt(4, produto.getQuantidade());
            pstm.setDouble(5, produto.getValor());
            pstm.setInt(6, produto.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar PRODUTO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Delete (Apagar)
    public boolean delete(Produto produto){
        String sql = "DELETE FROM PRODUTO WHERE idProduto = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, produto.getId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao deletar PRODUTO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
}
