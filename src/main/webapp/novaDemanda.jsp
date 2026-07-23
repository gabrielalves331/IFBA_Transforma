<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Demandas - IFBA Transforma</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        /* Estilos específicos da página de cadastro para garantir o layout do Figma */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }

        .content {
            margin-left: 260px;
            padding: 40px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            width: calc(100% - 260px);
        }

        .page-title {
            font-size: 2rem;
            font-weight: bold;
            color: #000000;
            margin-bottom: 25px;
            text-align: center;
        }

        .form-container {
            background-color: #e1e1e1;
            border-radius: 15px;
            padding: 35px 45px;
            width: 100%;
            max-width: 680px;
            box-sizing: border-box;
        }

        .form-label-custom {
            font-size: 0.95rem;
            color: #333333;
            margin-bottom: 4px;
            font-weight: 500;
        }

        .form-control-custom {
            background-color: #d2d2d2;
            border: 1px solid #999999;
            border-radius: 6px;
            padding: 8px 12px;
            color: #000000;
            width: 100%;
        }

        .form-control-custom:focus {
            background-color: #dadada;
            border-color: #1a5c38;
            outline: none;
            box-shadow: none;
        }

        .tag-preview {
            background-color: #005f32;
            color: white;
            padding: 4px 15px;
            border-radius: 20px;
            font-size: 0.85rem;
            display: inline-block;
            margin-right: 8px;
            margin-bottom: 5px;
        }

        /* CONTAINER E ESTILO DO NOVO BOTÃO DE ENVIAR */
        .btn-enviar-container {
            display: flex;
            justify-content: center;
            margin-top: 25px;
        }

        .btn-enviar {
            background-color: #005f32;
            color: white;
            font-weight: bold;
            font-size: 1.1rem;
            border: none;
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            max-width: 300px; /* Deixa o botão centralizado e elegante, sem ocupar a largura inteira de forma exagerada */
            transition: background-color 0.2s, transform 0.1s;
            cursor: pointer;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-enviar:hover {
            background-color: #004423;
            color: white;
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-enviar:active {
            transform: translateY(1px);
        }
    </style>
</head>
<body class="d-flex"> 
    
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        
        <h1 class="page-title">Cadastro de Demandas</h1>

        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger w-100" style="max-width: 680px;" role="alert">
                <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <div class="form-container">
            <form action="CadastrarDemandaServlet" method="POST">
                
                <!-- TÍTULO -->
                <div class="mb-3">
                    <label class="form-label-custom">Título</label>
                    <input type="text" name="titulo" class="form-control form-control-custom" required>
                </div>

                <!-- ÁREA / SETOR -->
                <div class="mb-3">
                    <label class="form-label-custom">Área / Setor</label>
                    <select name="subareaId" class="form-select form-control-custom" required>
                        <option value="" selected disabled hidden></option>
                        <option value="1">Tecnologia da Informação</option>
                        <option value="2">Eletrotécnica / Energia</option>
                        <option value="3">Mecânica / Automação</option>
                        <option value="4">Administração / Negócios</option>
                    </select>
                </div>

                <!-- DESCRIÇÃO -->
                <div class="mb-3">
                    <label class="form-label-custom">Descrição</label>
                    <textarea name="descricao" class="form-control form-control-custom" rows="4" required></textarea>
                </div>

                <!-- REQUISITOS -->
                <div class="mb-3">
                    <label class="form-label-custom">Requisitos</label>
                    <div class="mb-2">
                        <span class="tag-preview" style="background-color: #555;">EX:</span>
                        <span class="tag-preview">Java Web</span>
                        <span class="tag-preview">Banco de Dados</span>
                    </div>
                    <input type="text" name="contexto" class="form-control form-control-custom" placeholder="Separe os requisitos por vírgula">
                </div>

                <!-- TAMANHO DA EQUIPE -->
                <div class="mb-3">
                    <label class="form-label-custom">Tamanho da Equipe</label>
                    <input type="text" name="impactoEsperado" class="form-control form-control-custom" placeholder="Ex: 3 a 5 alunos">
                </div>

                <!-- PRAZO DE ENTREGA -->
                <div class="mb-4">
                    <label class="form-label-custom">Prazo de Entrega</label>
                    <input type="date" name="prazo" class="form-control form-control-custom" required>
                </div>

                <!-- BOTÃO SUBMIT CORRIGIDO -->
                <div class="btn-enviar-container">
                    <button type="submit" class="btn-enviar">Enviar</button>
                </div>

            </form>
        </div>
    </main>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>