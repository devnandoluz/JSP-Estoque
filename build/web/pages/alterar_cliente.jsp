<%-- 
    Document   : alterar_cliente
    Created on : 23/04/2018, 13:31:05
    Author     : Nando Luz
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;">
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html;">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="Nando Luz" content="4I">
        <title>Alterar Cliente - Gente Telecom</title>
        <!-- CSS-->
        <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="../resources/css/sb-admin.min.css" rel="stylesheet">
        <link href="../resources/vendor/bootstrap/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css">
        <!--icon-->
        <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon" />
        
        
        <!-- Adicionando Javascript -->
        <script type="text/javascript" >

        function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value=("");
                document.getElementById('bairro').value=("");
                document.getElementById('cidade').value=("");
                document.getElementById('uf').value=("");
        }

        function meu_callback(conteudo) {
            if (!("erro" in conteudo)) {
                //Atualiza os campos com os valores.
                document.getElementById('rua').value=(conteudo.logradouro);
                document.getElementById('bairro').value=(conteudo.bairro);
                document.getElementById('cidade').value=(conteudo.localidade);
                document.getElementById('uf').value=(conteudo.uf);
            } //end if.
            else {
                //CEP não Encontrado.
                limpa_formulário_cep();
                alert("CEP não encontrado.");
            }
        }

        function pesquisacep(valor) {

            //Nova variável "cep" somente com dígitos.
            var cep = valor.replace(/\D/g, '');

            //Verifica se campo cep possui valor informado.
            if (cep !== "") {

                //Expressão regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;

                //Valida o formato do CEP.
                if(validacep.test(cep)) {
                    //Cria um elemento javascript.
                    var script = document.createElement('script');

                    //Sincroniza com o callback.
                    script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                    //Insere script no documento e carrega o conteúdo.
                    document.body.appendChild(script);

                } //end if.
                else {
                    //cep é inválido.
                    limpa_formulário_cep();
                    alert("Formato de CEP inválido.");
                }
            } //end if.
            else {
                //cep sem valor, limpa formulário.
                limpa_formulário_cep();
            }
        };

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
                                            <input name="nome_fantasia"  value="<%= cliente2.getNomeFantasia() %>" type="text" class="form-control" placeholder="Nome fantasia da empresa." data-error="Este campo é necessário." autofocus required>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="form-label">CNPJ</label>
                                            <input name="cnpj" value="<%= cliente2.getCnpj()%>" type="text" placeholder="00.000.000/0000-00" class="form-control cnpj" data-error="Por favor, informe um CNPJ válido." data-minlength="18" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="form-label">INSCRIÇÃO ESTADUAL</label>
                                            <input name="ie" value="<%= cliente2.getInscricaoEstadual()%>" type="text" placeholder="0000000000000" class="form-control ie" data-error="Por favor, informe um I.E. válido." data-minlength="13" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                          <!--select-->
                                            <div class="form-group col-md-3">
                                                <label class="form-label">SERVIÇO CONTRATADO</label>
                                                <select name="servico_contratado" class="form-control">
                                                    <option <% if(cliente2.getServicoContratado().equals("VoIP")){ %> selected <% } %> value="VoIP"> VoIP </option>
                                                    <option <% if(cliente2.getServicoContratado().equals("Internet")){ %> selected <% } %> value="Internet"> Internet </option>
                                                    <option <% if(cliente2.getServicoContratado().equals("VoIP e Internet")){ %> selected <% } %> value="VoIP e Internet"> VoIP e Internet </option>
                                                    <option <% if(cliente2.getServicoContratado().equals("Outros")){ %> selected <% } %> value="Outro"> Outro </option>
                                                </select>
                                            </div>
                                          <div class="form-group col-md-3">
                                            <label class="form-label">QUANTIDADE</label>
                                            <input name="quantidade" value="<%= cliente2.getQuantidade()%>" type="text" class="form-control" placeholder="Ramal ou Mega" data-error="Este campo é necessário." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                         <div class="form-group col-md-3">
                                            <label class="form-label ">VALOR</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">R$</span>
                                                </div>
                                                <input name="valor" value="<%= cliente2.getValor_servico()%>" type="text" placeholder="0.00" class="form-control" data-error="Por favor, informe um VALOR válido." required>
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                          <div class="form-group col-md-3">
                                                <label class="form-label">DATA DE ADESÃO</label>
                                                <div class="input-group" id="datetimepicker1">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                                        </div>
                                                    <%
                                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                    %>
                                                    <input name="data_adesao"  value="<%= sdf.format(cliente2.getData_adesao())%>" type="text" autocomplete="off" class="form-control data datepicker" data-provide="datepicker" placeholder="00/00/0000" data-error="Este campo é necessário." required>
                                                </div>
                                                <div class="help-block with-errors"></div>
                                          </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label class="form-label">CEP</label>
                                            <input name="cep" id="cep"  value="<%= cliente2.getCep()%>" type="text" class="form-control cep" value="" maxlength="9" onblur="pesquisacep(this.value);" placeholder="00000-000" data-error="Este campo é necessário." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-9">
                                            <label class="form-label">ENDEREÇO</label>
                                            <input name="endereco"  value="<%= cliente2.getEndereco()%>" type="text" id="rua" class="form-control" data-error="Este campo é necessário." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label class="form-label">BAIRRO</label>
                                            <input name="bairro" id="bairro"  value="<%= cliente2.getBairro()%>" type="text" value="" class="form-control" data-error="Este campo é necessário." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="form-label">CIDADE</label>
                                            <input name="cidade" id="cidade"  value="<%= cliente2.getCidade()%>"  type="text" value="" class="form-control" data-error="Este campo é necessário." required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="form-label">ESTADO</label>
                                            <select name="estado" id="uf" class="form-control"  required>
                                                    <option disabled selected>Selecione</option>
                                                    <option value="AC" <% if(cliente2.getEstado().equals("AC")){ %> selected <% } %>>Acre</option>
                                                    <option value="AL" <% if(cliente2.getEstado().equals("AL")){ %> selected <% } %>>Alagoas</option>
                                                    <option value="AP" <% if(cliente2.getEstado().equals("AP")){ %> selected <% } %>>Amapá</option>
                                                    <option value="AM" <% if(cliente2.getEstado().equals("AM")){ %> selected <% } %>>Amazonas</option>
                                                    <option value="BA" <% if(cliente2.getEstado().equals("BA")){ %> selected <% } %>>Bahia</option>
                                                    <option value="CE" <% if(cliente2.getEstado().equals("CE")){ %> selected <% } %>>Ceará</option>
                                                    <option value="DF" <% if(cliente2.getEstado().equals("DF")){ %> selected <% } %>>Distrito Federal</option>
                                                    <option value="ES" <% if(cliente2.getEstado().equals("ES")){ %> selected <% } %>>Espírito Santo</option>
                                                    <option value="GO" <% if(cliente2.getEstado().equals("GO")){ %> selected <% } %>>Goiás</option>
                                                    <option value="MA" <% if(cliente2.getEstado().equals("MA")){ %> selected <% } %>>Maranhão</option>
                                                    <option value="MT" <% if(cliente2.getEstado().equals("MT")){ %> selected <% } %>>Mato Grosso</option>
                                                    <option value="MS" <% if(cliente2.getEstado().equals("MS")){ %> selected <% } %>>Mato Grosso do Sul</option>
                                                    <option value="MG" <% if(cliente2.getEstado().equals("MG")){ %> selected <% } %>>Minas Gerais</option>
                                                    <option value="PA" <% if(cliente2.getEstado().equals("PA")){ %> selected <% } %>>Pará</option>
                                                    <option value="PB" <% if(cliente2.getEstado().equals("PB")){ %> selected <% } %>>Paraíba</option>
                                                    <option value="PR" <% if(cliente2.getEstado().equals("PR")){ %> selected <% } %>>Paraná</option>
                                                    <option value="PE" <% if(cliente2.getEstado().equals("PE")){ %> selected <% } %>>Pernambuco</option>
                                                    <option value="PI" <% if(cliente2.getEstado().equals("PI")){ %> selected <% } %>>Piauí</option>
                                                    <option value="RJ" <% if(cliente2.getEstado().equals("RJ")){ %> selected <% } %>>Rio de Janeiro</option>
                                                    <option value="RN" <% if(cliente2.getEstado().equals("RN")){ %> selected <% } %>>Rio Grande do Norte</option>
                                                    <option value="RS" <% if(cliente2.getEstado().equals("RS")){ %> selected <% } %>>Rio Grande do Sul</option>
                                                    <option value="RO" <% if(cliente2.getEstado().equals("RO")){ %> selected <% } %>>Rondônia</option>
                                                    <option value="RR" <% if(cliente2.getEstado().equals("RR")){ %> selected <% } %>>Roraima</option>
                                                    <option value="SC" <% if(cliente2.getEstado().equals("SC")){ %> selected <% } %>>Santa Catarina</option>
                                                    <option value="SP" <% if(cliente2.getEstado().equals("SP")){ %> selected <% } %>>São Paulo</option>
                                                    <option value="SE" <% if(cliente2.getEstado().equals("SE")){ %> selected <% } %>>Sergipe</option>
                                                    <option value="TO" <% if(cliente2.getEstado().equals("TO")){ %> selected <% } %>>Tocantins</option>
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
                                                <input name="telefone"  value="<%= cliente2.getTelefone()%>" type="text" class="form-control telefone" placeholder="(00) 00000-0000" data-error="Este campo é necessário." required>
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">E-MAIL</label>
                                             <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-fw fa-envelope"></i></span>
                                                </div>
                                                <input name="email"  value="<%= cliente2.getEmail()%>"  type="email" class="form-control" placeholder="exemplo@email.com" data-error="Por favor, informe um E-MAIL válido.">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label class="form-label">DESCRIÇÃO</label>
                                        <textarea name="descricao"  value="<%= cliente2.getDescricao()%>" type="text" class="form-control" placeholder="Mais informações..."></textarea>
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
    <%@include file="rodape.jsp"%>
    <!-- Top -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!--scripts da pagina-->
    <script src="../resources/js/validator.min.js"></script>
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
    </div>
</body>
</html>
