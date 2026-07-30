<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Demandas - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body> 
    
    <!-- SIDEBAR IMPORTADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        
        <!-- CABEÇALHO DA PÁGINA -->
        <div class="mb-4">
            <h1 class="page-title m-0">Cadastro de Demandas</h1>
            <p class="subtitulo mb-0">Cadastre uma nova necessidade ou desafio para ser transformado em projeto acadêmico.</p>
        </div>

        <!-- MENSAGEM DE ERRO DINÂMICA -->
        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger p-3 mb-4 rounded-3 small border-0 shadow-sm" role="alert" style="max-width: 800px;">
                <strong>Erro:</strong> <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <!-- CONTAINER DO FORMULÁRIO -->
        <div class="card-painel p-4" style="max-width: 800px;">
            <form action="CadastrarDemandaServlet" method="POST">
                
                <!-- TÍTULO -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Título</label>
                    <input type="text" name="titulo" class="form-control" placeholder="Ex: Sistema de Gestão para Horta Comunitária" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <!-- ÁREA / SETOR -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Área / Setor</label>
                    <select name="subareaId" class="form-select" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                        <option value="" selected disabled hidden>Selecione a área responsável</option>
                        <option value="1">Tecnologia da Informação</option>
                        <option value="2">Eletrotécnica / Energia</option>
                        <option value="3">Mecânica / Automação</option>
                        <option value="4">Administração / Negócios</option>
                    </select>
                </div>

                <!-- DESCRIÇÃO -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Descrição</label>
                    <textarea name="descricao" class="form-control" rows="4" placeholder="Descreva detalhadamente o problema ou desafio a ser resolvido..." required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);"></textarea>
                </div>

                <!-- REQUISITOS -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Requisitos</label>
                    <div class="mb-2 d-flex gap-1 flex-wrap align-items-center">
                        <span class="badge bg-secondary text-light p-1 px-2" style="font-size: 0.75rem;">EX:</span>
                        <span class="badge bg-light text-secondary border p-1 px-2" style="font-size: 0.75rem;">Java Web</span>
                        <span class="badge bg-light text-secondary border p-1 px-2" style="font-size: 0.75rem;">Banco de Dados</span>
                    </div>
                    <input type="text" name="contexto" class="form-control" placeholder="Separe os requisitos por vírgula" style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <!-- TAMANHO DA EQUIPE -->
                <div class="mb-3">
                    <label class="form-label text-muted small fw-bold">Tamanho da Equipe</label>
                    <input type="text" name="impactoEsperado" class="form-control" placeholder="Ex: 3 a 5 alunos" style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <!-- PRAZO DE ENTREGA -->
                <div class="mb-4">
                    <label class="form-label text-muted small fw-bold">Prazo de Entrega</label>
                    <input type="date" name="prazo" class="form-control" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                </div>

                <!-- BOTÃO DE SUBMIT -->
                <div class="text-end border-top pt-3">
                    <button type="submit" class="btn btn-primary px-5 fw-bold" style="border-radius: var(--radius-md);">
                        Cadastrar Demanda
                    </button>
                </div>

            </form>
        </div>
    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>