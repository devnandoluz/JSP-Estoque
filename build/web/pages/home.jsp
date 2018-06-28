<%-- 
    Document   : home
    Created on : 13/04/2018, 10:55:38
    Author     : Nando Luz
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Cliente"%>
<%@page import="java.text.DecimalFormat"%>
<% 
    HttpSession sess = request.getSession();
    long bv = ((System.currentTimeMillis() - sess.getCreationTime()));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="pa1">
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
        
        if(<%=bv%> >= 10000){
            $(window).on('load', function(){
                document.getElementById('loader').style.display = "none";
                document.getElementById("corpo").style.display = "block";
            });
        }else{
            var intervalo = setInterval(function (){
                clearInterval(intervalo);
                document.getElementById('loader').style.display = "none";
                document.getElementById("corpo").style.display = "block";
            }, 2000
            );
        }
    </script>
    <script type="text/javascript">
        
        function relogio(){
            var data = new Date();
//            var hora = data.getHours();
//            var minuto = data.getMinutes();
//            var segundo = data.getSeconds();

            var dia = data.getDate();
            var mes = data.getMonth() + 1;
            var ano = data.getFullYear();
            
            //formatação do relógio
//            if(hora < 10){
//                hora = "0"+hora;
//            }
//            if(minuto < 10){
//                minuto = "0"+minuto;
//            }
//            if(segundo < 10){
//                segundo = "0"+segundo;
//            }
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
//            document.getElementById("dataHome").innerHTML = "Dia " + dia + " de " + mes + " de " + ano;
//            document.getElementById("relogio").innerHTML = hora + ":" + minuto + ":" + segundo;
        }
        
    </script>
</head>

<body onload="relogio();" class="fixed-nav sticky-footer bg-dark" id="page-top body">
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
      
      <%        
            ArrayList<Menu> listacard = new ArrayList();
                try{
                    Menu buscarCard = new Menu();
                    listacard = buscarCard.findForUse(usuario.getPerfil().getId());
                }catch(Exception e){
                    out.print("Erro:"+e);
                }
            %>
      <!-- Icon Cards-->
      <div class="row">
        <%
            for(Menu menucard:listacard){
                if(menucard.getStatus() != 0){
                    if(menucard.getLink().equalsIgnoreCase("cliente.jsp")){
                        %>
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
                        <%
                    }else{
                        if(menucard.getLink().equalsIgnoreCase("funcionario.jsp")){
                            %>
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
                            <%
                        }else{
                            if(menucard.getLink().equalsIgnoreCase("estoque.jsp")){
                                %>
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
                                <%
                            }else{
                                if(menucard.getLink().equalsIgnoreCase("instalacao.jsp")){
                                    %>
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
                                    <%
                                }
                            }
                        }
                    }
                }                
            }
        %>
        
        
      </div>
      <hr>
           <%
            //formata a hora de atualização
            SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm:ss");
            Date hora = new Date(System.currentTimeMillis());
            String dataFormatada = sdfHora.format(hora);
           %>
            <!-- Gráfico de area Card-->
          <div class="card mb-3">
              <div class="card-header">
                <i class="fa fa-area-chart"></i> Adesão de Cliente </div>
              <div class="card-body">
                <canvas id="adesaoDeCliente" width="100%" height="30"></canvas>
              </div>
              <div class="card-footer small text-muted">Atualizado: <%=dataFormatada%></div>
          </div>
            <%
                ArrayList<Cliente> lista = new ArrayList();
                Cliente buscar = new Cliente();
                lista = buscar.findAll();
                //Formatação para o gráfico de barras
                SimpleDateFormat sdf = new SimpleDateFormat("MM");
                int mesAd;
                double[] mes = new double[12];
                int[] tCliente = new int[12];
                //inicializa o vetor
                for(int i = 0; i == 11; i++){
                    mes[i] = 0;
                }
                for(Cliente cliente:lista){
                    mesAd = Integer.parseInt(sdf.format(cliente.getData_adesao().getTime()));
                    mes[(mesAd - 1)] = mes[(mesAd - 1)] + cliente.getValor_servico();
                    tCliente[(mesAd - 1)] = tCliente[(mesAd - 1)] + 1;
                }
          %>              
      </div>
    </div>
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="../resources/vendor/chart.js/Chart.min.js"></script>
            <script src="../resources/js/sb-admin.min.js"></script>   
  <script>
      Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#292b2c';
      // -- Area Chart Example
      var ctx = document.getElementById("adesaoDeCliente");
      
      //total cliente + mês
      var tcjaneiro = <%=tCliente[0]%>,
          tcfevereiro = <%=tCliente[1]%>,
          tcmarco = <%=tCliente[2]%>,
          tcabril = <%=tCliente[3]%>,
          tcmaio = <%=tCliente[4]%>,
          tcjunho = <%=tCliente[5]%>,
          tcjulho = <%=tCliente[6]%>,
          tcagosto = <%=tCliente[7]%>,
          tcsetembro = <%=tCliente[8]%>,
          tcoutubro = <%=tCliente[9]%>,
          tcnovembro = <%=tCliente[10]%>,
          tcdezembro = <%=tCliente[11]%>;
  
      var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
          datasets: [{
            label: "Adesões",
            lineTension: 0.3,
            backgroundColor: "rgba(2,117,216,0.2)",
            borderColor: "rgba(2,117,216,1)",
            pointRadius: 5,
            pointBackgroundColor: "rgba(2,117,216,1)",
            pointBorderColor: "rgba(255,255,255,0.8)",
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(2,117,216,1)",
            pointHitRadius: 20,
            pointBorderWidth: 2,
            data: [tcjaneiro, tcfevereiro, tcmarco, tcabril, tcmaio, tcjunho, tcjulho, tcagosto, tcsetembro, tcoutubro, tcnovembro, tcdezembro],
          }],
        },
        options: {
          scales: {
            xAxes: [{
              time: {
                unit: 'date'
              },
              gridLines: {
                display: false
              },
              ticks: {
                maxTicksLimit: 7
              }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: 10,
                maxTicksLimit: 5
              },
              gridLines: {
                color: "rgba(0, 0, 0, .125)",
              }
            }],
          },
          legend: {
            display: false
          }
        }
      });
    </script>            
    </div>
    <%@include file="rodape.jsp"%>
    <!-- Top -->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a> 
</body>
</html>
