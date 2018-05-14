<%-- 
    Document   : log
    Created on : 16/04/2018, 11:45:34
    Author     : Nando Luz
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Log"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luzs" content="4I">
    <title>Log de Ações - Gente Telecom</title>
    <!-- Bootstrap CSS-->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--fonts-->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--plugin CSS-->
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!--styles-->
    <link href="../resources/css/sb-admin.css" rel="stylesheet">
    <!--icon-->
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon" />
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
        <li class="breadcrumb-item active">Log de Ações</li>
      </ol>
      
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Data Table Example</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>ID</th>  
                  <th>Ação</th>
                  <th>Responsável</th>
                  <th>Data</th>
                </tr>
              </thead>
              <tfoot>
                  <tr>
                    <th>ID</th>  
                    <th>Ação</th>
                    <th>Responsável</th>
                    <th>Data</th>
                  </tr>
              </tfoot>
              <tbody>
                  <%
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                  %>
                <%
                    ArrayList<Log> lista = new ArrayList();
                    Log buscar = new Log();
                    
                    lista = buscar.findAll();
                    
                    for(Log log:lista){
                        %>
                        <tr>
                            <td><%=log.getId()%></td>
                            <td><%=log.getNome()%></td>
                            <td><%=log.getFuncionario().getNome()%></td>
                            <td><%=sdf.format(log.getData())%></td>
                        </tr>
                    <%
                    }
                %>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Atualizado minutos atrás</div>
      </div>
    </div>
    <%@include file="rodape.jsp" %>
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

