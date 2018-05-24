package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Funcionario;
import model.Log;
import model.Perfil;
import model.Usuario;

/**
 *
 * @author Nando Luz
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class FuncionarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FuncionarioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //declaração de variaveis que recebem por parametro os valores.
            
            //opção escolhida
            String option = request.getParameter("option");            
            
            //init
            Funcionario funcionario = new Funcionario();
            Usuario usuario = new Usuario();
            
            //Decisão de qual metodo CRUD usar.
            switch(option){
                case "insert":{
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    
                    funcionario.setCpf(request.getParameter("cpf"));
                    funcionario.setNome(request.getParameter("nome"));
                    funcionario.setRg(request.getParameter("rg"));
                    funcionario.setDataDeNascimento(sdf.parse(request.getParameter("data_de_nascimento")));
                    funcionario.setEndereco(request.getParameter("endereco"));
                    funcionario.setSexo(request.getParameter("sexo"));
                    funcionario.setCargo(request.getParameter("cargo"));
                    funcionario.setTelefone(request.getParameter("telefone"));
                    funcionario.setEmail(request.getParameter("email"));
                    
                    int id = Integer.parseInt(request.getParameter("perfil"));
                    
                    if(id != 0){
                        Perfil buscar = new Perfil();           
                        Perfil perfil = buscar.findForID((id));
                        usuario.setPerfil(perfil);
                        usuario.setSenha(request.getParameter("senha"));
                        usuario.setUsername(request.getParameter("username"));
                        funcionario.setUsuario(usuario);
                        funcionario.insert();
                    }else{
                        usuario = null;
                        funcionario.setUsuario(usuario);
                        funcionario.insertSemUsuario();
                    }
                    
                    response.sendRedirect("funcionario.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Cadastro Funcionário: " + request.getParameter("nome"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario f = new Funcionario();
                    log.setFuncionario(f.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                
                
                case "update":{
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    
                    funcionario.setCpf(request.getParameter("cpf"));
                    funcionario.setNome(request.getParameter("nome"));
                    funcionario.setRg(request.getParameter("rg"));
                    funcionario.setDataDeNascimento(sdf.parse(request.getParameter("data_de_nascimento")));
                    funcionario.setEndereco(request.getParameter("endereco"));
                    funcionario.setSexo(request.getParameter("sexo"));
                    funcionario.setCargo(request.getParameter("cargo"));
                    funcionario.setTelefone(request.getParameter("telefone"));
                    funcionario.setEmail(request.getParameter("email"));
                    funcionario.setId(Integer.parseInt(request.getParameter("id")));
                    
                    int id = Integer.parseInt(request.getParameter("perfil"));
                    
                    if(id != 0){
                        Perfil buscar = new Perfil();
                        Perfil perfil = buscar.findForID((Integer.parseInt(request.getParameter("perfil"))));
                        
                        usuario.setPerfil(perfil);
                        usuario.setId(Integer.parseInt(request.getParameter("idUsuario")));
                        usuario.setSenha(request.getParameter("senha"));
                        usuario.setUsername(request.getParameter("username"));
                        funcionario.setUsuario(usuario);
                        funcionario.update();
                    }else{
                        usuario = null;
                        funcionario.setUsuario(usuario);
                        funcionario.updateSemUsuario();
                    }
                    response.sendRedirect("funcionario.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Alteração Funcionário: " + request.getParameter("nome"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario f = new Funcionario();
                    log.setFuncionario(f.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                
                case "delete":{
                    funcionario.setId(Integer.parseInt(request.getParameter("id")));
                    funcionario.delete();
                    response.sendRedirect("funcionario.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Exclusão Funcionário: " + request.getParameter("nome"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario f = new Funcionario();
                    log.setFuncionario(f.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                        
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(FuncionarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(FuncionarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
