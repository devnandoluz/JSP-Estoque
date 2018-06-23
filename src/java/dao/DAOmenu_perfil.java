package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Menu_Perfil;

/**
 *
 * @author Nando Luz
 */
public class DAOmenu_perfil {
    private final Connection con;
    private PreparedStatement pstm = null;
    
    public DAOmenu_perfil(){
        con = ConnectionDB.openConnection();
    }
    
    public ArrayList<Menu_Perfil> findForPerfil(int id){
        
        ArrayList<Menu_Perfil> listaDeIDMenu = new ArrayList();
        
        String sqlid = "SELECT * FROM menu_perfil WHERE menu_perfil.idperfil = ?;";
        
        try {
            pstm = con.prepareStatement(sqlid);
            
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Menu_Perfil idMenu = new Menu_Perfil();
                idMenu.setIdmenu(rs.getInt("idMENU")); 
                idMenu.setIdperfil(rs.getInt("idPerfil"));
                listaDeIDMenu.add(idMenu);
            }
            
            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar MENU: " + ex);
        }
        
        return listaDeIDMenu;
    }
}
