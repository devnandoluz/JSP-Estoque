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
        
        String sql = "INSERT INTO cliente "
                    + "(nome_fantasia, cnpj, inscricao_estadual, servico_contratado, quantidade, valor_servico, "
                    + "data_adesao, telefone, cep, endereco, bairro, cidade, uf, email, descricao) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, cliente.getNomeFantasia());
            pstm.setString(2, cliente.getCnpj());
            pstm.setString(3, cliente.getInscricaoEstadual());
            pstm.setString(4, cliente.getServicoContratado());
            pstm.setString(5, cliente.getQuantidade());
            pstm.setDouble(6, cliente.getValor_servico());
            pstm.setDate(7, new Date(cliente.getData_adesao().getTime()));
            pstm.setString(8, cliente.getTelefone());
            pstm.setString(9, cliente.getCep());
            pstm.setString(10, cliente.getEndereco());
            pstm.setString(11, cliente.getBairro());
            pstm.setString(12, cliente.getCidade());
            pstm.setString(13, cliente.getEstado());
            pstm.setString(14, cliente.getEmail());
            pstm.setString(15, cliente.getDescricao());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar CLIENTE: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Cliente> findAll(){
        
        ArrayList<Cliente> listaDeFuncionario = new ArrayList();
        
        String sql = "SELECT * FROM cliente;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId(rs.getInt("idCLIENTE"));
                cliente.setNomeFantasia(rs.getString("NOME_FANTASIA"));
                cliente.setCnpj(rs.getString("CNPJ"));
                cliente.setInscricaoEstadual(rs.getString("INSCRICAO_ESTADUAL"));
                cliente.setServicoContratado(rs.getString("SERVICO_CONTRATADO"));  
                cliente.setQuantidade(rs.getString("QUANTIDADE"));              
                cliente.setValor_servico(rs.getDouble("VALOR_SERVICO"));
                cliente.setData_adesao(rs.getDate("data_adesao"));
                cliente.setTelefone(rs.getString("TELEFONE"));
                cliente.setCep(rs.getString("CEP"));
                cliente.setEndereco(rs.getString("endereco"));
                cliente.setBairro(rs.getString("BAIRRO"));
                cliente.setCidade(rs.getString("CIDADE"));
                cliente.setEstado(rs.getString("UF"));
                cliente.setEmail(rs.getString("EMAIL"));
                cliente.setDescricao(rs.getString("DESCRICAO"));
                
                listaDeFuncionario.add(cliente);
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar CLIETE: " + ex);
        }
        
        return listaDeFuncionario;
    }
    
    public Cliente findForID(int id){
        
        String sql = "SELECT * FROM cliente WHERE idCLIENTE = ?;";
        Cliente cliente = new Cliente();
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);            
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                
                cliente.setId(rs.getInt("idCLIENTE"));
                cliente.setNomeFantasia(rs.getString("NOME_FANTASIA"));
                cliente.setCnpj(rs.getString("CNPJ"));
                cliente.setInscricaoEstadual(rs.getString("INSCRICAO_ESTADUAL"));
                cliente.setServicoContratado(rs.getString("SERVICO_CONTRATADO"));
                cliente.setQuantidade(rs.getString("QUANTIDADE"));
                cliente.setValor_servico(rs.getDouble("VALOR_SERVICO"));
                cliente.setData_adesao(rs.getDate("data_adesao"));
                cliente.setTelefone(rs.getString("TELEFONE"));
                cliente.setCep(rs.getString("CEP"));
                cliente.setEndereco(rs.getString("endereco"));
                cliente.setBairro(rs.getString("BAIRRO"));
                cliente.setCidade(rs.getString("CIDADE"));
                cliente.setEstado(rs.getString("UF"));
                cliente.setEmail(rs.getString("EMAIL"));
                cliente.setDescricao(rs.getString("DESCRICAO"));
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar CLIETNE: " + ex);
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
        return cliente;
    }
    
    //Update (Alterar)
    public boolean update(Cliente cliente){
        String sql = "UPDATE cliente SET "
                + " nome_fantasia = ?,"
                + " cnpj = ?,"
                + " inscricao_estadual = ?,"
                + " servico_contratado = ?,"
                + " quantidade = ?,"
                + " valor_servico = ?,"
                + " data_adesao = ?,"
                + " telefone = ?,"
                + " cep = ?,"
                + " endereco = ?,"
                + " bairro = ?,"
                + " cidade = ?,"
                + " uf = ?,"
                + " email = ?,"
                + " descricao = ?"
                + " WHERE idcliente = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, cliente.getNomeFantasia());
            pstm.setString(2, cliente.getCnpj());
            pstm.setString(3, cliente.getInscricaoEstadual());
            pstm.setString(4, cliente.getServicoContratado());
            pstm.setString(5, cliente.getQuantidade());
            pstm.setDouble(6, cliente.getValor_servico());
            pstm.setDate(7, new Date(cliente.getData_adesao().getTime()));
            pstm.setString(8, cliente.getTelefone());
            pstm.setString(9, cliente.getCep());
            pstm.setString(10, cliente.getEndereco());
            pstm.setString(11, cliente.getBairro());
            pstm.setString(12, cliente.getCidade());
            pstm.setString(13, cliente.getEstado());
            pstm.setString(14, cliente.getEmail());
            pstm.setString(15, cliente.getDescricao());
            pstm.setInt(16, cliente.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar CLIENTE: " + ex);
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
            System.err.println("Erro ao deletar CLIENTE: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
}
