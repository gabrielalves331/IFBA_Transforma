<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.ifba.model.Subarea" %>
<%@ page import="br.edu.ifba.dao.SubareaDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Busca subáreas reais do banco para popular o select
    SubareaDAO subareaDAO = new SubareaDAO();
    List<Subarea> listaSubareas = subareaDAO.listarTodas();
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Demandas - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body> 
    
    <jsp:include page="sidebar.jsp" />

    <main class="content">
        <div class="mb-4">
            <h1 class="page-title m-0">Cadastro de Demandas</h1>
            <p class="subtitulo mb-0">Cadastre uma nova necessidade ou desafio para ser transformado em projeto acadêmico.</p>
        </div>

        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger p-3 mb-4 rounded-3 small border-0 shadow-sm" role="alert" style="max-width: 800px;">
                <strong>Erro:</strong> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <div class="card-painel p-4" style="max-width: 800px;">
            <form action="CadastrarDemandaServlet" method="POST">
                
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Título</label>
                    <input type="text" name="titulo" class="form-control" placeholder="Ex: Sistema de Gestão para Horta Comunitária" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <!-- ÁREA / SETOR DINÂMICO -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Área / Setor</label>
                    <select name="subareaId" class="form-select" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                        <option value="" selected disabled hidden>Selecione a área responsável</option>
                        <% for (Subarea sub : listaSubareas) { %>
                            <option value="<%= sub.getId() %>"><%= sub.getNome() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Descrição</label>
                    <textarea name="descricao" class="form-control" rows="4" placeholder="Descreva detalhadamente o problema ou desafio a ser resolvido..." required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Localidade / Comunidade</label>
                    <input type="text" name="localidade" class="form-control" placeholder="Ex: Bairro Central, ONG X..." style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Requisitos (Contexto)</label>
                    <input type="text" name="contexto" class="form-control" placeholder="Separe os requisitos por vírgula" style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Impacto Esperado</label>
                    <input type="text" name="impactoEsperado" class="form-control" placeholder="Ex: Atendimento a 50 famílias" style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <div class="mb-4">
                    <label class="form-label text-muted small fw-bold">Prazo de Entrega</label>
                    <input type="date" name="prazo" class="form-control" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <div class="text-end border-top pt-3">
                    <button type="submit" class="btn btn-primary px-5 fw-bold" style="border-radius: var(--radius-md);">
                        Cadastrar Demanda
                    </button>
                </div>
            </form>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
