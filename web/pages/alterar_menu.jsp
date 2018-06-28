<%-- 
    Document   : cadastra_cliente
    Created on : 23/04/2018, 13:22:42
    Author     : Nando Luz
--%>

<%@page import="model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("id");
%>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Alterar Menu - Gente Telecom</title>
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
        <li class="breadcrumb-item">
          <a href="menu.jsp">Menu</a>
        </li>
        <li class="breadcrumb-item active">Alterar menu</li>
      </ol>
      <div class="card mb-3">
            <div class="card-header bg-dark text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-link" style="margin-right: 4px"></i>
                    <i class="fa fa-pencil" style="margin-right: 4px"></i>
                    ALTERAR MENU  
                    <div class="navbar-nav ml-auto" style="width: 40px; height: 40px;">                                
                    </div>
                </div>                
            </div> 
        <div class="card-body">
          <div class="col-md-12">
              <div>
                  <hr>
                  <center><h3 class="h5">ALTERE O FORMULARIO ABAIXO</h3></center>
                  <hr>
                  <br>
              </div>                  
              <form id="formCliente" data-toggle="validator" role="form" method="post" action="gerenciar_menu.do">
                    <%
                        Menu buscar = new Menu();
                        Menu menu = buscar.findForID(Integer.parseInt(id));
                    %>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">NOME</label>
                            <input value="<%= menu.getMenu() %>" name="nome"  type="text" class="form-control" placeholder="Nome do MENU..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">STATUS</label>
                            <input value="<%= menu.getStatus() %>" name="status" type="text" class="form-control" placeholder="0 ou 1..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">ICONE</label>
                            <input value="<%= menu.getIcone() %>" name="icone" type="text" class="form-control" placeholder="font-awesome(Ex: fa-icon)" >
                            <a href="https://fontawesome.com/v4.7.0/icons/" target="_blank"><small id="Help" class="form-text text-muted"> Ver lista de icones.</small></a>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">LINK</label>
                            <input value="<%= menu.getLink()%>" name="link" type="text" class="form-control" placeholder="pagina.jsp" data-error="Por favor, informe um CNPJ válido." required>
                            <div class="help-block with-errors"></div>
                        </div>
                            <input type="hidden" name="id" value="<%= id %>">
                    </div>
                    
                    <div class="form-group align-content-center">
                        <center>
                            
                            <button class="btn btn-success col-md-3" name="option" value="update" style="margin: 2px;">
                                <i class="fa fa-pencil"></i> 
                                ALTERAR
                            </button>
                            <a class="btn btn-primary col-md-3" href="menu.jsp" style="margin: 2px;">
                                <i class="fa fa-reply"></i>
                                CANCELAR
                            </a>
                        </center>
                    </div>
                </form>
          </div>
      </div>      
          
      </div>
        
    </div>
            <%@include  file="rodape.jsp"%>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>
            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="../resources/js/validator.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
    </div>
</body>
</html>
