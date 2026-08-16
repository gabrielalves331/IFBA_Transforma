<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IFBA Transforma - Conectando a Comunidade ao IFBA</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <!-- NAVBAR PRINCIPAL -->
    <nav class="navbar navbar-expand-lg bg-white shadow-sm border-bottom">
        <div class="container">
            <a class="navbar-brand fw-bold" style="color: var(--color-primary, #195e3d);" href="index.jsp">
                IFBA Transforma
            </a>
            <div class="ms-auto d-flex gap-2">
                <a href="login.jsp" class="btn btn-outline-primary fw-bold">Entrar</a>
                <a href="escolherPerfil.jsp" class="btn btn-primary fw-bold">Cadastre-se</a> 
            </div>
        </div>
    </nav>

    <!-- SEÇÃO HERO -->
    <section class="hero py-5 my-auto">
        <div class="container">
            <div class="row align-items-center g-4">
                <div class="col-lg-6">
                    <h1 class="page-title display-5 fw-bold mb-3" style="font-size: var(--fs-2xl, 2.25rem);">
                        Conectando a comunidade ao IFBA
                    </h1>
                    <p class="subtitulo lead text-secondary mb-4">
                        Transforme problemas reais em projetos acadêmicos.
                        Cadastre demandas, acompanhe projetos e gere impacto social.
                    </p>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="escolha_perfil.jsp" class="btn btn-primary btn-lg px-4 fw-bold">
                            Começar Agora
                        </a>
                        <a href="login.jsp" class="btn btn-outline-secondary btn-lg px-4 fw-bold">
                            Entrar
                        </a>
                    </div>
                </div>

                <div class="col-lg-6 text-center">
                    <img src="logo1.png" alt="Logo IFBA Transforma" class="img-fluid" style="max-width: 500px; filter: drop-shadow(0 10px 20px rgba(0,0,0,0.08));">
                </div>
            </div>
        </div>
    </section>

    <!-- SEÇÃO DE CARDS DE DESTAQUE -->
    <section class="container mb-5">
        <div class="row g-4">
            
            <div class="col-md-4">
                <div class="card-painel h-100 p-4 transition-all" style="border-radius: var(--radius-md, 8px);">
                    <h4 class="fw-bold mb-2" style="color: var(--color-primary, #195e3d); font-size: var(--fs-lg, 1.25rem);">
                        Comunidade
                    </h4>
                    <p class="text-secondary mb-0">
                        Cadastre desafios e necessidades reais da sua região ou organização para buscar apoio técnico.
                    </p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card-painel h-100 p-4 transition-all" style="border-radius: var(--radius-md, 8px);">
                    <h4 class="fw-bold mb-2" style="color: var(--color-primary, #195e3d); font-size: var(--fs-lg, 1.25rem);">
                        Professores
                    </h4>
                    <p class="text-secondary mb-0">
                        Transforme demandas sociais em projetos de Extensão (ACEX) e oriente turmas em soluções práticas.
                    </p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card-painel h-100 p-4 transition-all" style="border-radius: var(--radius-md, 8px);">
                    <h4 class="fw-bold mb-2" style="color: var(--color-primary, #195e3d); font-size: var(--fs-lg, 1.25rem);">
                        Estudantes
                    </h4>
                    <p class="text-secondary mb-0">
                        Aplique na prática os conhecimentos acadêmicos em projetos reais com verdadeiro impacto social.
                    </p>
                </div>
            </div>

        </div>
    </section>

    <!-- RODAPÉ -->
    <footer class="mt-auto py-3 bg-white text-center text-muted border-top small">
        <div class="container">
            IFBA Transforma &copy; 2026 — Todos os direitos reservados.
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>