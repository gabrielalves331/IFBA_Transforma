package br.edu.ifba.controller;

import br.edu.ifba.dao.UsuarioDAO;
import br.edu.ifba.model.Usuario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String tipo = request.getParameter("tipo");

        Usuario usuario = new Usuario(
                id,
                nome,
                email,
                senha,
                tipo
        );

        UsuarioDAO dao = new UsuarioDAO();

        try {
            dao.salvar(usuario);
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            throw new ServletException(
                    "Erro ao salvar o usuário no banco de dados: " + e.getMessage(), e
            );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            
        // 1. Pega a sessão atual do usuário
        HttpSession session = request.getSession(false);
        
        // CORREÇÃO: Busca pelo atributo "usuario" exatamente como foi salvo no LoginServlet
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Recupera o objeto do usuário guardado na sessão
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String tipoUsuario = usuario.getTipo();

        // 3. Roteamento baseado no tipo de usuário
        String paginaDestino = "login.jsp";

        // CORREÇÃO: Evita NullPointerException e cobre as variações de nomenclatura de perfis
        if (tipoUsuario != null) {
            switch (tipoUsuario) {
                case "Admin":
                case "Administrador":
                    paginaDestino = "dashboardAdmin.jsp"; // CORREÇÃO: Usando CamelCase
                    break;
                    
                case "Estudante":
                    paginaDestino = "dashboardEstudante.jsp"; // CORREÇÃO: Usando CamelCase
                    break;
                    
                case "Professor":
                case "Professor Orientador":
                    paginaDestino = "dashboardProfessor.jsp"; // CORREÇÃO: Usando CamelCase
                    break;
                    
                case "Comunidade Interna":
                case "Comunidade Externa":
                    // Mantido o nome original caso não tenha sido atualizado no seu projeto
                    paginaDestino = "dashboard_demandante.jsp"; 
                    break;
                    
                default:
                    paginaDestino = "login.jsp";
                    break;
            }
        }

        // 4. Redireciona internamente para a página correspondente
        RequestDispatcher dispatcher = request.getRequestDispatcher(paginaDestino);
        dispatcher.forward(request, response);
    }
}