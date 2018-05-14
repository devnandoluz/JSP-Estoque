<%-- 
    Document   : cadastra_produto
    Created on : 23/04/2018, 13:29:17
    Author     : Nando Luz
--%>

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
    <title>Novo Produto - Gente Telecom</title>
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
                <a href="estoque.jsp">Estoque</a>
            </li>
            <li class="breadcrumb-item active">Novo produto</li>
      </ol>
      <div class="card mb-3">
            <div class="card-header bg-success text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-vcard" style="margin-right: 4px"></i>
                    <i class="fa fa-plus" style="margin-right: 4px"></i>
                    NOVO PRODUTO
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
              <form id="formCliente" data-toggle="validator" role="form" method="get" action="gerenciar_produto.do">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="form-label">NOME</label>
                            <input name="nome"  type="text" class="form-control" placeholder="Nome do PRODUTO..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label class="form-label">QUANTIDADE</label>
                            <input name="quantidade"  type="number" class="form-control" placeholder="Quantidade do PRODUTO..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">VALOR UNITARIO</label>
                            <div class="input-group">
                                <span class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </span>
                                <input name="valor"  type="text" class="form-control" placeholder="0.00" data-error="Este campo é necessário.">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">CATEGORIA</label>
                            <select name="categoria" class="form-control" required>
                                <option value="Outro" selected disabled>Selecione</option>
                                <option value="Construção">Construção</option>
                                <option value="Elétrico">Elétrico</option>
                                <option value="Telecom">Telecom</option>
                                <option value="Informática">Informática</option>
                                <option value="Outro">Outro</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group align-content-center">
                        <center>
                            <button class="btn btn-success col-md-3" name="option" value="insert" style="margin: 2px;">
                                <i class="fa fa-plus"></i> 
                                CADASTRAR
                            </button>
                            <a class="btn btn-primary col-md-3" href="estoque.jsp" style="margin: 2px;">
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
            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="../resources/js/validator.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
    </div>
</body>
</html>
