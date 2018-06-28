<%-- 
    Document   : alterar_instalacao
    Created on : 23/04/2018, 10:31:22
    Author     : Nando Luz
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
%>
<%@page import="model.Instalacao"%>
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
    <title>Alterar Instalação - Gente Telecom</title>
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
  <%@include file="menu/navigation.jsp" %>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="home.jsp">Home</a>
        </li>
        <li class="breadcrumb-item">
          <a href="instalacao.jsp">Instalação</a>
        </li>
        <li class="breadcrumb-item active">Alterar Instalação</li>
      </ol>
      <div class="card-body">
          <div class="col-md-12">
              <div>
                  <hr>
                  <center><h3 class="h5">ALTERE O FORMULARIO ABAIXO</h3></center>
                  <hr>
                  <br>
              </div>                  
              <form id="formCliente" data-toggle="validator" role="form" method="get" action="gerenciar_instalacao.do">
                    <div class="row">
                        <%
                            Instalacao buscar = new Instalacao();
                            Instalacao instalacao = buscar.findForID(id);
                        %>
                        <div class="form-group col-md-12">
                            <label class="form-label">TIPO</label>
                            <input name="tipo" value="<%= instalacao.getTipo() %>" type="text" class="form-control" placeholder="Tipo da instalação" data-error="Este campo é necessário." autofocus required>
                            <div class="help-block with-errors"></div>
                        </div>                       
                        <div class="form-group col-md-4">
                            <label class="form-label">VALOR</label>
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </span>
                                <input name="valor" value="<%= instalacao.getValor()%>" type="text" class="form-control" placeholder="0.00" data-error="Este campo é necessário.">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">DATA INICIAL</label>
                            <div class="input-group" id="datetimepicker1">
                                    <span class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                    </span>
                                
                                                <%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                %>
                                                <input name="data_inicial" value="<%= sdf.format(instalacao.getData_inicial())%>" type="text" autocomplete="off" class="form-control data datepicker" data-provide="datepicker" placeholder="00/00/0000" data-error="Este campo é necessário." required>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">DATA FINAL</label>
                            <div class="input-group" id="datetimepicker1">
                                    <span class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                    </span>
                                <input name="data_final" value="<%= sdf.format(instalacao.getData_final())%>" type="text" autocomplete="off" class="form-control data datepicker" data-provide="datepicker" placeholder="00/00/0000">
                            </div>
                            <small id="Help" class="form-text text-muted">Este campo não é obrigatório.</small>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="form-label">CLIENTE</label>
                             <% 
                                ArrayList<Cliente> lista = new ArrayList();
                                    try{
                                        Cliente buscarC = new Cliente();   
                                        lista = buscarC.findAll();
                                    }catch(Exception e){
                                        out.print("Erro:"+e);
                                    }                      
                                    %>
                            <select name="cliente" class="form-control" required>
                                <option value="Outro" selected disabled>Selecione</option>
                                <%
                                    for(Cliente cliente:lista){
                                %>
                                        <option value="<%=cliente.getId()%>"
                                            <%if(instalacao.getCliente() != null){
                                                if( instalacao.getCliente().getId() == (cliente.getId()) ){
                                                    %> selected <% }
                                                } %>
                                        ><!--Fecha a tag-->
                                          <%= cliente.getNomeFantasia()%> 
                                      </option>
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
    <%@include file="rodape.jsp" %>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>

            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="../resources/js/validator.min.js"></script>
            <!-- script customizado para todas as páginas-->
            <script src="../resources/js/sb-admin.min.js"></script>
            <!--datepicker-->
            <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>
            <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.pt-BR.min.js"></script>
            <script>
                jQuery(document).ready(function (){
                    $(".data").mask("00/00/0000");
                });
                $('.datepicker').datepicker({
                    format: 'dd/mm/yyyy',
                    language: "pt-BR"
                });
            </script>
    </div>
</body>
</html>
