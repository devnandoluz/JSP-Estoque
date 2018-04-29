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
import model.Produto;
import model.SaidaProduto;

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
        
        String sql = "INSERT INTO PRODUTO (QUANT,VALOR_UNIT,DATA_SAIDA) VALUES (?,?,?);";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, saidaproduto.getQuantidade());
            pstm.setDouble(2, saidaproduto.getValorUnitario());
            pstm.setDate(3, saidaproduto.getDataSaida());
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
    public ArrayList<SaidaProduto> findAll(){
        
        ArrayList<SaidaProduto> listaDeProdutos = new ArrayList();
        
        String sql = "SELECT * FROM SAIDA_PRODUTO;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                SaidaProduto saidaproduto = new SaidaProduto();
                
                saidaproduto.setDataSaida(rs.getDate("DATA_SAIDA"));
                saidaproduto.setValorUnitario(rs.getDouble("VALOR_UNITARIO"));
                saidaproduto.setQuantidade(rs.getInt("VALOR_UNITARIO"));
                listaDeProdutos.add(saidaproduto);
            }
            
            ConnectionDB.closeConnection(con, pstm, rs); //close conections
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar: " + ex);
        }
        
        return listaDeProdutos;
    }
    
    public SaidaProduto findForID(int id){
        
        SaidaProduto saidaproduto = new SaidaProduto();
        String sql = "SELECT * FROM SAIDA_PRODUTO WHERE idSaidaProduto = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();
            
            saidaproduto.setId(rs.getInt("idSaidaProduto"));
            saidaproduto.setCategoria(rs.getString("categoria"));
            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar: " + ex);
        }
        
        return saidaproduto;
    }
    
    //Update (Alterar)
    public boolean update(SaidaProduto saidaproduto){
        String sql = "UPDATE saidaproduto SET categoria = ? WHERE idTipoPorduto = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, saidaproduto.getCategoria());
            pstm.setInt(2, saidaproduto.getId());
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
    public boolean delete(SaidaProduto saidaproduto){
        String sql = "DELETE FROM SAIDA_PRODUTO WHERE idSaidaProduto = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, saidaproduto.getId());
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
