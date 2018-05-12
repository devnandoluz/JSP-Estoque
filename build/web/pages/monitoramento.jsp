<%-- 
    Document   : monitoramento
    Created on : 14/04/2018, 15:55:38
    Author     : Nando Luz
--%>

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
      
      <!-- Area Chart Example-->
        <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-area-chart"></i> Gráfico de Área </div>
            <div class="card-body">
              <canvas id="myAreaChart" width="100%" height="30"></canvas>
            </div>
            <div class="card-footer small text-muted">Atualizado ontem às 11:59 PM</div>
        </div>
        <div class="row">
            <div class="col-lg-8">
            <!-- Example Bar Chart Card-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-bar-chart"></i> Bar Chart Example</div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-8 my-auto">
                          <canvas id="myBarChart" width="100" height="50"></canvas>
                        </div>
                        <div class="col-sm-4 text-center my-auto">
                             <div class="h4 mb-0 text-primary">$34,693</div>
                            <div class="small text-muted">YTD Revenue</div>
                            <hr>
                            <div class="h4 mb-0 text-warning">$18,474</div>
                            <div class="small text-muted">YTD Expenses</div>
                            <hr>
                            <div class="h4 mb-0 text-success">$16,219</div>
                            <div class="small text-muted">YTD Margin</div>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>
            </div>
            <div class="col-lg-4">
                <!-- Example Pie Chart Card-->
                <div class="card mb-3">
                  <div class="card-header">
                    <i class="fa fa-pie-chart"></i> Pie Chart Example</div>
                  <div class="card-body">
                    <canvas id="myPieChart" width="100%" height="100"></canvas>
                  </div>
                  <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
            <!-- Custom scripts for this page-->
            <script src="../resources/js/sb-admin-charts.min.js"></script>
    </div>
</body>
</html>
