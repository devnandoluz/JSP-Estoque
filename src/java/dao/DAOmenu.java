package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Menu;

/**
 *
 * @author Nando Luzy
 */
public class DAOmenu {
    private final Connection con;
    private PreparedStatement pstm = null;
    
    public DAOmenu(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Menu menu){
        
        String sql = "INSERT INTO menu (menu, link, icone, status) VALUES (?,?,?,?);";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, menu.getMenu());
            pstm.setString(2, menu.getLink());
            pstm.setString(3, menu.getIcone());
            pstm.setInt(4, menu.getStatus());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar MENU: " + ex);
            return false;
        } finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    //Read (Ler)
    public ArrayList<Menu> findAll(){
        
        ArrayList<Menu> listaDeMenu = new ArrayList();
        
        String sql = "SELECT * FROM menu;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Menu menu = new Menu();
                
                menu.setId(rs.getInt("idMENU"));
                menu.setMenu(rs.getString("MENU"));
                menu.setLink(rs.getString("LINK"));
                menu.setIcone(rs.getString("icone"));
                menu.setStatus(rs.getInt("STATUS"));
                
                listaDeMenu.add(menu);
            }
            
            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar: " + ex);
        }
        
        return listaDeMenu;
    }
    public ArrayList<Menu> findForUse(int id){         
        ArrayList<Menu> listaDeMenu = new ArrayList();        
        String sql = "SELECT * FROM `menu` INNER JOIN menu_perfil ON(menu.idmenu = menu_perfil.idmenu AND menu_perfil.idperfil = ?);";        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setDouble(1, id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                Menu menu2 = new Menu();        
                int i = 1;
                
                menu2.setMenu(rs.getString("MENU"));
                menu2.setLink(rs.getString("LINK"));
                menu2.setIcone(rs.getString("icone"));
                menu2.setStatus(rs.getInt("STATUS"));
                
                listaDeMenu.add(menu2);
                
                System.out.println("entrou" + i);
            }
            ConnectionDB.closeConnection(con, pstm, rs);
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar MENU: " + ex);
        }        
        return listaDeMenu;
    }
    public Menu findForID(int id){
        Menu menu = new Menu();
        String sql = "SELECT * FROM menu WHERE idMENU = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);            
            ResultSet rs = pstm.executeQuery();            
            while(rs.next()){
                menu.setId(rs.getInt("idMENU"));
                menu.setMenu(rs.getString("MENU"));
                menu.setLink(rs.getString("LINK"));
                menu.setIcone(rs.getString("icone"));
                menu.setStatus(rs.getInt("STATUS"));
            }
            
            ConnectionDB.closeConnection(con, pstm, rs); //fecha
            
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar: " + ex);
        }
        return menu;
    }
    
    //Update (Alterar)
    public boolean update(Menu menu){
        String sql = "UPDATE menu SET MENU = ?, LINK = ?, ICONE = ?, STATUS = ? WHERE idMENU = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, menu.getMenu());
            pstm.setString(2, menu.getLink());
            pstm.setString(3, menu.getIcone());
            pstm.setInt(4, menu.getStatus());
            pstm.setInt(5, menu.getId());
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
    public boolean delete(Menu menu){
        String sql = "DELETE FROM menu WHERE menu.idMENU = ? ;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, menu.getId());
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
