<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="br.edu.ifba.model.Demanda" %>
<%@ page import="br.edu.ifba.dao.DemandaDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Garante o carregamento da demanda mesmo se a página for acessada diretamente via ID na URL
    if (request.getAttribute("demanda") == null) {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                DemandaDAO demandaDAO = new DemandaDAO();
                Demanda d = demandaDAO.buscarPorId(Integer.parseInt(idStr));
                request.setAttribute("demanda", d);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Demanda - IFBA Transforma</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- Navegação / Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">IFBA Transforma</a>
            <div class="ms-auto">
                <c:if test="${not empty sessionScope.usuario}">
                    <span class="navbar-text me-3 text-white">
                        Olá, <strong>${sessionScope.usuario.nome}</strong> (${sessionScope.usuario.tipo})
                    </span>
                    <a href="LogoutServlet" class="btn btn-outline-light btn-sm">Sair</a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container">
        
        <!-- Alertas de Erro / Sucesso -->
        <c:if test="${not empty sessionScope.mensagemErro}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${sessionScope.mensagemErro}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% session.removeAttribute("mensagemErro"); %>
        </c:if>

        <!-- Trata caso a demanda não seja encontrada -->
        <c:if test="${empty demanda}">
            <div class="alert alert-warning text-center my-5 p-4">
                <h4>Demanda não encontrada!</h4>
                <p>A demanda solicitada não existe ou o parâmetro informado é inválido.</p>
                <a href="MinhasDemandasServlet" class="btn btn-primary mt-2">Voltar para Minhas Demandas</a>
            </div>
        </c:if>

        <c:if test="${not empty demanda}">
            <!-- Botão Voltar -->
            <div class="mb-3">
                <a href="javascript:history.back()" class="btn btn-outline-secondary btn-sm">
                    <i class="bi bi-arrow-left"></i> Voltar
                </a>
            </div>

            <div class="row">
                <!-- Coluna Principal: Conteúdo da Demanda -->
                <div class="col-lg-8">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">${demanda.titulo}</h4>
                            <span class="badge bg-light text-primary fs-6">${demanda.status}</span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-secondary border-bottom pb-2">Descrição</h5>
                            <p class="card-text">${demanda.descricao}</p>

                            <c:if test="${not empty demanda.contexto}">
                                <h5 class="card-title text-secondary border-bottom pb-2 mt-4">Contexto</h5>
                                <p class="card-text">${demanda.contexto}</p>
                            </c:if>

                            <c:if test="${not empty demanda.impactoEsperado}">
                                <h5 class="card-title text-secondary border-bottom pb-2 mt-4">Impacto Esperado</h5>
                                <p class="card-text">${demanda.impactoEsperado}</p>
                            </c:if>
                        </div>
                    </div>
                </div>

                <!-- Coluna Lateral: Informações e Painel de Ações -->
                <div class="col-lg-4">
                    <!-- Ficha de Informações -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white">
                            <h5 class="mb-0 text-secondary"><i class="bi bi-info-circle me-1"></i> Informações</h5>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <strong>Demandante:</strong><br>
                                <span class="text-muted">${demanda.descDemandante}</span>
                            </li>
                            <li class="list-group-item">
                                <strong>Tipo do Criador:</strong><br>
                                <span class="text-muted">${demanda.tipoCriador}</span>
                            </li>
                            <c:if test="${not empty demanda.prazo}">
                                <li class="list-group-item">
                                    <strong>Prazo Desejado:</strong><br>
                                    <span class="text-muted"><fmt:formatDate value="${demanda.prazo}" pattern="dd/MM/yyyy"/></span>
                                </li>
                            </c:if>
                        </ul>
                    </div>

                    <!-- CARD DE AÇÕES -->
                    <div class="card shadow-sm mb-4 border-primary">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="bi bi-person-plus-fill me-1"></i> Ações de Participação</h5>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <%-- PERFIL: PROFESSOR --%>
                                <c:when test="${not empty sessionScope.usuario && fn:containsIgnoreCase(sessionScope.usuario.tipo, 'professor')}">
                                    <div class="d-grid gap-2">

                                        <%-- Opção 1: Assumir Orientação (Exibe somente se NÃO tiver orientador) --%>
                                        <c:if test="${empty demanda.orientadorId}">
                                            <form action="AdotarDemandaServlet" method="POST">
                                                <input type="hidden" name="demandaId" value="${demanda.id}">
                                                <button type="submit" class="btn btn-success w-100 mb-2">
                                                    🎓 Assumir Orientação Principal
                                                </button>
                                            </form>
                                        </c:if>

                                        <%-- Opção 2: Entrar como Professor Colaborador --%>
                                        <form action="SolicitacaoServlet" method="POST">
                                            <input type="hidden" name="demandaId" value="${demanda.id}">
                                            <input type="hidden" name="acao" value="solicitar">
                                            <input type="hidden" name="papelPretendido" value="PROFESSOR_COLABORADOR">
                                            <button type="submit" class="btn btn-outline-primary w-100">
                                                🤝 Solicitar como Colaborador
                                            </button>
                                        </form>

                                    </div>
                                </c:when>

                                <%-- PERFIL: ESTUDANTE / DEMAIS USUÁRIOS --%>
                                <c:otherwise>
                                    <form action="SolicitacaoServlet" method="POST">
                                        <input type="hidden" name="demandaId" value="${demanda.id}">
                                        <input type="hidden" name="acao" value="solicitar">

                                        <div class="mb-3">
                                            <label for="papelPretendido" class="form-label font-weight-bold">Deseja atuar como:</label>
                                            <select name="papelPretendido" id="papelPretendido" class="form-select">
                                                <option value="BOLSISTA">Bolsista</option>
                                                <option value="VOLUNTARIO">Voluntário</option>
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-primary w-100">
                                            ✋ Tenho Interesse / Solicitar
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>

                            <!-- Botão para Gerenciar Equipe (Visível para o Orientador do projeto ou Professores) -->
                            <c:if test="${not empty sessionScope.usuario && (sessionScope.usuario.id == demanda.orientadorId || fn:containsIgnoreCase(sessionScope.usuario.tipo, 'admin') || fn:containsIgnoreCase(sessionScope.usuario.tipo, 'professor'))}">
                                <hr>
                                <a href="gerenciar_equipe.jsp?demandaId=${demanda.id}" class="btn btn-warning w-100 text-dark fw-bold">
                                    <i class="bi bi-people-fill me-1"></i> Gerenciar Equipe / Aceitar Alunos
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>