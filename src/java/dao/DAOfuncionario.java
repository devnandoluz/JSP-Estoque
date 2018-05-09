package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Funcionario;
/**
 *
 * @author Nando Luz
 */
public class DAOfuncionario {
    private final Connection con;
    private PreparedStatement pstm = null;
    
    public DAOfuncionario(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Funcionario funcionario){
        
        String sqlFuncionario = "INSERT INTO funcionario (cpf, nome, rg, sexo, cargo, endereco, telefone, email, usuario_idusuario) VALUES (?,?,?,?,?,?,?,?,?);";
        String sqlUsuario = "INSERT INTO usuario (username, senha, perfil_idperfil) VALUES (?,?,?);";
        
        try {
            pstm = con.prepareStatement(sqlUsuario);
            pstm.setString(1, funcionario.getUsuario().getUsername());
            pstm.setString(2, funcionario.getUsuario().getSenha());
            pstm.setInt(3, funcionario.getUsuario().getPerfil().getId());
            pstm.executeUpdate();
            
            try {
                pstm = con.prepareStatement(sqlFuncionario);
                pstm.setString(1, funcionario.getCpf());
                pstm.setString(2, funcionario.getNome());
                pstm.setString(3, funcionario.getRg());
                //pstm.setString(4, funcionario.getDataDeNascimento());
                pstm.setString(4, funcionario.getSexo());
                pstm.setString(5, funcionario.getCargo());
                pstm.setString(6, funcionario.getEndereco());
                pstm.setString(7, funcionario.getTelefone());
                pstm.setString(8, funcionario.getEmail());
                    try {
                        pstm.setInt(9, funcionario.getUsuario().validarLogin(funcionario.getUsuario().getUsername(), funcionario.getUsuario().getSenha()).getId());
                    } catch (Exception ex) {
                        System.err.println("erro ao buscar ID USUARIO: "+ex);
                    }
                pstm.executeUpdate();
                return true;
            } catch (SQLException ex) {
                System.err.println("Erro ao salvar FUNCIONARIO: " + ex);
                return false;
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar USUARIO e FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
    public boolean saveSemUsuario(Funcionario funcionario){
        
        String sqlFuncionario = "INSERT INTO funcionario (cpf, nome, rg, sexo, cargo, endereco, telefone, email) VALUES (?,?,?,?,?,?,?,?);";
        
            try {
                pstm = con.prepareStatement(sqlFuncionario);
                pstm.setString(1, funcionario.getCpf());
                pstm.setString(2, funcionario.getNome());
                pstm.setString(3, funcionario.getRg());
                //pstm.setString(4, funcionario.getDataDeNascimento());
                pstm.setString(4, funcionario.getSexo());
                pstm.setString(5, funcionario.getCargo());
                pstm.setString(6, funcionario.getEndereco());
                pstm.setString(7, funcionario.getTelefone());
                pstm.setString(8, funcionario.getEmail());
                
                pstm.executeUpdate();
                return true;
            } catch (SQLException ex) {
                System.err.println("Erro ao salvar: " + ex);
                return false;
            }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
    
    //Read (Ler)
    public ArrayList<Funcionario> findAll(){
        
        ArrayList<Funcionario> listaDeFuncionario = new ArrayList();
        
        String sql = "SELECT * FROM Funcionario;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Funcionario funcionario = new Funcionario();
                DAOusuario dao = new DAOusuario();
                
                funcionario.setId(rs.getInt("idFuncionario"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setRg(rs.getString("rg"));
                //funcionario.setDataDeNascimento(rs.getDate(null, "data_de_nascimento"));
                funcionario.setSexo(rs.getString("sexo"));
                funcionario.setCargo(rs.getString("cargo"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setUsuario( dao.findForID(rs.getInt("usuario_idusuario")) );
                
                listaDeFuncionario.add(funcionario);
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar FUNCIONARIO: " + ex);
        }
        
        return listaDeFuncionario;
    }
    
    public Funcionario findForID(int id){
        Funcionario funcionario = new Funcionario();
        DAOusuario dao = new DAOusuario();
        
        String sql = "SELECT * FROM funcionario WHERE idFuncionario = ?;";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                funcionario.setId(rs.getInt("idFuncionario"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setRg(rs.getString("rg"));
                //funcionario.setDataDeNascimento(rs.getString("data_de_nascimento"));
                funcionario.setSexo(rs.getString("sexo"));
                funcionario.setCargo(rs.getString("cargo"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setUsuario( dao.findForID(rs.getInt("usuario_idusuario")) );
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
            
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar FUNCIONARIO: " + ex);
        }
        
        return funcionario;
    }
    
    //Update (Alterar)
    public boolean update(Funcionario funcinario){
        
        String sql = "UPDATE funcionario SET"
                + "cpf = ?,"
                + "nome = ?,"
                + "rg = ?,"
                + "sexo = ?,"
                + "cargo = ?,"
                + "endereco = ?,"
                + "telefone = ?,"
                + "email = ?,"
                + "usuario_idusuario = ?"
                + "WHERE idFuncionario = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, funcinario.getCpf());
            pstm.setString(2, funcinario.getNome());
            pstm.setString(3, funcinario.getRg());
            //pstm.setString(4, funcinario.getDataDeNascimento());
            pstm.setString(4, funcinario.getSexo());
            pstm.setString(5, funcinario.getCargo());
            pstm.setString(6, funcinario.getEndereco());
            pstm.setString(7, funcinario.getTelefone());
            pstm.setString(8, funcinario.getEmail());
            pstm.setInt(9, funcinario.getUsuario().getId());
            pstm.setInt(10, funcinario.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
    
    public boolean updateSemUsuario(Funcionario funcionario){
        
        String sqlFuncionario = "UPDATE funcionario SET "
                                + "cpf = ?,"
                                + " nome = ?,"
                                + " rg = ?,"
                                + " sexo = ?,"
                                + " cargo = ?,"
                                + " endereco = ?,"
                                + " telefone = ?,"
                                + " email = ?,"
                                + " usuario_idusuario = ?"
                                + "WHERE idFuncionario = ?;";
        
        String sqlUsuario = "UPDATE usuario SET "
                            + "username = ?,"
                            + " senha = ?,"
                            + " perfil_idperfil = ?"
                            + " WHERE idUsuario = ?;";
        
        try {
            pstm = con.prepareStatement(sqlUsuario);
            pstm.setString(1, funcionario.getUsuario().getUsername());
            pstm.setString(2, funcionario.getUsuario().getSenha());
            pstm.setInt(3, funcionario.getUsuario().getPerfil().getId());
            pstm.executeUpdate();
            
            try {
                pstm = con.prepareStatement(sqlFuncionario);
                pstm.setString(1, funcionario.getCpf());
                pstm.setString(2, funcionario.getNome());
                pstm.setString(3, funcionario.getRg());
                //pstm.setString(4, funcionario.getDataDeNascimento());
                pstm.setString(4, funcionario.getSexo());
                pstm.setString(5, funcionario.getCargo());
                pstm.setString(6, funcionario.getEndereco());
                pstm.setString(7, funcionario.getTelefone());
                pstm.setString(8, funcionario.getEmail());
                    try {
                        pstm.setInt(9, funcionario.getUsuario().validarLogin(funcionario.getUsuario().getUsername(), funcionario.getUsuario().getSenha()).getId());
                    } catch (Exception ex) {
                        System.err.println("erro ao buscar ID USUARIO: "+ex);
                    }
                pstm.executeUpdate();
                return true;
            } catch (SQLException ex) {
                System.err.println("Erro ao salvar FUNCIONARIO: " + ex);
                return false;
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar USUARIO e FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
    
    //Delete (Apagar)
    public boolean delete(Funcionario funcionario){
        String sql = "DELETE FROM Funcionario WHERE idFuncionario = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, funcionario.getId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao deletar FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
}
