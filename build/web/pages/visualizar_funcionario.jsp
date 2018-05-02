<%-- 
    Document   : visualizar_cliente
    Created on : 25/04/2018, 16:11:09
    Author     : Nando Luz
--%>

<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id = request.getParameter("id");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Visualizar Cliente - Gente Telecom</title>
    <!-- Bootstrap core CSS-->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin.css" rel="stylesheet">
    <!--icon-->
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon" />
    
        <script type="text/javascript">
            function excluir(nome,id){
                var url = "gerenciar_funcionario.do?option=delete&id="+id;
                    if(confirm("Tem certeza que deseja excluir o perfil: "+nome+"?")){
                        window.open(url,"_self");
                }
            }
        </script>
    
    </head>
    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@include file="menu/menu_completo.jsp" %>
        <div class="content-wrapper">
            <div class="container-fluid">
                  <!-- Breadcrumbs-->
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="home.jsp">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="funcionario.jsp">Funcionário</a>
                    </li>
                    <li class="breadcrumb-item active">Visualizar fucionário</li>
                  </ol>
                  <div class="card mb-3">
                        <div class="card-header bg-warning text-white form-inline">
                            <div class="form-inline my-2 my-lg-0 mr-lg-2">
                                <i class="fa fa-id-badge" style="margin-right: 4px"></i>
                                VISUALIZAR FUNCIONARIO
                                <div class="navbar-nav ml-auto" style="width: 40px; height: 40px;">                                
                                </div>
                            </div>
                        </div> 
                        <div class="card-body">
                            <div class="col-12">
                                <table class="text-center table table-bordered col-md-6" id="dataTable">

                                    <%
                                        Funcionario buscar = new Funcionario();
                                        Funcionario funcionario = buscar.findForID(Integer.parseInt(id));
                                        
                                            
                                            %>
                                            <tr>
                                                <th> Nome: </th><td><%= funcionario.getNome()%></td>
                                            </tr>
                                            <tr>
                                                <th> CPF: </th><td><%= funcionario.getCpf()%></td>
                                            </tr>
                                            <tr>
                                                <th> RG: </th><td><%= funcionario.getRg()%></td>
                                            </tr>                                            
                                            <tr>
                                                <th> Cargo: </th><td><%= funcionario.getCargo()%></td>
                                            </tr>
                                            <tr>
                                                <th> Data de Nascimento: </th><td><%= funcionario.getDataDeNascimento()%></td>
                                            </tr>
                                            <tr>
                                                <th> Sexo: </th><td><%= funcionario.getSexo()%></td>
                                            </tr>
                                            <tr>
                                                <th> Endereço: </th><td><%= funcionario.getEndereco()%></td>
                                            </tr>
                                            <tr>
                                                <th> Telefone: </th><td><%= funcionario.getTelefone()%></td>
                                            </tr>
                                            <tr>
                                                <th> E-mail: </th><td><%= funcionario.getEmail()%></td>
                                            </tr>
                                    
                                </table>
                                <div class="text-center">
                                    <a class="btn btn-danger col-md-3" href="#" onclick="excluir('<%= funcionario.getNome() %>', <%= funcionario.getId() %>)" style="margin: 2px;">
                                        <span class="fa fa-trash"></span>
                                        EXCLUIR
                                    </a>
                                    <a class="btn btn-primary col-md-3" href="alterar_funcionario.jsp?id=<%= funcionario.getId() %>" style=" margin: 2px;">
                                        <span class="fa fa-pencil"></span>
                                        ALTERAR
                                    </a>
                                    <a class="btn btn-primary col-md-3" href="funcionario.jsp"style="margin: 2px;">
                                        <span class="fa fa-reply"></span>
                                        VOLTAR
                                    </a>
                                </div>
                            </div>
                        </div>
                  </div>
            </div>   
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
              <div class="container">
                <div class="text-center">
                  <small>Gente Telecom do Brasil © 2018 Todos os Direitos Reservados</small>
                </div>
              </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pronto para partir?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  </div>
                  <div class="modal-body">Selecione "Sair" abaixo, se você estiver pronto para encerrar sua sessão atual.</div>
                  <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="login.jsp">Sair</a>
                  </div>
                </div>
              </div>
            </div>
            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
        </div>
    </body>
</html>
