<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Comunidade | IFBA Transforma</title>
    
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
        
        <!-- CABEÇALHO -->
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
            <div>
                <h1 class="page-title">Painel da Comunidade</h1>
                <p class="subtitulo">Acompanhe o andamento das soluções tecnológicas solicitadas ao IFBA.</p>
            </div>
            <a href="novaDemanda.jsp" class="btn btn-primary">+ Nova Demanda</a>
        </div>

        <!-- CARDS DE MÉTIRCAS (Usa .dashboard-grid do seu CSS) -->
        <div class="dashboard-grid mb-4">
            
            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Demandas em Análise</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-warning);">2</h2>
                <span class="badge-status pendente mt-2">Aguardando Orientador</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Em Desenvolvimento</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-info);">1</h2>
                <span class="badge-status andamento mt-2">Projeto em execução</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Projetos Concluídos</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-primary);">4</h2>
                <span class="badge-status concluido mt-2">Finalizados com sucesso</span>
            </div>

        </div>

        <!-- TABELA DE SOLICITAÇÕES RECENTES -->
        <div class="card-painel">
            <h2 style="font-size: var(--fs-lg); font-weight: var(--fw-bold);" class="mb-3">Suas Solicitações Recentes</h2>
            
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th style="border-top-left-radius: 8px;">Título da Demanda</th>
                            <th>Área</th>
                            <th>Data de Envio</th>
                            <th style="border-top-right-radius: 8px;">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold text-dark">Aplicativo de Controle de Estoque Comercial</td>
                            <td class="text-secondary">Tecnologia da Informação</td>
                            <td class="text-muted">15/07/2026</td>
                            <td><span class="badge-status pendente">Aguardando Orientador</span></td>
                        </tr>
                        <tr>
                            <td class="fw-bold text-dark">Automação de Painel Solar Residencial</td>
                            <td class="text-secondary">Eletrotécnica / Energia</td>
                            <td class="text-muted">02/06/2026</td>
                            <td><span class="badge-status andamento">Em Desenvolvimento</span></td>
                        </tr>
                        <tr>
                            <td class="fw-bold text-dark">Consultoria de Processos Administrativos</td>
                            <td class="text-secondary">Administração / Negócios</td>
                            <td class="text-muted">10/04/2026</td>
                            <td><span class="badge-status concluido">Concluído</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </main>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>