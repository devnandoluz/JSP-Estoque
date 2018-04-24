/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;

/**
 *
 * @author 281549
 */
public class ClienteServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //declaração de variaveis que recebem por parametro os valores.
            String option = request.getParameter("option");
            String id = request.getParameter("id");
            String nomeFantasia = request.getParameter("nomeFantasia");
            String cnpj = request.getParameter("cnpj");
            String servicoContratado = request.getParameter("servicoContratado");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");
            String email = request.getParameter("email");
            String descricao = request.getParameter("descricao");
            
            
            
            Cliente cliente = new Cliente();
            
            cliente.setId(Integer.parseInt(id));
            cliente.setNomeFantasia(nomeFantasia);
            cliente.setCnpj(cnpj);
            cliente.setServicoContratado(servicoContratado);
            cliente.setTelefone(telefone);
            cliente.setEndereco(endereco);
            cliente.setEmail(email);
            cliente.setDescricao(descricao);
            
            
            //Decisão de qual metodo CRUD usar.
            switch(option){
                case "insert":{
                try {
                    cliente.insert();
                } catch (Exception ex) {
                    Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                    response.sendRedirect("clientes.jsp");
                }
                break;
                
                
                case "update":{
                    cliente.setId(Integer.parseInt(id));
                try {
                    cliente.update();
                } catch (Exception ex) {
                    Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                    response.sendRedirect("cliente.jsp");
                }
                break;
                
                
                case "delete":{
                    cliente.setId(Integer.parseInt(id));
                try {
                    cliente.delete();
                } catch (Exception ex) {
                    Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                    response.sendRedirect("cliente.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
