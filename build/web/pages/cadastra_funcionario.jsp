<%-- 
    Document   : cadastra_funcionario
    Created on : 23/04/2018, 13:29:28
    Author     : Nando Luz
--%>

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
    <title>Novo Funcionário - Gente Telecom</title>
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
          <a href="funcionario.jsp">Funcionário</a>
        </li>
        <li class="breadcrumb-item active">Novo funcionario</li>
      </ol>
      <div class="card mb-3">
           <div class="card-header bg-warning text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-plus-square-o" style="margin-right: 4px"></i>
                    NOVO FUNCIONARIO   
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
              <form id="formCliente" data-toggle="validator" role="form" method="post" action="gerenciar_funcionario.do">
                    
                    <div class="form-group">
                        <label class="form-label">NOME</label>
                        <input name="nome"  type="text" class="form-control" placeholder="Nome do funcionário..." data-error="Este campo é necessário." required>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">CPF</label>
                                <input name="cpf" type="text" class="form-control" placeholder="CPF do funcionário..." data-error="Por favor, informe um CPF válido."data-minlength="14" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">RG</label>
                            <input name="rg" type="text" class="form-control" placeholder="RG do funcionário..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">SEXO</label>
                                <input name="sexo" type="text" class="form-control" placeholder="SEXO do funcionário..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">CARGO</label>
                            <input name="cargo" type="text" class="form-control" placeholder="CARGO do funcionário..." data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">DATA DE NASCIMENTO</label>
                        <input name="data_de_nascimento" type="text" class="form-control" placeholder="00/00/0000" data-error="Este campo é necessário.">
                        <div class="help-block with-errors"></div>
                    </div>
                  
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">TELEFONE</label>
                            <input name="telefone" type="text" class="form-control" placeholder="(00)00000-0000">
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">E-MAIL</label>
                            <input name="email" type="email" class="form-control" placeholder="exemplo@email.com" data-error="Por favor, informe um E-MAIL válido.">
                        </div>
                    </div>
                    <div class="form-group align-content-center">
                        <center>
                            <button class="btn btn-success col-md-3" name="option" value="insert">
                                <i class="fa fa-plus"></i>
                                CADASTRAR
                            </button>
                            <a class="btn btn-primary col-md-3" href="funcionario.jsp" name="cancelar" style="margin: 2px;">
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
