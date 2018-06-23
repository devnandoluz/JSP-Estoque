package model;

import dao.DAOmenu_perfil;
import java.util.ArrayList;

/**
 *
 * @author Nando Luz
 */
public class Menu_Perfil {
    private int idmenu;
    private int idperfil;
    
    public int getIdmenu() {
        return idmenu;
    }

    public void setIdmenu(int idmenu) {
        this.idmenu = idmenu;
    }

    public int getIdperfil() {
        return idperfil;
    }

    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @param id
     * @return 
     * @throws Exception 
     */
    
    public ArrayList<Menu_Perfil> findAll(int id) throws Exception{  
        DAOmenu_perfil dao = new DAOmenu_perfil();
        return dao.findForPerfil(id);
    }
       
}
