<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard - Comunidade | IFBA Transforma</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f6f8;
        }

        .content {
            margin-left: 260px;
            padding: 40px;
            box-sizing: border-box;
            width: calc(100% - 260px);
        }

        /* CARDS DE METRICAS */
        .card-metric {
            background: white;
            border-radius: 12px;
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .metric-title {
            font-size: 0.9rem;
            color: #666;
            font-weight: bold;
            text-transform: uppercase;
        }

        .metric-value {
            font-size: 1.8rem;
            font-weight: bold;
            color: #222;
            margin-top: 5px;
        }

        /* SEÇÃO DE TABELA / LISTA */
        .data-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 25px;
            margin-top: 30px;
        }

        .btn-verde {
            background-color: #005f32;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            text-decoration: none;
            transition: background-color 0.2s;
        }

        .btn-verde:hover {
            background-color: #004423;
            color: white;
        }

        /* BADGES */
        .badge-status {
            font-size: 0.8rem;
            padding: 5px 10px;
            border-radius: 12px;
            font-weight: bold;
        }
        .status-pendente { background-color: #f8d7da; color: #721c24; }
        .status-andamento { background-color: #fff3cd; color: #856404; }
        .status-concluido { background-color: #d4edda; color: #155724; }
    </style>
</head>
<body class="d-flex">

    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        
        <!-- CABEÇALHO -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1 class="fw-bold m-0" style="font-size: 2rem;">Painel da Empresa / Comunidade</h1>
                <p class="text-muted m-0">Acompanhe o andamento das soluções tecnológicas solicitadas ao IFBA.</p>
            </div>
            <a href="novaDemanda.jsp" class="btn-verde">+ Nova Demanda</a>
        </div>

        <!-- LINHA DE METRICAS (Simuladas no front por enquanto) -->
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card-metric" style="border-left: 5px solid #721c24;">
                    <span class="metric-title">Demandas Analisando</span>
                    <span class="metric-value">2</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-metric" style="border-left: 5px solid #856404;">
                    <span class="metric-title">Em Desenvolvimento</span>
                    <span class="metric-value">1</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-metric" style="border-left: 5px solid #155724;">
                    <span class="metric-title">Projetos Concluídos</span>
                    <span class="metric-value">4</span>
                </div>
            </div>
        </div>

        <!-- SEÇÃO DE ANÁLISE / ÚLTIMOS ENVIOS -->
        <div class="data-section">
            <h3 class="fw-bold mb-3" style="font-size: 1.3rem; color: #333;">Suas Solicitações Recentes</h3>
            
            <div class="table-responsive">
                <table class="table table-hover align-middle m-0">
                    <thead class="table-light">
                        <tr>
                            <th>Título da Demanda</th>
                            <th>Área</th>
                            <th>Data de Envio</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Linhas estáticas para você ver o layout no figma/navegador -->
                        <tr>
                            <td class="fw-bold">Aplicativo de Controle de Estoque Comercial</td>
                            <td>Tecnologia da Informação</td>
                            <td>15/07/2026</td>
                            <td><span class="badge-status status-pendente">Aguardando Orientador</span></td>
                        </tr>
                        <tr>
                            <td class="fw-bold">Automação de Painel Solar Residencial</td>
                            <td>Eletrotécnica / Energia</td>
                            <td>02/06/2026</td>
                            <td><span class="badge-status status-andamento">Em Desenvolvimento</span></td>
                        </tr>
                        <tr>
                            <td class="fw-bold">Consultoria de Processos Administrativos</td>
                            <td>Administração / Negócios</td>
                            <td>10/04/2026</td>
                            <td><span class="badge-status status-concluido">Concluído</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </main>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>