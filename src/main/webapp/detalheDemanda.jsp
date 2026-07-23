<%@page import="br.edu.ifba.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // SIMULAÇÃO: Mude para 'true' para testar como a tela fica após o aluno assumir a demanda
    boolean demandaAssumida = false; 
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Detalhes da Demanda - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body class="d-flex">
    <jsp:include page="sidebar.jsp" />

<!-- CONTEÚDO PRINCIPAL -->
<div class="content">
    
    <div class="d-flex align-items-center mb-4">
        <a href="buscarDemandas.jsp" class="btn btn-outline-secondary btn-sm me-3">&larr; Voltar para Busca</a>
        <h2 class="mb-0 text-dark fw-bold">Especificação da Demanda</h2>
    </div>

    <div class="card card-custom shadow">
        <div class="card-header-green">
            <h3 class="mb-0 fw-bold" style="font-size: 1.5rem;">Sistema para Gestão de Eventos</h3>
        </div>

        <div class="card-body p-4">
            
            <!-- METADADOS RÁPIDOS -->
            <div class="row mb-4 border-bottom pb-3">
                <div class="col-md-4 mb-2">
                    <span class="text-muted small d-block">ÁREA DE ATUAÇÃO</span>
                    <strong class="text-dark">Tecnologia</strong>
                </div>
                <div class="col-md-4 mb-2">
                    <span class="text-muted small d-block">STATUS DA SOLICITAÇÃO</span>
                    <% if (demandaAssumida) { %>
                        <span class="badge bg-success px-2 py-1 mt-1">Assumida</span>
                    <% } else { %>
                        <span class="badge bg-secondary px-2 py-1 mt-1">Em Análise</span>
                    <% } %>
                </div>
                <div class="col-md-4 mb-2">
                    <span class="text-muted small d-block">PRAZO ESTIMADO</span>
                    <strong class="text-dark">30/12/2026</strong>
                </div>
            </div>

            <!-- DETALHAMENTO DA DEMANDA -->
            <div class="info-block">
                <h5 class="text-success fw-bold mb-2" style="font-size: 1rem;">Descrição da Necessidade</h5>
                <p class="text-dark mb-0">
                    Necessidade de um sistema para gerenciamento de eventos comunitários.
                </p>
            </div>

            <div class="info-block">
                <h5 class="text-success fw-bold mb-2" style="font-size: 1rem;">Contexto Social / Justificativa</h5>
                <p class="text-dark mb-0">
                    A organização realiza eventos mensais e não possui ferramenta de controle, dependendo de planilhas manuais propensas a erros.
                </p>
            </div>

            <div class="info-block">
                <h5 class="text-success fw-bold mb-2" style="font-size: 1rem;">Impacto Comunitário Esperado</h5>
                <p class="text-dark mb-0">
                    Maior organização, transparência e alcance das ações comunitárias na região de Camaçari - BA.
                </p>
            </div>

            <div class="mb-4 ps-1">
                <span class="text-muted small d-block">LOCALIDADE DA EXECUÇÃO</span>
                <span class="fw-semibold text-dark">Camaçari - BA</span>
            </div>

            <hr class="my-4">

            <!-- INTERAÇÃO DINÂMICA DE BOTÕES -->
            <div class="d-flex gap-2">
                <% if (!demandaAssumida) { %>
                    <!-- Se NÃO assumiu, exibe o botão padrão -->
                    <a href="AssumirDemandaServlet?id=1" class="btn btn-green px-5 py-2 fw-bold">
                        Assumir Demanda Social
                    </a>
                <% } else { %>
                    <!-- REGRA: Se ASSUMIU, renderiza as duas opções solicitadas -->
                    <a href="analisarDemanda.jsp?id=1" class="btn btn-success px-4 py-2 fw-bold" style="background-color: #195e3d; border: none;">
                        Analisar Demanda
                    </a>
                    <a href="DesistirDemandaServlet?id=1" class="btn btn-outline-danger px-4 py-2 fw-bold">
                        Desistir da Demanda
                    </a>
                <% } %>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>