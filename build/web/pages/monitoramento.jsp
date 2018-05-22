<%-- 
    Document   : monitoramento
    Created on : 14/04/2018, 15:55:38
    Author     : Nando Luz
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
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
    <title>Monitoramento - Gente Telecom</title>
    <!-- Bootstrap core CSS-->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
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
          <li class="breadcrumb-item active">Monitoramento</li>
        </ol>
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
                //variaveis para serviços
                int internet = 0, voip = 0, voip_internet = 0, cancelamento = 0;
                int num_cliente = 0;

                ArrayList<Cliente> lista = new ArrayList();

                Cliente buscar = new Cliente();

                lista = buscar.findAll();

                  for(Cliente cliente:lista){
                      num_cliente = num_cliente + 1;
                      if(cliente.getServicoContratado().equalsIgnoreCase("Internet")){
                        internet = internet + 1;
                      }else{
                          if(cliente.getServicoContratado().equalsIgnoreCase("VoIP")){
                              voip = voip + 1;
                          }else{
                              if(cliente.getServicoContratado().equalsIgnoreCase("VoIP e Internet")){
                                  voip_internet = voip_internet + 1;
                              }else{
                                  if(cliente.getServicoContratado().equalsIgnoreCase("Cancelamento")){
                                      cancelamento = cancelamento + 1;
                                  }
                              }
                          }
                      }
                  }
            %>
                    

            <br>
            
            <br>
          <%
              
              //variaveis para valores
              double total_lucro = 0;
              double menor_lucro = 0;
              double maior_lucro = 0;
              double media_lucro = 0;
              //variavel para contar o numero de cliente.
              int totalCliente = 0;
              //Formatação para o gráfico de barras
              
              Date date = new Date(System.currentTimeMillis());
              SimpleDateFormat sdf = new SimpleDateFormat("MM");
              int mesAtual = Integer.parseInt(sdf.format(date));
              int mesAd;
              double[] mes = new double[12];
              int[] tCliente = new int[12];
              //inicializa o vetor
              for(int i = 0; i == 11; i++){
                  mes[i] = 0;
              }
              
              int input = 0;
              
              for(Cliente cliente:lista){
                  totalCliente++;
                  mesAd = Integer.parseInt(sdf.format(cliente.getData_adesao().getTime()));
                  
                  mes[(mesAd - 1)] = mes[(mesAd - 1)] + cliente.getValor_servico();
                  tCliente[(mesAd - 1)] = tCliente[(mesAd - 1)] + 1;
                  
                  total_lucro = total_lucro + mes[(mesAd - 1)];
                  
                  if(mes[(mesAd - 1)] < menor_lucro || input == 0){
                        menor_lucro = mes[(mesAd - 1)];
                        input++;
                  }
                  if(mes[(mesAd - 1)] > maior_lucro){
                        maior_lucro = mes[(mesAd - 1)];
                  }
              }
              media_lucro = (total_lucro / totalCliente);
              DecimalFormat df = new DecimalFormat("0.00");
              String dfmedia = df.format(media_lucro);
          %>

          <div class="row">
              <!-- Gráfico de barra Card-->
              <div class="col-lg-8">
                  <div class="card mb-3">
                      <div class="card-header">
                          <i class="fa fa-bar-chart"></i> <i class="fa fa-dollar"></i> Lucro mensal </div>
                      <div class="card-body">
                        <div class="row">
                          <div class="col-sm-8 my-auto">
                            <canvas id="valorLucro" width="100%" height="50"></canvas>
                          </div>

                          <div class="col-sm-4 text-center my-auto">
                              <div class="card">
                                    <br>
                                    <div class="h4 mb-0 text-primary">R$ <%=dfmedia%></div>
                                    <div class="small text-muted">Média de lucro</div>
                                    <br>
                              </div>
                                <br>
                              
                              <div class="h4 mb-0 text-success">R$ <%=maior_lucro%></div>
                              <div class="small text-muted">Maior lucro</div>
                              <hr>
                              <div class="h4 mb-0 text-danger">R$ <%=menor_lucro%></div>
                              <div class="small text-muted">Menor lucro</div>
                          </div>
                        </div>
                      </div>
                      <div class="card-footer small text-muted">Atualizado: <%=dataFormatada%></div>
                  </div>
              </div>


              <!--  Gráfico de pizza Card-->
              <div class="col-lg-4">
                  <div class="card mb-3">
                    <div class="card-header">
                      <i class="fa fa-pie-chart"></i> Serviços Contratados </div>
                    <div class="card-body">
                      <canvas id="ServicoContratado" width="100%" height="100"></canvas>
                    </div>
                    <div class="card-footer small text-muted">Atualizado: <%=dataFormatada%></div>
                  </div>
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
            <!-- Page level plugin JavaScript-->
            <script src="../resources/vendor/chart.js/Chart.min.js"></script>
            <!-- Custom scripts for all pages-->
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
      
      
      
      
      
      
      // -- Bar Chart Example
      var ctx = document.getElementById("valorLucro");
      
      //valor + mês
      var vjaneiro = <%=mes[0]%>,
          vfevereiro = <%=mes[1]%>,
          vmarco = <%=mes[2]%>,
          vabril = <%=mes[3]%>,
          vmaio = <%=mes[4]%>,
          vjunho = <%=mes[5]%>,
          vjulho = <%=mes[6]%>,
          vagosto = <%=mes[7]%>,
          vsetembro = <%=mes[8]%>,
          voutubro = <%=mes[9]%>,
          vnovembro = <%=mes[10]%>,
          vdezembro = <%=mes[11]%>;
  
      var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
          datasets: [{
            label: "Lucro de",
            backgroundColor: "rgba(2,117,216,1)",
            borderColor: "rgba(2,117,216,1)",
            data: [vjaneiro, vfevereiro, vmarco, vabril, vmaio, vjunho, vjulho, vagosto, vsetembro, voutubro, vnovembro, vdezembro],
          }],
        },
        options: {
          scales: {
            xAxes: [{
              time: {
                unit: 'month'
              },
              gridLines: {
                display: false
              },
              ticks: {
                maxTicksLimit: 12
              }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: <%= maior_lucro %>+200,
                maxTicksLimit: 20
                
              },
              gridLines: {
                display: true
              }
            }],
          },
          legend: {
            display: false
          }
        }
      });
      
      
      
      
      
      
      // -- Gráfico de pizza
      var ctx = document.getElementById("ServicoContratado");
      
      
      var internet = <%=internet%>;
      var voip = <%=voip%>;
      var voip_internet = <%=voip_internet%>;
      var cancelamento = <%=cancelamento%>;
      
      
      var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: ["Internet", "VoIP", "VoIP e Internet", "Cancelamento"],
          datasets: [{
            data: [ internet, voip, voip_internet, cancelamento],
            backgroundColor: ['#007bff', '#ffc107', '#28a745' , '#dc3545'],
          }],
        },
      });
  </script>
</body>
</html>
