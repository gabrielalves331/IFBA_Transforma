package br.edu.ifba.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifba.dao.UsuarioDAO; // Importação do DAO adicionada!
import br.edu.ifba.model.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try {
            // AGORA SIM: Chamando o banco de dados para validar o usuário
            UsuarioDAO dao = new UsuarioDAO();

            // ATENÇÃO: Verifique se o método no seu DAO se chama "autenticar" mesmo!
            Usuario usuarioLogado = dao.autenticar(email, senha);

            if (usuarioLogado != null) {

                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuarioLogado);

                String tipoUsuario = usuarioLogado.getTipo();

                // Redirecionamento correto usando o AdminServlet
                if (tipoUsuario.equalsIgnoreCase("Administrador") || tipoUsuario.equalsIgnoreCase("Admin")) {
                    response.sendRedirect(request.getContextPath() + "/AdminServlet");

                } else if (tipoUsuario.equalsIgnoreCase("Professor Orientador") || tipoUsuario.equalsIgnoreCase("Professor")) {
                    response.sendRedirect("dashboardProfessor.jsp");

                } else if (tipoUsuario.toLowerCase().contains("comunidade") || tipoUsuario.equalsIgnoreCase("empresa")) {
                    response.sendRedirect("dashboardComunidade.jsp");

                } else {
                    response.sendRedirect("dashboardEstudante.jsp");
                }

            } else {
                request.setAttribute("mensagemErro", "E-mail ou senha incorretos!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro interno no servidor. Tente novamente mais tarde.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}