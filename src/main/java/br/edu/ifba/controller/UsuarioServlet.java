package br.edu.ifba.controller;

import br.edu.ifba.dao.UsuarioDAO;

import br.edu.ifba.model.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                    "Erro ao salvar o usuário no banco de dados: "
                    + e.getMessage(),
                    e
            );
        }
    }
}