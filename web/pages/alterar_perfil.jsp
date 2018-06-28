<%-- 
    Document   : alterar_cliente
    Created on : 03/05/2018, 03:29:42
    Author     : Nando Luz
--%>

<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("id");
%>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html;">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Altera Perfil - Gente Telecom</title>
    <!-- Bootstrap core CSS-->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    
    <link href="../resources/css/sb-admin.css" rel="stylesheet">
    <!--icon-->
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon" />
    <script>
        var cont = 0;
        function moverItemSelecionado(de, para, acao) {
	para = jQuery('#' + para);        
	jQuery('#' + de).find('option:selected').each(function(s, fromel) {
		var notApp = true;
		para.find('option').each(function(j, toel) {
			if (toel.innerHTML.toLowerCase() <= fromel.innerHTML.toLowerCase()) {
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
                        cont = cont + 1;
			jQuery(this)
				.closest('form')
				.append("<input name='menu" + cont + "' id='menu_" + cont
					+ "' value='" + fromel.val() + "' type='hidden' class='menu_" + fromel.val() + "'>"
				);
                                document.getElementById('cont').value = cont;                                
		}
		else if (acao.toLowerCase() === 'rmv') {
                        
                    jQuery('.menu_' + fromel.val()).remove();
                    
                    u = 1;
                    for(i = 1; i <= cont; i++){
                        name = "'menu"+(i)+"'";
                        id = "'menu_"+(i)+"'";
                        
                        if($("#menu_" + u).val() !== null){
                            jQuery("#menu_" + u).attr("name", name);
                            jQuery("#menu_" + u).attr("id", id);
                            u++;
                        }else{
                            i = i - 1;
                        }
                    };
                    cont = cont - 1;  
                    document.getElementById('cont').value = cont;
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
        <li class="breadcrumb-item active">Altera perfil</li>
      </ol>
      <div class="card mb-3">
            <div class="card-header bg-dark text-white form-inline">
                <div class="form-inline my-2 my-lg-0 mr-lg-2">
                    <i class="fa fa-vcard" style="margin-right: 4px"></i>
                    <i class="fa fa-pencil" style="margin-right: 4px"></i>
                    ALTERAR PERFIL
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
              <form id="formCliente" data-toggle="validator" role="form" method="post" action="gerenciar_perfil.do">
                    <%
                        Perfil buscar = new Perfil();                        
                        Perfil perfil = buscar.findForID(Integer.parseInt(id));
                    %>
                    <div class="row">
                        
                        
                        <div class="form-group col-md-6">
                            <label class="form-label">NOME</label>
                            <input name="perfil" value="<%= perfil.getPerfil() %>" type="text" class="form-control" placeholder="Nome do PERFIL" autofocus required>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">STATUS</label>
                            <input name="status" value="<%= perfil.getStatus() %>" type="text" class="form-control" placeholder="0 ou 1..." data-error="Este campo é necessário." required>
                        </div>
                        <!-------------------------------- MENU ------------------------------------>
                        <div class="col-md-12"><strong><i class="fa fa-link" style="margin-left: 14px"></i> MENU</strong></div>
                            <div class="form-inline form-group col-md-12 text-center">
                                <div class="form-group col-md-5">
                                    <label class="form-label small">DISPONÍVEL</label>
                                    <select class="form-control col-md-12" name="menudireita" id="menudireita" size="6" autocomplete="off" multiple="multiple">
                                        <%
                                            ArrayList<Menu> lista = new ArrayList();
                                            Menu buscarm = new Menu();
                                            lista = buscarm.findAll();                             
                                            for(Menu menulista1:lista){
                                                
                                                if(perfil.getMenu().size() != 0){
                                                    int i = 0;
                                                    int ex = 0;
                                                    
                                                    while(i < perfil.getMenu().size()){
                                                        if(perfil.getMenu().get(i).getMenu().equalsIgnoreCase(menulista1.getMenu())){
                                                            ex++;
                                                        }
                                                        i++;
                                                    }
                                                    if(ex != 0){
                                                        //nada a fazer!
                                                    }else{
                                                        %>
                                                        <option value="<%= menulista1.getId() %>"><%= menulista1.getMenu() %></option>
                                                        <%
                                                    }
                                                    
                                                }else{
                                                    %>
                                                    <option value="<%= menulista1.getId() %>"><%= menulista1.getMenu() %></option>
                                                    <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                    
                                    
                                    
                                <div class="col-md-2" style="color: white;">
                                    <a class="btn btn-primary" onclick="moverItemSelecionado('menudireita', 'menuesquerda', 'add' )" style="width: 90px; margin-top: 12%;">adicionar</a>
                                    <a class="btn btn-primary" onclick="moverItemSelecionado('menuesquerda', 'menudireita', 'rmv' )" style="width: 90px; margin-top: 12%;">remover</a>
                                </div>
                                    
                                    
                                <div class="form-group col-md-5">
                                    <label class="form-label small">ADICIONADO</label>
                                    <select class="form-control  col-md-12" id="menuesquerda" size="6" autocomplete="off" multiple="multiple">
                                        <%
                                        for(Menu menu:perfil.getMenu()){
                                            %>
                                            <option value="<%=menu.getId() %>"><%= menu.getMenu() %></option>
                                            <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                        
                    </div>
                    
                    <div class="form-group align-content-center">
                        <center>
                            
                            <input type="hidden" name="cont" id="cont" value="0">
                            <input name="id" type="hidden" value="<%=id%>">
                            <button class="btn btn-success col-md-3" name="option" value="update" style="margin: 2px;">
                                <i class="fa fa-pencil"></i> 
                                ALTERAR
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
