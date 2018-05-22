package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Log;

/**
 *
 * @author Nando Luz
 */
public class DAOlog {
    private final Connection con;
    private PreparedStatement pstm = null;

    public DAOlog(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Log log){
        
        String sql = "INSERT INTO log "
                    + "(nome, data, funcionario_idFuncionario) "
                    + "VALUES (?,?,?);";        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, log.getNome());
            pstm.setDate(2, new Date(log.getData().getTime()));
            pstm.setInt(3, log.getFuncionario().getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar LOG: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Log> findAll(){
        
        ArrayList<Log> listaDeLog = new ArrayList();
        
        String sql = "SELECT * FROM Log order by idlog desc;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Log log = new Log();
                DAOfuncionario dao = new DAOfuncionario();
                
                log.setId(rs.getInt("idLOG"));
                log.setNome(rs.getString("NOME"));
                log.setData(rs.getDate("DATA"));
                log.setFuncionario(dao.findForID(rs.getInt(("funcionario_idFuncionario"))));
                
                listaDeLog.add(log);
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar LOG: " + ex);
        }        
        return listaDeLog;
    }    
}
