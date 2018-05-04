/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAOperfil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;
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
                    DAOperfil dao = new DAOperfil();
                    Perfil buscar = new Perfil();   
                    String id = request.getParameter("perfil");              
                    Perfil perfil = buscar.findForID(Integer.parseInt(id));
                    usuario.setPerfil(perfil);
                    usuario.setSenha(request.getParameter("senha"));
                    usuario.setUsername(request.getParameter("username"));
                    funcionario.setUsuario(usuario);
                    
                    funcionario.setCpf(request.getParameter("cpf"));
                    funcionario.setNome(request.getParameter("nome"));
                    funcionario.setRg(request.getParameter("rg"));
                    //funcionario.setDataDeNascimento(request.getParameter("data_de_nascimento"));
                    funcionario.setEndereco(request.getParameter("endereco"));
                    funcionario.setSexo(request.getParameter("sexo"));
                    funcionario.setCargo(request.getParameter("cargo"));
                    funcionario.setTelefone(request.getParameter("telefone"));
                    funcionario.setEmail(request.getParameter("email"));
                    
                    funcionario.insert();
                    
                    response.sendRedirect("funcionario.jsp");
                }
                break;
                
                
                case "update":{
                    usuario.setPerfil(request.getParameter("perfil"));
                    usuario.setSenha(request.getParameter("senha"));
                    usuario.setUsername(request.getParameter("username"));
                    
                    funcionario.setCpf(request.getParameter("cpf"));
                    funcionario.setNome(request.getParameter("nome"));
                    funcionario.setRg(request.getParameter("rg"));
                    //funcionario.setDataDeNascimento(request.getParameter("data_de_nascimento"));
                    funcionario.setEndereco(request.getParameter("endereco"));
                    funcionario.setSexo(request.getParameter("sexo"));
                    funcionario.setCargo(request.getParameter("cargo"));
                    funcionario.setTelefone(request.getParameter("telefone"));
                    funcionario.setEmail(request.getParameter("email"));
                    funcionario.setId(Integer.parseInt(request.getParameter("id")));
                    funcionario.update();
                    response.sendRedirect("funcionario.jsp");
                }
                break;
                
                
                case "delete":{
                    funcionario.setId(Integer.parseInt(request.getParameter("id")));
                    funcionario.delete();
                    response.sendRedirect("funcionario.jsp");
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
