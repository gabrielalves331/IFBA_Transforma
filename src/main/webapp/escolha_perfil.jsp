<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Escolha seu Perfil - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="auth-container">

    <!-- LADO ESQUERDO: SELEÇÃO DE PERFIL -->
    <main class="left-side d-flex align-items-center justify-content-center p-4" style="flex: 1; height: 100vh; overflow-y: auto;">
        <div class="profile-container w-100" style="max-width: 480px;">
            <h1 class="page-title mb-2" style="font-size: var(--fs-xl);">Cadastre-se</h1>
            <p class="subtitulo mb-4">Selecione o perfil que melhor define você na plataforma:</p>
            
            <div class="profile-options d-flex flex-column gap-3 mb-4">
                
                <!-- CARD ESTUDANTE -->
                <a href="cadastroEstudante.jsp" class="profile-card p-3 text-decoration-none d-block rounded shadow-sm border transition-all" style="border-color: var(--color-border); background-color: var(--color-surface);">
                    <span class="profile-title d-block fw-bold text-dark mb-1" style="font-size: var(--fs-md);">Estudante</span>
                    <span class="profile-desc d-block text-secondary small">Quero aplicar meus conhecimentos acadêmicos em projetos e ações de extensão reais.</span>
                </a>

                <!-- CARD PROFESSOR -->
                <a href="cadastroProfessor.jsp" class="profile-card p-3 text-decoration-none d-block rounded shadow-sm border transition-all" style="border-color: var(--color-border); background-color: var(--color-surface);">
                    <span class="profile-title d-block fw-bold text-dark mb-1" style="font-size: var(--fs-md);">Professor / Orientador</span>
                    <span class="profile-desc d-block text-secondary small">Quero gerenciar demandas, propor e orientar ações de extensão com as turmas.</span>
                </a>

                <!-- CARD COMUNIDADE/EMPRESA -->
                <a href="cadastroComunidade.jsp" class="profile-card p-3 text-decoration-none d-block rounded shadow-sm border transition-all" style="border-color: var(--color-border); background-color: var(--color-surface);">
                    <span class="profile-title d-block fw-bold text-dark mb-1" style="font-size: var(--fs-md);">Comunidade / Organização / Empresa</span>
                    <span class="profile-desc d-block text-secondary small">Quero cadastrar demandas da sociedade e buscar soluções junto ao ecossistema acadêmico.</span>
                </a>

            </div>

            <!-- BOTÃO VOLTAR -->
            <div>
                <a href="login.jsp" class="btn btn-outline-secondary btn-sm px-3 fw-bold">&larr; Voltar para o Login</a>
            </div>
        </div>
    </main>

     <!-- LADO DIREITO: LOGOTIPO -->
        <div class="auth-brand-side">
            <div class="logo-container">
                <img src="logo_semlegenda.png" alt="Logo IFBA Transforma" class="logo-img">
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>