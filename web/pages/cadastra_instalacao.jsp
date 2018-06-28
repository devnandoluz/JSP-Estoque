<%-- 
    Document   : cadastra_instalacao
    Created on : 23/04/2018, 13:30:10
    Author     : Nando Luz
--%>

<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Nova Instalação - Gente Telecom</title>
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
    
    <link href="../resources/vendor/bootstrap/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <%@include file="menu/navigation.jsp"%>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="home.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active">Adicionar > Instalação</li>
      </ol>
      <div class="card mb-3">
            <div class="card-header bg-danger text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-wrench" style="margin-right: 4px"></i>
                    <i class="fa fa-plus" style="margin-right: 4px"></i>
                    NOVA INSTALAÇÃO
                    <div class="navbar-nav ml-auto" style="width: 40px; height: 40px;">                                
                    </div>
                </div>                
            </div> 
        <div class="card-body">
          <div class="col-md-12">
              <div>
                  <hr>
                  <center><h3 class="h5">PREENCHA O FORMULARIO ABAIXO</h3></center>
                  <hr>
                  <br>
              </div>                  
              <form id="formCliente" data-toggle="validator" role="form" method="get" action="gerenciar_instalacao.do">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="form-label">TIPO</label>
                            <input name="tipo"  type="text" class="form-control" placeholder="Tipo da instalação" data-error="Este campo é necessário." autofocus required>
                            <div class="help-block with-errors"></div>
                        </div>                       
                        <div class="form-group col-md-4">
                            <label class="form-label">VALOR</label>
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </span>
                                <input name="valor"  type="text" class="form-control" placeholder="0.00" data-error="Este campo é necessário.">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">DATA INICIAL</label>
                            <div class="input-group" id="datetimepicker1">
                                    <span class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                    </span>
                                <input name="data_inicial" type="text" autocomplete="off" class="form-control data datepicker" data-provide="datepicker" placeholder="00/00/0000" data-error="Este campo é necessário." required>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">DATA FINAL</label>
                            <div class="input-group" id="datetimepicker1">
                                    <span class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                    </span>
                                <input name="data_final" type="text" autocomplete="off" class="form-control data datepicker" data-provide="datepicker" placeholder="00/00/0000">
                            </div>
                            <small id="Help" class="form-text text-muted">Este campo não é obrigatório.</small>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="form-label">CLIENTE</label>
                             <% 
                                ArrayList<Cliente> lista = new ArrayList();
                                    try{
                                        Cliente buscar = new Cliente();   
                                        lista = buscar.findAll();
                                    }catch(Exception e){
                                        out.print("Erro:"+e);
                                    }                      
                                    %>
                            <select name="cliente" class="form-control" required>
                                <option value="Outro" selected disabled>Selecione</option>
                                <%
                                    for(Cliente cliente:lista){
                                %>
                                        <option value="<%=cliente.getId() %>"><%= cliente.getNomeFantasia()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group align-content-center">
                        <center>
                            <button class="btn btn-success col-md-3" name="option" value="insert" style="margin: 2px;">
                                <i class="fa fa-plus"></i> 
                                CADASTRAR
                            </button>
                            <a class="btn btn-primary col-md-3" href="instalacao.jsp" style="margin: 2px;">
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
    <%@include file="rodape.jsp" %>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../resources/js/validator.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin.min.js"></script>
    <!--datepicker-->
    <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.pt-BR.min.js"></script>
    </div>
    <script>
        jQuery(document).ready(function (){
            $(".data").mask("00/00/0000");
        });
        $('.datepicker').datepicker({
            format: 'dd/mm/yyyy',
            language: "pt-BR"
        });
    </script>
</body>
</html>
