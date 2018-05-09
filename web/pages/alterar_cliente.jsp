<%-- 
    Document   : alterar_cliente
    Created on : 23/04/2018, 13:31:05
    Author     : Nando Luz
--%>

<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html;">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="Nando Luz" content="4I">
        <title>Alterar Cliente - Gente Telecom</title>
        <!-- Bootstrap core CSS-->
        <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../resources/css/sb-admin.min.css" rel="stylesheet">
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
          <a href="cliente.jsp">Cliente</a>
        </li>
        <li class="breadcrumb-item active">Alterar cliente</li>
      </ol>      
                <div class="card mb-3">
                    <div class="card-header bg-primary text-white form-inline">
                        <div class="form-inline my-2 my-lg-0 mr-lg-2">
                            <i class="fa fa-user" style="margin-right: 4px"></i>
                            <i class="fa fa-pencil" style="margin-right: 4px"></i>
                            ALTERAR CLIENTE
                            <div class="navbar-nav ml-auto" style="width: 40px; height: 40px;">                                
                            </div>
                        </div>
                    </div>
                <%
                    Cliente buscar = new Cliente();
                    Cliente cliente2 = buscar.findForID(Integer.parseInt(id));
                %>
                    <div class="card-body">
                           <div class="col-md-12">
                              <div>
                                  <hr>
                                  <center><h3 class="h5">ALTERE AS INFORMAÇÕES ABAIXO</h3></center>
                                  <hr>
                                  <br>
                              </div>
                              <form id="formCliente" data-toggle="validator" role="form" method="post" action="gerenciar_cliente.do">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">NOME FANTASIA</label>
                                            <input name="nome_fantasia"  type="text" class="form-control" value="<%= cliente2.getNomeFantasia() %>" placeholder="Nome fantasia da empresa..."  required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">CNPJ</label>
                                            <input name="cnpj" type="text" class="form-control cnpj" value="<%= cliente2.getCnpj()%>" placeholder="CNPJ da empresa..." data-error="Por favor, informe um CNPJ válido." data-minlength="18" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">SERVIÇO CONTRATADO</label>
                                            <select name="servico_contratado" class="form-control">
                                                <option <% if(cliente2.getServicoContratado().equals("VoIP")){ %> selected <% } %>> VoIP </option>
                                                <option <% if(cliente2.getServicoContratado().equals("Internet")){ %> selected <% } %>> Internet </option>
                                                <option <% if(cliente2.getServicoContratado().equals("VoIP e Internet")){ %> selected <% } %>> VoIP e Internet </option>
                                                <option <% if(cliente2.getServicoContratado().equals("Outro")){ %> selected <% } %>> Outro </option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label ">VALOR</label>
                                            <input name="valor" type="text" placeholder="0.00" class="form-control" value="<%= cliente2.getValor_servico() %>" data-error="Por favor, informe um VALOR válido." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">ENDEREÇO</label>
                                        <input name="endereco" type="text" class="form-control" value="<%= cliente2.getEndereco()%>" placeholder="Estado, cidade, rua..." data-error="Este campo é necessário." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">TELEFONE</label>
                                            <input name="telefone" type="text" class="form-control telefone" value="<%= cliente2.getTelefone() %>" placeholder="(00) 00000-0000" data-error="Este campo é necessário." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">E-MAIL</label>
                                            <input name="email" type="email" class="form-control" value="<%= cliente2.getEmail()%>" placeholder="exemplo@email.com" data-error="Por favor, informe um E-MAIL válido.">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label class="form-label">DESCRIÇÃO</label>
                                        <textarea name="descricao" type="text" class="form-control" placeholder="Mais informações..."><%= cliente2.getDescricao() %></textarea>
                                    </div>
                                    <div class="form-group align-content-center">
                                        <input type="hidden" name="id" value="<%= id %>">
                                        <center>
                                            <button class="btn btn-success col-md-3" name="option" value="update" style="margin: 2px;">
                                                <i class="fa fa-pencil"></i>
                                                ALTERAR
                                            </button>
                                            <a class="btn btn-primary col-md-3" href="cliente.jsp" name="cancelar" style="margin: 2px;">
                                                <i class="fa fa-reply"></i>
                                                CANCELAR</a>
                                        </center>
                                        
                                    </div>
                                </form>
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
            </div>
    <!--scripts da pagina-->
    <!-- Core plugin JavaScript-->
    <script src="../resources/js/validator.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin.min.js"></script>
    <script src="../resources/vendor/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../resources/vendor/jquery/jquery.mask.min.js"></script>
    <script>
        jQuery(document).ready(function (){
            $(".cnpj").mask("00.000.000/0000-00");
            $(".telefone").mask("(00) 00000-0000");
        });
    </script>
    </div>
</body>
</html>
