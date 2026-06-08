package br.edu.ifba.controller;

import br.edu.ifba.dao.UsuarioDAO;

import br.edu.ifba.model.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        UsuarioDAO dao = new UsuarioDAO();

        try {

            Usuario usuario = dao.autenticar(email, senha);

            if (usuario != null) {

                HttpSession sessao = request.getSession();

                sessao.setAttribute("usuario", usuario);

                switch (usuario.getTipo()) {

                    case "Estudante":
                        response.sendRedirect("dashboardEstudante.jsp");
                        break;

                    case "Professor Orientador":
                        response.sendRedirect("dashboardProfessor.jsp");
                        break;

                    case "Comunidade Externa":
                        response.sendRedirect("dashboardComunidade.jsp");
                        break;

                    case "Administrador":
                        response.sendRedirect("dashboardAdmin.jsp");
                        break;

                    default:
                        response.sendRedirect("index.jsp");
                }

            } else {

                response.sendRedirect("login.jsp?erro=1");

            }

        } catch (Exception e) {

            throw new ServletException(
                    "Erro ao autenticar usuário.",
                    e
            );

        }
    }
}