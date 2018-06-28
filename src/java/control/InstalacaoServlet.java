/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Funcionario;
import model.Instalacao;
import model.Log;
import model.Usuario;

/**
 *
 * @author Nando Luzy
 */
public class InstalacaoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InstalacaoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //opção escolhida
            String option = request.getParameter("option");            
            
            //init
            Instalacao instalacao = new Instalacao();
            Cliente cliente = new Cliente();
            
            //Decisão de qual metodo CRUD usar.
            switch(option){
                case "insert":{
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    
                    instalacao.setTipo(request.getParameter("tipo"));
                    instalacao.setValor(Double.parseDouble(request.getParameter("valor")));
                    instalacao.setData_inicial(sdf.parse(request.getParameter("data_inicial")));
                    if((request.getParameter("data_final")) != ""){
                        instalacao.setData_final(sdf.parse(request.getParameter("data_final")));
                    }               
                try {
                    instalacao.setCliente(cliente.findForID(Integer.parseInt(request.getParameter("cliente"))));                    
                    instalacao.insert();
                } catch (Exception ex) {
                    System.err.println("INSTALAÇÃO Erro ao buscar cliente." + ex);
                }
                    
                    response.sendRedirect("instalacao.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Cadastro de uma nova INSTALAÇÃO: " + (request.getParameter("tipo")));
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
                    
                    instalacao.setId(Integer.parseInt(request.getParameter("id")));
                    
                    instalacao.setTipo(request.getParameter("tipo"));
                    instalacao.setValor(Double.parseDouble(request.getParameter("valor")));
                    instalacao.setData_inicial(sdf.parse(request.getParameter("data_inicial")));
                    instalacao.setData_final(sdf.parse(request.getParameter("data_final")));
                    instalacao.setCliente(cliente.findForID(Integer.parseInt(request.getParameter("cliente"))));
                    
                    instalacao.update();
                    response.sendRedirect("instalacao.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Alteração na INSTALAÇÃO: " + request.getParameter("tipo"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario f = new Funcionario();
                    log.setFuncionario(f.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                
                case "delete":{
                    instalacao.setId(Integer.parseInt(request.getParameter("id")));
                    instalacao.delete();
                    response.sendRedirect("instalacao.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Exclusão da INSTALAÇÃO: " + request.getParameter("tipo"));
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
            Logger.getLogger(InstalacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InstalacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
