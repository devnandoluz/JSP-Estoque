<%-- 
    Document   : home
    Created on : 13/04/2018, 10:55:38
    Author     : Nando Luz
--%>
<%
    String bv = request.getParameter("bemVindo");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="4I">
    <title>Home - Gente Telecom</title>
    <!-- Bootstrap CSS-->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../resources/css/sb-admin.css" rel="stylesheet">
    <script src="../resources/vendor/jquery/jquery.min.js" type="text/javascript"></script>
    <!--icon-->
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon" />
    <script type="text/javascript">
        $(window).on('load', function(){
            document.getElementById('loader').style.display = "none";
            document.getElementById("corpo").style.display = "block";
        });
    </script>
    <script type="text/javascript">
        
        function relogio(){
            var data = new Date();
            var hora = data.getHours();
            var minuto = data.getMinutes();
            var segundo = data.getSeconds();

            var dia = data.getDate();
            var mes = data.getMonth() + 1;
            var ano = data.getFullYear();
            
            //formatação do relógio
            if(hora < 10){
                hora = "0"+hora;
            }
            if(minuto < 10){
                minuto = "0"+minuto;
            }
            if(segundo < 10){
                segundo = "0"+segundo;
            }
            //formatação do data
            if(dia < 10){
                dia = "0"+dia;
            }
            switch(mes){
                case 1: mes = "Janeiro";
                break;
                case 2: mes = "Fevereiro";
                break;
                case 3: mes = "Março";
                break;
                case 4: mes = "Abril";
                break;
                case 5: mes = "Maio";
                break;
                case 6: mes = "Junho";
                break;
                case 7: mes = "Julho";
                break;
                case 8: mes = "Agosto";
                break;
                case 9: mes = "Setembro";
                break;
                case 10: mes = "Outubro";
                break;
                case 11: mes = "Novembro";
                break;
                case 12: mes = "Dezembro";
                break;
            }
            document.getElementById("dataHome").innerHTML = "Dia " + dia + " de " + mes + " de " + ano;
            document.getElementById("relogio").innerHTML = hora + ":" + minuto + ":" + segundo;
        }
        window.setInterval("relogio();",1000);
        
    </script>
</head>

<body onload="relogio();" class="fixed-nav sticky-footer bg-dark" id="page-top">
  <div id="loader"></div>
  <div id="corpo">
  <!-- Navigation 37.1vw-->
  <%@include file="menu/navigation.jsp" %>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item active">Home</li>
      </ol>
      <!-- Icon Cards-->
      <div class="row">
        <!--          1-->
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-users"></i>
              </div>
                <div class="mr-5"> <strong>CLIENTE</strong> </div>
            </div>
              <a class="card-footer text-white clearfix small z-1" href="cliente.jsp">
              <span class="float-left">Ver Detalhes</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <!--          2-->
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-id-badge"></i>
              </div>
                <div class="mr-5"> <strong>FUNCIONÁRIO</strong> </div>
            </div>
              <a class="card-footer text-white clearfix small z-1" href="funcionario.jsp">
              <span class="float-left">Ver Detalhes</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <!--          3-->
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-shopping-cart"></i>
              </div>
              <div class="mr-5"> <strong>ESTOQUE</strong> </div>
            </div>
              <a class="card-footer text-white clearfix small z-1" href="estoque.jsp">
              <span class="float-left">Ver Detalhes</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <!--          4-->
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-wrench"></i>
              </div>
              <div class="mr-5"> <strong>INSTALAÇÃO</strong> </div>
            </div>
              <a class="card-footer text-white clearfix small z-1" href="instalacao.jsp">
              <span class="float-left">Ver Detalhes</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
      </div>
      <div class="row">
            <!-- Carousel -->
            <div class="col-sm-6" id="carousel">
                  <div class="card mb-3">
                      <div class="card-header bg-dark" style="color: white;">
                          <i class="fa fa-image"></i>
                          <strong>Galeria</strong>
                      </div>
                      <div class="card-body">
                          <div id="carouselSlide" class="carousel slide" data-ride="carousel">
                              <ol class="carousel-indicators">
                                  <li data-target="carouselSlide" data-slide="0" class="active"></li>
                                  <li data-target="carouselSlide" data-slide="1"></li>
                                  <li data-target="carouselSlide" data-slide="2"></li>
                              </ol>                            
                              <div class="carousel-inner">
                                  <div class="carousel-item active">
                                      <img src="../img/carousel/parede.png" class="img-fluid d-block">
                                  </div>
                                  <div class="carousel-item">
                                      <img src="../img/carousel/couro.png" class="img-fluid d-block">
                                  </div>
                                  <div class="carousel-item">
                                      <img src="../img/carousel/satelite_antena.png" class="img-fluid d-block">
                                  </div>
                              </div>                            
                              <a class="carousel-control-prev" href="#carouselSlide" role="bottom" data-slide="prev">
                                  <span class="fa fa-chevron-left"></span>
                              </a>
                              <a class="carousel-control-next" href="#carouselSlide" role="bottom" data-slide="next">
                                  <span class="fa fa-chevron-right"></span>
                              </a>                            
                          </div>
                      </div>
                  </div>
            </div>
            <div class="col-sm-6" id="rel">
                  <div class="card mb-3">
                      <div class="card-header bg-dark" style="color: white;">
                            <i class="fa fa-clock-o"></i>
                            <strong>Relógio</strong>
                      </div>
                      <div class="card-body">
                          <div id="carouselSlide" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                  <div class="carousel-item active">
                                        <img src="../img/background/b_relogio.gif" class="img-fluid d-block b-rel">
                                        <div class="carousel-caption">
                                            <div id="dataHome"></div>
                                            <hr>
                                            <div class="navbar-nav container" id="relogio"></div>
                                        </div>
                                  </div>
                              </div>                     
                          </div>
                      </div>
                  </div>
            </div>
      </div>        
    </div>
      
        <%@include file="rodape.jsp"%>
        <!-- Top -->
        <a class="scroll-to-top rounded" href="#page-top">
          <i class="fa fa-angle-up"></i>
        </a> 
    </div>
        
    </div> <!-- fim do corpo -->
        <!--JavaScript-->
        <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="../resources/js/sb-admin.min.js"></script>
    </div>
</body>
</html>
