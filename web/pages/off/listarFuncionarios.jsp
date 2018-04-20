<%-- 
    Document   : listarFuncionarios
    Created on : 04/04/2018, 20:48:05
    Author     : Administrador
--%>

<%@page import="model.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Stylo da pagina-->
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
        <link rel="shortcut icon" href="../imagens/favicon/favicon.ico" type="image/x-icon" />
        <script type="text/javascript">
            function excluir(nome,id){
                var url = "gerenciar_funcionario.do?option=delete&id="+id;
                    if(confirm("Tem certeza que deseja excluir o perfil: "+nome+"?")){
                        window.open(url,"_self");
                }
            }
        </script>
        <title>Lista de Funcionarios</title>
    </head>
    <body>
        <h1 class="navbar navbar-text ">Funcionario</h1>
        <br>
        <% 
            ArrayList<Funcionario> lista = new ArrayList();
                try{
                    Funcionario funcionario = new Funcionario();                    
                    lista = funcionario.findAll();
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
        %>
        <a class="btn btn-dark" href="home.jsp"> &lt; Voltar</a>
        <a class="btn btn-success" href="cadastrarFuncionario.jsp">+Novo</a>
        <br><br>
        <table class="text-center table table-bordered col-md-6" id="dataTable">
                    <tr >
                        <th> Nome </th>
                        <th> CPF </th>
                        <th> Cargo </th>
                        <th> Opção </th>
                    </tr>
            <%
                for(Funcionario funcionario2:lista){
                    %>
                    <tr>
                        <td>
                            <%= funcionario2.getNome()%>
                        </td>
                        <td>
                            <%= funcionario2.getCpf()%>
                        </td>
                        <td>
                            <%= funcionario2.getCargo()%>
                        </td>
                        <td>
                            <a class="btn btn-primary " href="funcinarioFullView.jsp?id=<%=funcionario2.getId()%>&nome=<%=funcionario2.getNome()%>" >  Ver  </a>
                            <a class="btn btn-primary " href="alterarFuncionario.jsp?id=<%=funcionario2.getId()%>" >  Alterar  </a>
                            <a class="btn btn-danger " href="#" onclick="excluir('<%= funcionario2.getNome()%>', <%= funcionario2.getId() %>)">  Excluir  </a>
                        </td>
                    </tr>  
            <%
                }
            %>
        </table>
        <!-- Bootstrap JavaScript-->
        <script src="resources/jquery/jquery.js"></script>
        <script src="resources/bootstrap/js/bootstrap.bundle.js"></script>
        <!-- JavaScript-->
        <script src="resources/jquery-easing/jquery.easing.js"></script>
    </body>
</html>
