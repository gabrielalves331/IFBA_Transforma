<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro da Comunidade - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        body {
            display: flex;
            height: 100vh;
            width: 100vw;
            overflow: hidden;
            background-color: #ffffff;
        }
        /* COLUNA DA ESQUERDA - FORMULÁRIO AMPLO */
        .left-side {
            flex: 1.2;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            overflow-y: auto;
        }
        .form-container {
            width: 100%;
            max-width: 650px;
            background-color: #f8f9fa;
            padding: 35px 45px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        .form-container h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #1a5c38;
            margin-bottom: 8px;
            letter-spacing: 0.5px;
        }
        .form-container p {
            font-size: 1rem;
            color: #666666;
            margin-bottom: 25px;
            letter-spacing: 0.2px;
        }
        .form-label {
            font-weight: 600;
            color: #444444;
            font-size: 0.95rem;
            letter-spacing: 0.3px;
        }
        .form-control, .form-select {
            border: 2px solid #e5e5e5;
            border-radius: 8px;
            padding: 10px 12px;
            font-size: 1rem;
            transition: all 0.2s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #1a5c38;
            box-shadow: 0 0 0 0.25rem rgba(26, 92, 56, 0.1);
        }
        .btn-cadastrar {
            background-color: #1a5c38;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 1.05rem;
            font-weight: bold;
            border-radius: 8px;
            letter-spacing: 0.5px;
            transition: background 0.2s;
            width: 100%;
        }
        .btn-cadastrar:hover {
            background-color: #13472a;
            color: white;
        }
        .btn-voltar {
            color: #666666;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.2s;
        }
        .btn-voltar:hover {
            color: #1a5c38;
        }
        /* COLUNA DA DIREITA - BANNER VERDE */
        .right-side {
            flex: 0.8;
            background-color: #1f5c43;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }
        .logo-container {
            text-align: center;
            max-width: 380px;
            width: 100%;
        }
        .logo-img {
            width: 100%;
            height: auto;
            object-fit: contain;
        }
        .logo-img-blend {
            mix-blend-mode: screen;
        }
        @media (max-width: 992px) {
            .right-side {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- LADO ESQUERDO: FORMULÁRIO DE CADASTRO -->
    <main class="left-side">
        <div class="form-container">
            <h1>Cadastro da Comunidade</h1>
            <p>Cadastre sua associação, ONG ou projeto para enviar demandas reais à nossa instituição.</p>

            <form action="UsuarioServlet" method="POST">
                <!-- Define o tipo de usuário no backend -->
                <input type="hidden" name="tipo" value="Comunidade">

                <!-- SEÇÃO 1: DADOS GERAIS -->
                <div class="row g-3 mb-4">
                    <div class="col-md-12">
                        <label for="nome" class="form-label">Nome do Representante ou Organização</label>
                        <input type="text" id="nome" name="nome" class="form-control" placeholder="Ex: Associação de Moradores do Bairro X" required>
                    </div>
                    <div class="col-md-6">
                        <label for="id" class="form-label">CPF ou CNPJ</label>
                        <input type="text" id="id" name="id" class="form-control" placeholder="Apenas números" required>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">E-mail de Contato</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="contato@email.com" required>
                    </div>
                </div>

                <!-- SEÇÃO 2: LOCALIDADE E CONTATO (Opcional, mas útil para o contexto) -->
                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label for="telefone" class="form-label">Telefone / WhatsApp</label>
                        <input type="text" id="telefone" name="telefone" class="form-control" placeholder="(00) 00000-0000">
                    </div>
                    <div class="col-md-6">
                        <label for="bairro" class="form-label">Bairro / Localidade</label>
                        <input type="text" id="bairro" name="bairro" class="form-control" placeholder="Região de atuação">
                    </div>
                </div>

                <!-- SEÇÃO 3: SEGURANÇA -->
                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label for="senha" class="form-label">Senha de Acesso</label>
                        <input type="password" id="senha" name="senha" class="form-control" placeholder="Crie uma senha forte" required>
                    </div>
                    <div class="col-md-6">
                        <label for="confirmarSenha" class="form-label">Confirmar Senha</label>
                        <input type="password" id="confirmarSenha" class="form-control" placeholder="Repita a senha" required>
                    </div>
                </div>

                <!-- AÇÕES -->
                <div class="d-flex flex-column align-items-center gap-3 mt-4">
                    <button type="submit" class="btn btn-cadastrar">Finalizar Meu Cadastro</button>
                    <a href="escolha_perfil.jsp" class="btn-voltar">&larr; Voltar para Escolha de Perfil</a>
                </div>
            </form>
        </div>
    </main>

    <!-- LADO DIREITO: LOGOTIPO -->
    <aside class="right-side">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/logoifbaTransforma_semlegenda.png" alt="IFBA Transforma Logo" class="logo-img logo-img-blend">
        </div>
    </aside>
</body>
</html>