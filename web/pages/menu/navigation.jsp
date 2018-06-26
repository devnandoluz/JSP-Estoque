<%-- 
    Document   : menu
    Created on : 29/04/2018, 13:58:26
    Author     : Nando Luz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page import="model.Perfil"%>
<%@page import="model.Usuario"%>
<!--
    ATENÇÃO!
    Neste Menu está:
    *Bootstrap core JavaScript
-->

<%
    HttpSession sessao = request.getSession();
    Usuario usuario = null;
    if(sessao.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    } else {
        usuario = new Usuario();
        usuario = (Usuario)sessao.getAttribute("usuario");
%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="home.jsp"><img src="../img/logotipo.png"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <%        
            ArrayList<Menu> listaMenu = new ArrayList();
              try{
                    Menu buscarM = new Menu();
                    listaMenu = buscarM.findForUse(usuario.getPerfil().getId());
              }catch(Exception e){
                  out.print("Erro:"+e);
              }                              
            for(Menu menu12:listaMenu){ 
                if(menu12.getStatus() != 0){
                    if(menu12.getMenu().equalsIgnoreCase("Adicionar")){
                        %>  
                        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Adicionar">
                          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseAdicinar" data-parent="#collapseAdicinar">
                            <i class="fa fa-fw fa-plus-square"></i>
                            <span class="nav-link-text">Adicionar</span>
                          </a>
                          <ul class="sidenav-second-level collapse" id="collapseAdicinar">
                            <li>
                                <a href="cadastra_cliente.jsp">
                                    <i class="fa fa-fw fa-user-plus"></i>
                                    <span class="nav-link-text">Cliente</span>
                                </a>
                            </li>
                            <li>
                                <a href="cadastra_funcionario.jsp">
                                    <i class="fa fa-fw fa-plus-square-o"></i>
                                    <span class="nav-link-text">Funcionário</span>
                                </a>
                            </li>
                            <li>
                                <a href="cadastra_produto.jsp">
                                    <i class="fa fa-fw fa-cart-plus"></i>
                                    <span class="nav-link-text">Produto</span>
                                </a>
                            </li>
                          </ul>
                        </li>
          
          <%
                    }else{
                    if(menu12.getMenu().equalsIgnoreCase("Gerar")){
                        %>
                        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Gerar Contrato">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseGerarContrato" data-parent="#collapseGerarContrato">
                          <i class="fa fa-fw fa-file-text"></i>
                          <span class="nav-link-text">Gerar Contrato</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseGerarContrato">
                          <li>
                              <a href="gerar_contrato_voip.jsp">
                                  <i class="fa fa-fw fa-file-text"></i>
                                  VoIP
                              </a>
                          </li>
                          <li>
                              <a href="gerar_contrato_internet.jsp">
                                  <i class="fa fa-fw fa-file-text"></i>
                                  Internet
                              </a>
                          </li>
                        </ul>
                      </li>
                        <%
                    }else{
        %>
            
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Home">
                      <a class="nav-link" href="<%=menu12.getLink()%>">
                        <i class="fa fa-fw <%=menu12.getIcone()%> "></i>
                        <span class="nav-link-text"><%=menu12.getMenu()%></span>
                      </a>
                    </li>
                    
        <%            
                    }
                }
            }
        }
        if(usuario.getPerfil().getId() == 1){
        %>
            
                   <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Pagina Root">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseRoot" data-parent="#collapseRoot">
                      <i class="fa fa-fw fa-hashtag"></i>
                      <span class="nav-link-text">Root</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="collapseRoot">
                      <li>
                        <a href="menu.jsp">
                            <i class="fa fa-fw fa-link"></i>
                            Menu
                        </a>
                      </li>
                      <li>
                        <a href="perfil.jsp">
                            <i class="fa fa-fw fa-vcard"></i>
                            Perfil
                        </a>
                      </li>
                    </ul>
                  </li>
              
        <%
            }
        %> 
                
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fa fa-fw fa-user"></i>
            <span class="d-lg-none">
                Usuário
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
              <h6 class="dropdown-header" style="text-transform: uppercase;">
                    <i class="fa fa-fw fa-user"></i>
                   <%= usuario.getUsername() %>
              </h6>
            <div class="dropdown-divider"></div>
                <a class="nav-link dropdown-item" href="./alterar_usuario.jsp">
                    <span class="text-muted">
                        <strong>
                            <input type="hidden" name="id" value="<%=usuario.getId()%>">
                            <i class="fa fa-cog fa-fw"></i> Configurar
                        </strong>
                    </span>
                </a>
            
            <div class="dropdown-divider"></div>
                <a class="nav-link dropdown-item" data-toggle="modal" data-target="#Modal">
                    <span class="text-muted">
                        <strong>
                            <i class="fa fa-fw fa-sign-out"></i>Sair
                        </strong>
                    </span>
                </a>
          </div>
        </li>
        
        
        <li class="nav-item">
            <form class="form-inline my-2 my-lg-0 mr-lg-2" method="get" action="http://www.google.com/search" target="_blank">
                <div class="input-group">
                    <input value="" name="q" class="form-control" type="text" placeholder="Procurar no Google">
                    <span class="input-group-append">
                        <button class="btn btn-primary">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
        </li>
        
      </ul>
    </div>
  </nav>
  <!-- Logout Modal-->
    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="ModalLabel">Pronto para partir?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Selecione "Sair" abaixo, se você estiver pronto para encerrar sua sessão atual.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-primary" href="gerenciar_seguranca.do?option=logout">Sair</a>
          </div>
        </div>
      </div>
    </div> 
    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
            
<%
    }
%>