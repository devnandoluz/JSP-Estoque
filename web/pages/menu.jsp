<%-- 
    Document   : menu
    Created on : 01/05/2018, 19:13:12
    Author     : Nando Luzy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Menu - Gente Telecom</title>
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
                function excluir(nome,i){
                    var url = "gerenciar_menu.do?option=delete&id="+i;
                        if(confirm("Tem certeza que deseja excluir o menu "+nome+"?")){
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
        <li class="breadcrumb-item active">Menu</li>
      </ol>
      
        <div class="row">
            <div class="col-sm-12">
                  <div class="card mb-3">
                      <div class="card-header bg-dark text-white form-inline">
                              <i class="fa fa-link" style="margin-right: 4px"></i>
                              MENUS CADASTRADOS
                              <div class="navbar-nav ml-auto">
                                  <a class="btn btn-success" style="width: 40px; height: 40px;" href="cadastra_menu.jsp"><b>+</b></a>
                              </div>
                      </div>
                      <div class="card-body">
                          <!--aqui vai a tabela-->
                          <div class="table-responsive">
                              <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                  <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>Link</th>
                                        <th>Status</th>
                                        <th><center>Opção</center></th>
                                  </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>Link</th>
                                        <th>Status</th>
                                        <th><center>Opção</center></th>
                                    </tr>
                                </tfoot>
                                <tbody>                                  
                                      <% 
                                          ArrayList<Menu> lista = new ArrayList();
                                              try{
                                                  Menu menu = new Menu();   

                                                  lista = menu.findAll();
                                              }catch(Exception e){
                                                  out.print("Erro:"+e);
                                              }                                                
                                          for(Menu menu:lista){
                                      %>
                                              <tr>
                                                  <td>
                                                      <center><%= menu.getId()%></center>
                                                  </td>
                                                  <td>
                                                      <center><%= menu.getMenu() %></center>
                                                  </td>
                                                  <td>
                                                      <center><%= menu.getLink() %></center>
                                                  </td>
                                                  <td>
                                                      <center>
                                                          <% 
                                                            if(menu.getStatus() == 1){
                                                                %>
                                                                <i class="fa fa-thumbs-up" style="color: green"></i>
                                                                <%
                                                                out.println("ATIVADO");
                                                            }else{
                                                                if(menu.getStatus() == 0){
                                                                %>
                                                                <i class="fa fa-ban" style="color: red"></i>
                                                                <%
                                                                    out.println("BLOQUEADO");
                                                                }else{
                                                                %>
                                                                <i class="fa fa-question" style="color: yellow"></i>
                                                                <%
                                                                    out.println("Desconhecido");
                                                                }                                                                
                                                            }
                                                          %>
                                                      </center>
                                                  </td>
                                                  <td>
                                                      <a class="btn btn-primary col-md-3" href="alterar_menu.jsp?id=<%= menu.getId() %>" style=" margin: 2px;">
                                                          <span class="fa fa-pencil"></span>
                                                      </a>
                                                      <a class="btn btn-danger col-md-3" href="#" onclick="excluir('<%= menu.getMenu() %>', <%= menu.getId() %>)" style="margin: 2px;">
                                                          <span class="fa fa-trash"></span>
                                                      </a>
                                                  </td>
                                              </tr>
                                      <%
                                          }
                                      %>
                                </tbody>
                              </table>
                          </div>
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
            <!-- Page level plugin JavaScript-->
            <script src="../resources/vendor/datatables/jquery.dataTables.js"></script>
            <script src="../resources/vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="../resources/js/sb-admin-datatables.min.js"></script>
    </div>
</body>
</html>
