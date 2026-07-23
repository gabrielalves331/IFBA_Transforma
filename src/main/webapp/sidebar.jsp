<%@page import="br.edu.ifba.model.Usuario"%>
<%
    // 1. Pega o usuário da sessão de forma segura
    Usuario user = (Usuario) session.getAttribute("usuario");
    String tipo = (user != null && user.getTipo() != null) ? user.getTipo() : "";
    
    // 2. Define a página de Painel padrão
    String painel = "dashboardEstudante.jsp";
    
    // 3. Ajusta o link do painel baseado no perfil do usuário
    if (tipo.equalsIgnoreCase("Professor Orientador") || tipo.equalsIgnoreCase("Professor")) {
        painel = "dashboardProfessor.jsp"; 
    } else if (tipo.equalsIgnoreCase("Administrador") || tipo.equalsIgnoreCase("Admin")) {
        painel = "AdminServlet"; 
    } else if (tipo.toLowerCase().contains("empresa") || tipo.toLowerCase().contains("comunidade")) {
        painel = "dashboardComunidade.jsp"; // Aponta para o painel que criamos
    }
%>

<div class="sidebar">
    <div class="sidebar-top">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/logoifbaTransforma_semlegenda.png" alt="Logo" class="logo-img">
        </div>
        <h2>IFBA Transforma</h2>
        
        <div class="sidebar-menu">
            <!-- O link do painel já é dinâmico -->
            <a href="<%= painel %>">Painel</a>
            
            <%-- VERIFICAÇÃO DE MENUS POR TIPO DE USUÁRIO --%>
            
            <% if (tipo.equalsIgnoreCase("Administrador") || tipo.equalsIgnoreCase("Admin")) { %>
                <!-- MENU DO ADMINISTRADOR -->
                <a href="demandasAdmin.jsp">Demandas</a>
                <a href="projetosAdmin.jsp">Projetos</a>
                <a href="meu_perfil.jsp">Meu Perfil</a>
                
            <% } else if (tipo.equalsIgnoreCase("Professor Orientador") || tipo.equalsIgnoreCase("Professor")) { %>
                <!-- MENU DO PROFESSOR -->
                <a href="MinhasDemandasServlet">Minhas Demandas</a>
                <a href="buscarDemandas.jsp">Buscar Demandas</a>
                <a href="meu_perfil.jsp">Meu Perfil</a>
                
            <% } else if (tipo.toLowerCase().contains("empresa") || tipo.toLowerCase().contains("comunidade")) { %>
                <!-- MENU DA EMPRESA / COMUNIDADE (Sem link redundante de nova demanda) -->
                <a href="MinhasDemandasServlet">Minhas Demandas</a>
                <a href="meu_perfil.jsp">Meu Perfil</a>
                
            <% } else { %>
                <!-- MENU DO ESTUDANTE -->
                <a href="buscarDemandas.jsp">Buscar Demandas</a>
                <a href="meu_perfil.jsp">Meu Perfil</a>
            <% } %>
            
        </div>
    </div>
    
    <div class="btn-sair-container">
        <!-- Redireciona para o Servlet de logout -->
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn-sair"><span>Sair</span></a>
    </div>
</div>