<%-- 
    Document   : monitoramento
    Created on : 14/04/2018, 15:55:38
    Author     : Nando Luz
--%>

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
        <li class="breadcrumb-item active">Monitoramento</li>
      </ol>
      
      
            <%
                      //variaveis de serviços
                      int internet = 0, voip = 0, voip_internet = 0, cancelamento = 0;
                      //variaveis de valores
                      double total_lucro = 0;
                      double menor_lucro = 0;
                      double maior_lucro = 0;
                      double media_lucro = 0;
                      //variavel para contar o numero de cliente.
                      int num_cliente = 0;
                      
                      ArrayList<Cliente> lista = new ArrayList();
                      
                      Cliente buscar = new Cliente();
                      
                      lista = buscar.findAll();
                      
                        for(Cliente cliente:lista){
                            num_cliente = num_cliente + 1;
                            if(cliente.getServicoContratado().equalsIgnoreCase("Internet")){
                              internet = internet + 1;
                              total_lucro = total_lucro + cliente.getValor_servico();
                              if(maior_lucro < cliente.getValor_servico()){
                                  maior_lucro = cliente.getValor_servico();
                              }
                              if(menor_lucro > cliente.getValor_servico()){
                                  menor_lucro = cliente.getValor_servico();
                              }
                            }else{
                                if(cliente.getServicoContratado().equalsIgnoreCase("VoIP")){
                                    voip = voip + 1;
                                    total_lucro = total_lucro + cliente.getValor_servico();
                                    if(maior_lucro < cliente.getValor_servico()){
                                        maior_lucro = cliente.getValor_servico();
                                    }
                                    if(menor_lucro == 0 || menor_lucro > cliente.getValor_servico()){
                                        menor_lucro = cliente.getValor_servico();
                                    }
                                }else{
                                    if(cliente.getServicoContratado().equalsIgnoreCase("VoIP e Internet")){
                                        voip_internet = voip_internet + 1;
                                        total_lucro = total_lucro + cliente.getValor_servico();
                                        if(maior_lucro < cliente.getValor_servico()){
                                            maior_lucro = cliente.getValor_servico();
                                        }
                                        if(menor_lucro > cliente.getValor_servico()){
                                            menor_lucro = cliente.getValor_servico();
                                        }
                                    }else{
                                        if(cliente.getServicoContratado().equalsIgnoreCase("Cancelamento")){
                                            cancelamento = cancelamento + 1;
                                            if(maior_lucro < cliente.getValor_servico()){
                                                maior_lucro = cliente.getValor_servico();
                                            }
                                            if(menor_lucro > cliente.getValor_servico()){
                                                menor_lucro = cliente.getValor_servico();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        media_lucro = total_lucro / num_cliente;
                  %>
                 
      
      <!-- Area Chart Example-->
        <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-area-chart"></i> Gráfico de Área </div>
            <div class="card-body">
              <canvas id="myAreaChart" width="100%" height="30"></canvas>
            </div>
            <div class="card-footer small text-muted">Atualizado agora mesmo</div>
        </div>
      
      
      
        <%
            DecimalFormat df = new DecimalFormat("0.00");
            String dfmedia = df.format(media_lucro);
        %>
      
        <div class="row">
            <div class="col-lg-8">
            <!-- Example Bar Chart Card-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-bar-chart"></i> Gráfico de barras </div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-8 my-auto">
                          <canvas id="myBarChart" width="100" height="50"></canvas>
                        </div>
                          
                        <div class="col-sm-4 text-center my-auto">
                            <div class="h4 mb-0 text-primary">R$ <%=maior_lucro%></div>
                            <div class="small text-muted">Maior lucro</div>
                            <hr>
                            <div class="h4 mb-0 text-warning">R$ <%=menor_lucro%></div>
                            <div class="small text-muted">Menor lucro</div>
                            <hr>
                            <div class="h4 mb-0 text-success">R$ <%=dfmedia%></div>
                            <div class="small text-muted">Média de lucro</div>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer small text-muted"> Atualizado agora mesmo </div>
                </div>
            </div>
            
            
            
            <div class="col-lg-4">
                <!-- Example Pie Chart Card-->
                <div class="card mb-3">
                  <div class="card-header">
                    <i class="fa fa-pie-chart"></i> Serviços Contratados </div>
                  <div class="card-body">
                    <canvas id="ServicoContratado" width="100%" height="100"></canvas>
                  </div>
                  <div class="card-footer small text-muted"> Atualizado minutos atrás </div>
                </div>
            </div>
            
            
        </div>
      
      
    </div>
            <!-- /.container-fluid-->
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
      var ctx = document.getElementById("myAreaChart");
      var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
          datasets: [{
            label: "Faturamento",
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
            data: [10, 21, 26, 18, 0, 28, 31, 33, 25, 24, 32, 31, 38],
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
                max: 50,
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
      var ctx = document.getElementById("myBarChart");
      var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
          datasets: [{
            label: "Revenue",
            backgroundColor: "rgba(2,117,216,1)",
            borderColor: "rgba(2,117,216,1)",
            data: [425, 532, 625, 740, 901, 984, 804, 794, 652, 500, 654, 780],
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
                maxTicksLimit: 6
              }
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: 1000,
                maxTicksLimit: 5
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
  
  
  
  
  
    </div>
</body>
</html>
