<%-- 
    Document   : cliente
    Created on : 23/04/2018, 13:32:31
    Author     : Nando Luz
--%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>


    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="Nando Luz" content="4I">
        <title>Cliente - Gente Telecom</title>
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
                    var url = "gerenciar_cliente.do?option=delete&id="+id;
                        if(confirm("Tem certeza que deseja excluir o perfil: "+nome+"?")){
                            window.open(url,"_self");
                    }
                }
            </script>
    
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <!-- Navigation-->
    <%@include file="menu/navigation.jsp" %>
    <div class="content-wrapper">
      <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="home.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">Cliente</li>
        </ol>

        <div class="row">
            <div class="col-sm-12">
                  <div class="card mb-3">
                      <div class="card-header bg-primary text-white form-inline">
                              <i class="fa fa-users" style="margin-right: 4px"></i>
                              CLIENTES CADASTRADOS
                              <div class="navbar-nav ml-auto">
                                  <a class="btn btn-success" style="width: 40px; height: 40px;" href="cadastra_cliente.jsp"><b>+</b></a>
                              </div>
                      </div>
                      <div class="card-body">
                          <!--aqui vai a tabela-->
                          <div class="table-responsive">
                              <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                  <tr>
                                    <th>Nome</th>
                                    <th>CNPJ</th>
                                    <th><center>Opção</center></th>
                                  </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Nome</th>
                                        <th>CNPJ</th>
                                        <th><center>Opção</center></th>
                                    </tr>
                                </tfoot>
                                <tbody class="">                                  
                                      <% 
                                          ArrayList<Cliente> lista = new ArrayList();
                                              try{
                                                  Cliente cliente = new Cliente();   

                                                  lista = cliente.findAll();
                                              }catch(Exception e){
                                                  out.print("Erro:"+e);
                                              }                                                
                                          for(Cliente cliente:lista){
                                      %>
                                              <tr>
                                                  <td>
                                                      <center><%= cliente.getNomeFantasia() %></center>
                                                  </td>
                                                  <td>
                                                      <center><%= cliente.getCnpj() %></center>
                                                  </td>
                                                  <td>
                                                      <a class="btn btn-primary col-md-3" href="visualizar_cliente.jsp?id=<%= cliente.getId() %>&nome=<%= cliente.getNomeFantasia() %>" style="margin: 2px;">
                                                          <span class="fa fa-eye"></span>
                                                      </a>
                                                      <a class="btn btn-primary col-md-3" href="alterar_cliente.jsp?id=<%= cliente.getId() %>" style=" margin: 2px;">
                                                          <span class="fa fa-pencil"></span>
                                                      </a>
                                                      <a class="btn btn-danger col-md-3" href="#" onclick="excluir('<%= cliente.getNomeFantasia() %>', <%= cliente.getId() %>)" style="margin: 2px;">
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
