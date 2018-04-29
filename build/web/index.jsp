<%-- 
    Document   : index2
    Created on : 28/03/2018, 14:41:31
    Author     : Nando Luz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="pt-br">
    <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=devicre-width, initial-scale=1">
            <link rel="shortcut icon" href="imagens/favicon/favicon.ico" type="image/x-icon" />
            
            <!--Stylos da pagina-->
            <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
            <link rel="stylesheet" href="resources/css/style.css">
            
            
            <!--Scripts da pagina-->
            <script src="bootstrap/js/bootstrap.js"></script>
            
            <!--titulo da pagina-->
            <title>Gente Telecom</title>
            
            
            <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 25%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100;
    }
}
</style>
    </head>
    
    
    

<form action="/action_page.php">
  <div class="imgcontainer">
    <img src="img/logotipo.png">
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
        
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form> 
      
        
       
       
       
      <!-- Main jumbotron for a primary marketing message or call to action -->
<!--      <div class="jumbotron innerjumbotron"  id="large-header">
          <canvas id="demo-canvas"></canvas>
      </div>-->
      <!-- /.jumbotron --> 


      <!-- Inicio animação -->
<!--      <script type='text/javascript' src='resources/js/animation/jquery.form.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/TweenLite.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/EasePack.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/device.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/isotope.pkgd.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/jquery.ba-bbq.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/bootstrap.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/bootstrap-hover-dropdown.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/jquery.bxslider.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/classie.js?ver=2.3.0'></script>
      <script type='text/javascript' src='resources/js/animation/jquery.viewportchecker.js'></script>
      <script type='text/javascript' src='resources/js/animation/main.js'></script>
      <script type='text/javascript' src='resources/js/animation/core.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/datepicker.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/wp-embed.min.js'></script>
      <script type='text/javascript' src='resources/js/animation/jsanim.js'></script>-->
      <!-- Fim animação-->
        <script src="resources/jquery.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
