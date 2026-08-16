<%@page import="br.edu.ifba.model.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        painel = "dashboardComunidade.jsp"; 
    }
%>

<aside class="sidebar d-flex flex-column justify-content-between p-3" style="background-color: var(--color-primary-light, #cce5d8); border-right: 1px solid var(--color-border, #dee2e6);">
    <div class="sidebar-top">
        <!-- LOGO DA SIDEBAR -->
        <div class="logo-container text-center mb-3">
            <img src="${pageContext.request.contextPath}/logo.png" alt="Logo IFBA Transforma" class="logo-img img-fluid" style="max-height: 150px;">
        </div>
        
        <h2 class="fs-6 fw-bold text-uppercase text-muted text-center mb-4 px-2" style="letter-spacing: 0.05em; color: var(--color-primary) !important;">
            IFBA Transforma
        </h2>
        
        <!-- MENU DE NAVEGAÇÃO -->
        <nav class="sidebar-menu nav flex-column gap-1">
            <!-- Link do painel dinâmico -->
            <a href="<%= painel %>" class="nav-link fw-semibold rounded py-2 px-3 transition-all">
                Painel
            </a>
            
            <%-- VERIFICAÇÃO DE MENOS POR TIPO DE USUÁRIO --%>
            
            <% if (tipo.equalsIgnoreCase("Administrador") || tipo.equalsIgnoreCase("Admin")) { %>
                <!-- MENU DO ADMINISTRADOR -->
                <a href="demandasAdmin.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Demandas</a>
                <a href="projetosAdmin.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Projetos</a>
                <a href="meu_perfil.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Meu Perfil</a>
                
            <% } else if (tipo.equalsIgnoreCase("Professor Orientador") || tipo.equalsIgnoreCase("Professor")) { %>
                <!-- MENU DO PROFESSOR -->
                <a href="MinhasDemandasServlet" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Minhas Demandas</a>
                <a href="buscarDemandas.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Buscar Demandas</a>
                <a href="meu_perfil.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Meu Perfil</a>
                
            <% } else if (tipo.toLowerCase().contains("empresa") || tipo.toLowerCase().contains("comunidade")) { %>
                <!-- MENU DA EMPRESA / COMUNIDADE -->
                <a href="MinhasDemandasServlet" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Minhas Demandas</a>
                <a href="meu_perfil.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Meu Perfil</a>
                
            <% } else { %>
                <!-- MENU DO ESTUDANTE -->
                <a href="buscarDemandas.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Buscar Demandas</a>
                <a href="meu_perfil.jsp" class="nav-link fw-semibold rounded py-2 px-3 transition-all">Meu Perfil</a>
            <% } %>
            
        </nav>
    </div>
    
    <!-- BOTÃO SAIR / LOGOUT -->
    <div class="btn-sair-container pt-3 border-top mt-auto" style="border-color: var(--color-border, #dee2e6) !important;">
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-danger w-100 fw-bold py-2 d-flex align-items-center justify-content-center gap-2" style="border-radius: var(--radius-md, 8px);">
            <span>Sair</span>
        </a>
    </div>
</aside>