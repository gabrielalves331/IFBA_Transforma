<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Escolha seu Perfil - IFBA Transforma</title>
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

        /* COLUNA DA ESQUERDA - SELEÇÃO DE PERFIL */
        .left-side {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .profile-container {
            width: 100%;
            max-width: 420px;
        }

        .profile-container h1 {
            font-size: 2.2rem;
            font-weight: bold;
            color: #000000;
            margin-bottom: 10px;
            text-align: left;
        }

        .profile-container p {
            font-size: 1rem;
            color: #666666;
            margin-bottom: 30px;
            text-align: left;
        }

        /* CARDS DE SELEÇÃO */
        .profile-options {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .profile-card {
            display: flex;
            flex-direction: column;
            text-decoration: none;
            padding: 16px 20px;
            border: 2px solid #e5e5e5;
            border-radius: 10px;
            background-color: #ffffff;
            transition: all 0.2s ease-in-out;
        }

        .profile-card:hover {
            border-color: #1a5c38;
            background-color: #f4faf6;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 92, 56, 0.08);
        }

        .profile-title {
            font-size: 1.15rem;
            font-weight: bold;
            color: #1a5c38;
            margin-bottom: 4px;
        }

        .profile-desc {
            font-size: 0.88rem;
            color: #555555;
            line-height: 1.4;
        }

        /* LINK DE VOLTAR */
        .btn-voltar {
            display: inline-block;
            margin-top: 25px;
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
            flex: 1;
            background-color: #1f5c43;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .logo-container {
            text-align: center;
            max-width: 450px;
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

        @media (max-width: 768px) {
            .right-side {
                display: none;
            }
        }
    </style>
</head>
<body>

    <!-- LADO ESQUERDO: SELEÇÃO -->
    <main class="left-side">
        <div class="profile-container">
            <h1>Cadastre-se</h1>
            <p>Selecione o perfil que melhor define você na plataforma:</p>
            
            <div class="profile-options">
                
                <!-- CARD ESTUDANTE CORRIGIDO: Agora aponta exatamente para cadastroEstudante.jsp -->
                <a href="cadastroEstudante.jsp" class="profile-card">
                    <span class="profile-title">Estudante</span>
                    <span class="profile-desc">Quero aplicar meus conhecimentos acadêmicos em projetos e ações de extensão reais.</span>
                </a>

                <!-- CARD PROFESSOR -->
                <a href="cadastroProfessor.jsp" class="profile-card">
                    <span class="profile-title">Professor / Orientador</span>
                    <span class="profile-desc">Quero gerenciar demandas, propor e orientar ações de extensão com las turmas.</span>
                </a>

                <!-- CARD COMUNIDADE/EMPRESA -->
                <a href="cadastroComunidade.jsp" class="profile-card">
                    <span class="profile-title">Comunidade / Organização / Empresa</span>
                    <span class="profile-desc">Quero cadastrar demandas da sociedade e buscar soluções junto ao ecossistema acadêmico.</span>
                </a>

            </div>

            <a href="login.jsp" class="btn-voltar">&larr; Voltar para o Login</a>
        </div>
    </main>

    <!-- LADO DIREITO: LOGOTIPO -->
    <aside class="right-side">
        <div class="logo-container">
            <img src="logoifbaTransforma_semlegenda.png" alt="IFBA Transforma Logo" class="logo-img logo-img-blend">
        </div>
    </aside>

</body>
</html>