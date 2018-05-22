/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Menu;
import model.Perfil;

/**
 *
 * @author Nando Luzy
 */
public class PerfilServlet extends HttpServlet {

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
            out.println("<html pt-br>");
            out.println("<head>");
            out.println("<title>Servlet PerfilServlet</title>");        
            out.println("</head>");
            out.println("<body>");
            
            String option = request.getParameter("option");
            
            Perfil perfil = new Perfil();
            
            switch(option){
                case "insert":{
                    
                    int cont = (Integer.parseInt(request.getParameter("cont")));
                    out.print(request.getParameter("menu"+1));//pagar
                    int posicao = 0;
                    int[] menu = new int[cont];
                    for(int i = 1; i <= cont + 1; i++){
                        if(((request.getParameter("menu"+i)) != null)){
                            menu[posicao] = (Integer.parseInt(request.getParameter("menu"+i)));
                        }
                    }
                    perfil.setMenu(menu);
                    perfil.setPerfil(request.getParameter("perfil"));
                    perfil.setStatus(Integer.parseInt(request.getParameter("status")));
                    perfil.insert();
                    response.sendRedirect("perfil.jsp");
                }
                break;
                
                case "update":{
                    perfil.setPerfil(request.getParameter("perfil"));
                    perfil.setStatus(Integer.parseInt(request.getParameter("status")));
                    perfil.setId(Integer.parseInt(request.getParameter("id")));
                    perfil.update();
                    response.sendRedirect("perfil.jsp");
                }
                break;
                
                case "delete":{
                    perfil.setId(Integer.parseInt(request.getParameter("id")));
                    perfil.delete();
                    response.sendRedirect("perfil.jsp");
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
            Logger.getLogger(PerfilServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PerfilServlet.class.getName()).log(Level.SEVERE, null, ex);
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
