package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author Nando Luzy
 */
public class SegurancaServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SegurancaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String option = request.getParameter("option");
                switch(option){
                    
                    case "login":{
                        try {
                            String username = (request.getParameter("username"));
                            String senha = (request.getParameter("senha"));
                            
                            Usuario usuario = new Usuario();
                            Usuario usuarioLogado = usuario.validar(username, senha);
                            
                            if(usuarioLogado != null){
                                HttpSession sessao = request.getSession();
                                sessao.setAttribute("usuario", usuarioLogado);
                                
                                
                                response.sendRedirect("home.jsp");
                            }else{
                                 out.print("<script>alert('Usuário ou Senha inválido(s)!');location.href='../index.jsp';</script>");
                            }
                        } catch (IOException ex) {
                            System.err.println("Erro ao validar!" + ex);
                        }
                    }
                    break;

                    case "logout":{
                        HttpSession sessao = request.getSession();
                        sessao.removeAttribute("usuario");
                        sessao.invalidate();
                        response.sendRedirect("../index.jsp");
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
            Logger.getLogger(SegurancaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SegurancaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
