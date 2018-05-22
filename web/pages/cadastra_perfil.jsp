<%-- 
    Document   : cadastra_cliente
    Created on : 23/04/2018, 13:29:42
    Author     : Nando Luz
--%>
<%@page import="java.util.AbstractList"%>
<%@page import="java.util.List"%>
<%@page import="model.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html;">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Novo Perfil - Gente Telecom</title>
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
    
    <script>
        var cont = 0;
        function moverItemSelecionado(objnome, de, para, acao) {
	para = jQuery('#' + para);
        
	jQuery('#' + de).find('option:selected').each(function(i, fromel) {
		var notApp = true;
		para.find('option').each(function(j, toel) {
			if (toel.innerHTML.toLowerCase() > fromel.innerHTML.toLowerCase()) {
				jQuery(toel).before(fromel);
				notApp = false;
				return false;
			}
		});
		if (notApp) {
			para.append(fromel);
		}
		fromel = jQuery(fromel);
		if (acao.toLowerCase() === 'add') {
                        if(cont < fromel.val()){
                            cont = fromel.val();
                        }
			jQuery(this)
				.closest('form')
				.append("<input name='" + objnome + fromel.val() + "' id='" + objnome + '_' + fromel.val()
					+ "' value='" + fromel.val() + "' type='hidden'>"
				);
                                document.getElementById('cont').value = cont;
		}
		else if (acao.toLowerCase() === 'rmv') {
			jQuery('#' + objnome + '_' + fromel.val()).remove();
		}
	});

	return true;
}
   
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
          <a href="perfil.jsp">Perfil</a>
        </li>
        <li class="breadcrumb-item active">Novo perfil</li>
      </ol>
      <div class="card mb-3">
            <div class="card-header bg-dark text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-vcard" style="margin-right: 4px"></i>
                    <i class="fa fa-plus" style="margin-right: 4px"></i>
                    NOVO PERFIL  
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
              <form id="formCliente" data-toggle="validator" role="form" method="get" action="gerenciar_perfil.do">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label">NOME</label>
                            <input name="perfil"  type="text" class="form-control" placeholder="Nome do PERFIL..." autofocus required>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">STATUS</label>
                            <input name="status" type="text" class="form-control" placeholder="0 ou 1..." data-error="Este campo é necessário." required>
                        </div>
                        <!-------------------------------- MENU ------------------------------------>
                        <div class="col-md-12"><strong><i class="fa fa-link" style="margin-left: 14px"></i> MENU</strong></div>
                            <div class="form-inline form-group col-md-12 text-center">
                                <div class="form-group col-md-5">
                                    <label class="form-label small">DISPONÍVEL</label>
                                    <select class="form-control col-md-12" name="menudireita" id="menudireita" size="6" autocomplete="off" multiple="multiple">
                                        <%
                                            ArrayList<Menu> lista = new ArrayList();

                                            Menu buscar = new Menu();
                                            lista = buscar.findAll();

                                            for(Menu menu:lista){
                                        %>
                                        <option value="<%= menu.getId() %>"><%= menu.getMenu() %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                    
                                    
                                    
                                <div class="col-md-2" style="color: white;">
                                    <a class="btn btn-primary" onclick="moverItemSelecionado('menu', 'menudireita', 'menuesquerda', 'add' )" style="width: 90px; margin-top: 12%;">adicionar</a>
                                    <a class="btn btn-primary" onclick="moverItemSelecionado('menu', 'menuesquerda', 'menudireita', 'rmv' )" style="width: 90px; margin-top: 8px;">remover</a>
                                </div>
                                    
                                    
                                <div class="form-group col-md-5">
                                    <label class="form-label small">ADICIONADO</label>
                                    <select class="form-control  col-md-12" id="menuesquerda" size="6" autocomplete="off" multiple="multiple">
                                    </select>
                                </div>
                                    
                                    
                                    
                            </div>
                    </div>
                    <input type="hidden" name="cont" id="cont" value="0">
                    <div class="form-group align-content-center">
                        <center>
                            <button class="btn btn-success col-md-3" name="option" value="insert" style="margin: 2px;">
                                <i class="fa fa-plus"></i> 
                                CADASTRAR
                            </button>
                            <a class="btn btn-primary col-md-3" href="perfil.jsp" style="margin: 2px;">
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
    </div>
</body>
</html>
