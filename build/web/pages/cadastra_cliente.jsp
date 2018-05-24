<%-- 
    Document   : cadastra_cliente
    Created on : 23/04/2018, 13:29:42
    Author     : Nando Luz
--%>
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
    <title>Novo Cliente - Gente Telecom</title>
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
          <a href="cliente.jsp">Cliente</a>
        </li>
        <li class="breadcrumb-item active">Cadastrar cliente</li>
      </ol>
      <div class="card mb-3">
            <div class="card-header bg-primary text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-user-plus" style="margin-right: 4px"></i>
                    NOVO CLIENTE   
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
              <form id="formCliente" data-toggle="validator" role="form" method="post" action="gerenciar_cliente.do">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">NOME FANTASIA</label>
                            <input name="nome_fantasia"  type="text" class="form-control" placeholder="Nome fantasia da empresa." data-error="Este campo é necessário." autofocus required>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="form-label">CNPJ</label>
                            <input name="cnpj" type="text" placeholder="00.000.000/0000-00" class="form-control cnpj" data-error="Por favor, informe um CNPJ válido." data-minlength="18" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="form-label">INSCRIÇÃO ESTADUAL</label>
                            <input name="ie" type="text" placeholder="0000000000000" class="form-control ie" data-error="Por favor, informe um I.E. válido." data-minlength="13" required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="row">
                          <!--select-->
                          <div class="form-group col-md-3">
                              <label class="form-label">SERVIÇO CONTRATADO</label>
                              <select name="servico_contratado" class="form-control" data-error="Este campo é necessário." required>
                                  <option disabled selected>Selecione</option>
                                  <option>VoIP</option>
                                  <option>Internet</option>
                                  <option>VoIP e Internet</option>
                                  <option>Outro</option>
                              </select>
                          </div>
                          <div class="form-group col-md-3">
                            <label class="form-label">QUANTIDADE</label>
                            <input name="quantidade" type="text" class="form-control" placeholder="Ramal ou Mega" data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                         <div class="form-group col-md-3">
                            <label class="form-label ">VALOR</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <input name="valor" type="text" placeholder="0.00" class="form-control" data-error="Por favor, informe um VALOR válido." required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                          <div class="form-group col-md-3">
                                <label class="form-label">DATA DE ADESÃO</label>
                                <div class="input-group" id="datetimepicker1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                        </div>
                                    <input name="data_adesao" type="text" class="form-control data datepicker" data-provide="datepicker" placeholder="00/00/0000" data-error="Este campo é necessário." required>
                                </div>
                                <div class="help-block with-errors"></div>
                          </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label class="form-label">CEP</label>
                            <input name="cep" type="text" class="form-control cep" placeholder="00000-000" data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-9">
                            <label class="form-label">ENDEREÇO</label>
                            <input name="endereco" type="text" class="form-control" data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="form-label">BAIRRO</label>
                            <input name="bairro" type="text" class="form-control" data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">CIDADE</label>
                            <input name="cidade" type="text" class="form-control" data-error="Este campo é necessário." required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label">ESTADO</label>
                            <select name="estado" class="form-control" required>
                                    <option disabled selected>Selecione</option>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                              </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">TELEFONE</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-fw fa-phone"></i></span>
                                </div>
                                <input name="telefone" type="text" class="form-control telefone" placeholder="(00) 00000-0000" data-error="Este campo é necessário." required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">E-MAIL</label>
                             <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-fw fa-envelope"></i></span>
                                </div>
                                <input name="email" type="email" class="form-control" placeholder="exemplo@email.com" data-error="Por favor, informe um E-MAIL válido.">
                                <div class="help-block with-errors"></div>
                             </div>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="form-label">DESCRIÇÃO</label>
                        <textarea name="descricao" type="text" class="form-control" placeholder="Mais informações..."></textarea>
                    </div>
                    <div class="form-group align-content-center">
                        <center>
                            <button class="btn btn-success col-md-3" name="option" value="insert" style="margin: 2px;"><i class="fa fa-plus"></i> CADASTRAR</button>
                            <a class="btn btn-primary col-md-3" href="cliente.jsp" name="cancelar" style="margin: 2px;">
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
    </div>
    <!--scripts da pagina-->
    <!-- Core plugin JavaScript-->
    <script src="../resources/js/validator.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin.min.js"></script>
    <script src="../resources/vendor/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../resources/vendor/jquery/jquery.mask.min.js"></script>
    <!--datepicker-->
    <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.pt-BR.min.js"></script>
    <script>
        jQuery(document).ready(function (){
            $(".cnpj").mask("00.000.000/0000-00");
            $(".telefone").mask("(00) 00000-0000");
            $(".data").mask("00/00/0000");
            $(".ie").mask("0000000000000");
            $(".cep").mask("00000-000");
        });
        $('.datepicker').datepicker({
            format: 'dd/mm/yyyy',
            language: "pt-BR"
        });
    </script>
</body>
</html>
