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
import model.Estoque;

/**
 *
 * @author Nando Luzy
 */
public class DAOestoque {

    private final Connection con;
    private PreparedStatement pstm = null;

    public DAOestoque() {
        con = ConnectionDB.openConnection();
    }

    //Create (Salvar)
    public boolean save(Estoque estoque) {

        String sql = "INSERT INTO ESTOQUE ( QUANT ) VALUES ( ? );";

        try {
            pstm = con.prepareStatement(sql);
           
            pstm.setInt(1, estoque.getQuantidade());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar ESTOQUE: " + ex);
            return false;
        } finally {
            ConnectionDB.closeConnection(con, pstm);
        }
    }

    //Read (Ler)
    public ArrayList<Estoque> findAll() {

        ArrayList<Estoque> listaDeEstoques = new ArrayList();

        String sql = "SELECT * FROM ESTOQUE;";

        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setId(rs.getInt("idEstoque"));
                estoque.setQuantidade(rs.getInt("QUANT"));
                listaDeEstoques.add(estoque);
            }

            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar ESTOQUE: " + ex);
        }

        return listaDeEstoques;
    }

    public Estoque findForID(int id) {
        Estoque estoque = new Estoque();
        String sql = "SELECT * FROM ESTOQUE WHERE idESTOQUE = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);

            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                estoque.setId(rs.getInt("idESTOQUE"));
                estoque.setQuantidade(rs.getInt("QUANT"));
            }

            ConnectionDB.closeConnection(con, pstm, rs); //fecha

        } catch (SQLException ex) {
            System.err.println("Erro ao buscar ESTOQUE: " + ex);
        }
        return estoque;
    }

    //Update (Alterar)
    public boolean update(Estoque estoque) {
        String sql = "UPDATE ESTOQUE SET QUANT = ? WHERE idESTOQUE = ?;";
        try {
            pstm = con.prepareStatement(sql);
            
            pstm.setInt(1, estoque.getQuantidade());
            pstm.setInt(2, estoque.getId());
 
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar ESTOQUE: " + ex);
            return false;
        } finally {
            ConnectionDB.closeConnection(con, pstm);
        }
    }

    //Delete (Apagar)
    public boolean delete(Estoque estoque) {
        String sql = "DELETE FROM ESTOQUE WHERE idESTOQUE = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, estoque.getId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao deletar ESTOQUE: " + ex);
            return false;
        } finally {
            ConnectionDB.closeConnection(con, pstm);
        }

    }
}
