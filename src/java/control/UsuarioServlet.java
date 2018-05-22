/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class UsuarioServlet extends HttpServlet {

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
            out.println("<title>Servlet Usuario</title>");            
            out.println("</head>");
            out.println("<body>");            
            
            
            //declaração de variaveis que recebem por parametro os valores.
            String option = request.getParameter("option");
            
            Usuario usuario = new Usuario();
            
            //Decisão de qual metodo CRUD usar.
            switch(option){
                case "update":{
                    Perfil buscar = new Perfil();
                        Perfil perfil = buscar.findForID((Integer.parseInt(request.getParameter("perfil"))));
                        
                        usuario.setPerfil(perfil);
                        usuario.setId(Integer.parseInt(request.getParameter("idUsuario")));
                        usuario.setSenha(request.getParameter("senha"));
                        usuario.setUsername(request.getParameter("username"));
                        usuario.update();
                    response.sendRedirect("home.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Alteração Usuário: " + request.getParameter("username"));
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
            System.err.println("Servlet erro: " + ex);
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
            System.err.println("Servlet erro: " + ex);
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
