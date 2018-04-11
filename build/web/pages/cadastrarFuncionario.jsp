<%-- 
    Document   : cadastrarFuncionario
    Created on : 11/04/2018, 12:08:46
    Author     : Nando Luz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Stylo da pagina-->
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
        <link rel="shortcut icon" href="../imagens/favicon/favicon.ico" type="image/x-icon" />
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <title>Cadastrar Novo Funcionario</title>
    </head>
    <body>
        <h1 class="navbar navbar-text col-md-12">Novo Funcionario</h1>
        <br>
        <a class="btn btn-dark" href="listarFuncionarios.jsp"> &lt; Voltar</a>
        <br>
        <br>
        <!--<div class="nav navbar col-md-10">-->
            <form class="navbar nav-tabs navbar-nav col-md-10" method="post" action="gerenciar_usuario.do">
                <table class="text-center">
                    <tr>
                        <th>Nome</th> <td><input type="text" size="50" name="username"placeholder="Nome Sobrenome"></td>
                    </tr>
                    <tr>
                        <th>CPF:</th> <td><input type="text" size="50" name="pass" placeholder="000.000.000-00"></td>
                    </tr>
                </table>
                <br>
                <center>
                    <input type="hidden" name="option" value="insert">
                    <input class="btn btn-success" type="submit" id="button" value="Cadastrar Usuário">
                </center>
            </form>
        <!--</div>-->
        
        <!-- Bootstrap JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    </body>
</html>
