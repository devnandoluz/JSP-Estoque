<%-- 
    Document   : gerar_contrato_internet
    Created on : 20/05/2018, 11:02:12
    Author     : Nando Luz
--%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>


    
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
        <title>Gerar Contrato - Gente Telecom</title>
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
          <li class="breadcrumb-item active">Gerar Contrato VoIP</li>
        </ol>

            <div class="card mb-3 text-center">
                <div class="card-header form-inline text-center bg-dark text-white">
                    <i class="fa fa-file-text" style="margin-right: 4px"></i>
                    &nbsp;&nbsp; GERAR NOVO CONTRATO
                </div>
                <form class="form" method="get" action="contrato_voip.jsp">
                    <div class="card-body col-md-6 container-fluid" style="margin-top: 15%;">
                            <% 
                                ArrayList<Cliente> lista = new ArrayList();
                                    try{
                                        Cliente buscar = new Cliente();   

                                        lista = buscar.findAll();
                                    }catch(Exception e){
                                        out.print("Erro:"+e);
                                    }                      
                                    %>
                            <select name="cliente" class="form-control form-control-lg">
                            <%
                                for(Cliente cliente:lista){
                                    if(cliente.getServicoContratado().equalsIgnoreCase("VoIP") || cliente.getServicoContratado().equalsIgnoreCase("VoIP e Internet")){
                            %>
                                        <option value="<%=cliente.getId() %>"><%= cliente.getNomeFantasia()%></option>
                            <%
                                    }
                                }
                            %>
                            </select>
                            <button class="btn btn-primary col-md-3" href="perfil.jsp" style=" margin: 10%; margin-bottom: 28%; padding: 15px; font-size: 14pt;">
                                <i class="fa fa-gear"></i>
                                <strong>GERAR</strong>
                            </button>
                    </div>
                    
                </form>
            </div>
      </div>
            
            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="../resources/vendor/datatables/jquery.dataTables.js"></script>
            <script src="../resources/vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="../resources/js/sb-admin-datatables.min.js"></script>
      </div>
  </body>
</html>
