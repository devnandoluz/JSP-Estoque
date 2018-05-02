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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
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
  <%@include file="menu/menu_completo.jsp" %>
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
            <div class="card-header bg-primary text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-user-plus" style="margin-right: 4px"></i>
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
              <form id="formCliente" data-toggle="validator" role="form" method="get" action="gerenciar_menu.do">
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
<!--                            <input name="servico_contratado" type="checkbox" class="form-control" value="0" data-error="Este campo é necessário." required>
                            Desativado
                            <input name="servico_contratado" type="checkbox" class="form-control" value="0" data-error="Este campo é necessário." required>
                            Ativado-->
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="form-label">LINK</label>
                            <input value="<%= menu.getLink() %>" name="link" type="text" class="form-control" placeholder="Link do MENU..." data-error="Por favor, informe um CNPJ válido." required>
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
