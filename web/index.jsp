<%-- 
    Document   : index2
    Created on : 28/03/2018, 14:41:31
    Author     : Nando Luz
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="pt-br">
    <head>
            <meta name="viewport" content="width=devicre-width, initial-scale=1">
            <!-- Bootstrap core JavaScript-->
            <script src="resources/vendor/jquery/jquery.min.js"></script>
            <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="resources/js/validator.min.js"></script>
            <!-- Bootstrap core CSS-->
            <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <!-- Custom fonts for this template-->
            <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
            <!-- Custom styles for this template-->
            <link href="resources/css/sb-admin.css" rel="stylesheet">
            <!--icon-->
            <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon" />            
            <!--titulo da pagina-->
            <title>Gente Telecom</title>
            <style>
                .bg-dark{
                    opacity: 0.95;
                }
                .shadow{
                    box-shadow: 0px 8px 50px #000;
                }
                .background{
                    background-size: 100%; 
                    background-repeat: no-repeat;
                    background-image: url('img/background/login_background.jpg');
                    width: 100%;
                    height: 100%;
                    position: absolute;
                    top: 0; 
                    left: 0;
                    filter: blur(2px);
                }
                .card{
                    border-radius: 30px;
                    opacity: 0.9;
                }                
            </style>
    </head>
    <body class="home blog geral bg-dark">  
        <div class="container">
            <div class="background"></div>
        </div>
        <div class="nav navbar bg-dark shadow" style="top: -12px;">
            <h1 class="nav navbar-text"><img src="img/logotipo.png"></h1>
        </div>
        <div class="container-fluid col-md-4" style="margin-top: 8%;">
            
            <div class="card text-white mb-3 shadow">
                <div class="card-header text-white form-inline bg-dark" style="border-radius: 29px 29px 2px 2px;">
                    <div class="my-2 my-lg-0 mr-lg-2">
                        <i class="fa fa-user-o" style="margin-right: 10px"></i>
                        <h7>LOGIN</h7>
                    </div>                
                </div>
                <div class="card-body">
                    <form data-toggle="validator" role="form" action="pages/gerenciar_seguranca.do" method="post" style="color: black">
                        <div class="form-group">                            
                            <label style="margin: 0px"></label>
                            <div class="input-group col-xs-6">
                                <span class="input-group-btn" style=" border-radius: 20px 0px 0px 20px; background-color: #007bff;color: white">
                                    <li type="" class="btn btn-default" disabled>
                                        <i class="fa fa-fw fa-user"></i>
                                    </li>
                                </span>
                                <input name="username" type="text" class="form-control" autofocus required autocomplete="off" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="margin: 0px"></label>
                            <div class="input-group col-xs-6">
                                <span class="input-group-btn" style=" border-radius: 20px 0px 0px 20px; background-color: #007bff;color: white">
                                    <li type="" class="btn btn-default" disabled>
                                        <i class="fa fa-fw fa-lock"></i>
                                    </li>
                                </span>
                                <input name="senha" type="password" class="form-control" aria-describedby="Help" data-error="Preencha todos os campus!" required>
                            </div>
                            
                            <small id="Help" class="form-text text-muted">Não compartilhe seus dados de acesso.</small>
                            <div class="help-block with-errors"></div>
                        </div>
                        <br>
                        <input type="hidden" name="id" value="0">
                        <center><button class="btn btn-primary" name="option" value="login" style="width: 50%;">Entrar</button></center>
                    </form>
                </div>
                
            </div>
        </div>
      
    </body>
</html>
