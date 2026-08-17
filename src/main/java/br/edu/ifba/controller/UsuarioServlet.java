package br.edu.ifba.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifba.dao.PerfilDAO;
import br.edu.ifba.dao.UsuarioDAO;
import br.edu.ifba.model.Perfil;
import br.edu.ifba.model.Usuario;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        UsuarioDAO dao = new UsuarioDAO();

        try {
            // Validação mais segura para evitar exclusões acidentais com ID nulo/vazio
            if ("excluir".equalsIgnoreCase(acao) && id != null && !id.isEmpty()) {
                dao.excluir(id);
            }
            response.sendRedirect("AdminServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminServlet?erro=Erro ao processar acao");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        PerfilDAO perfilDAO = new PerfilDAO();

        String id = request.getParameter("id"); // CPF ou Matrícula
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String tipo = request.getParameter("tipo");

        // Garante que o tipo bata com o ENUM do banco
        if (tipo == null) {
			tipo = "Estudante";
		}

        Usuario usuario = new Usuario(id, nome, email, senha, tipo);

        try {
            if (usuarioDAO.salvar(usuario)) {
                Perfil perfil = new Perfil();
                perfil.setUsuarioId(id);
                perfil.setCurso(request.getParameter("curso"));
                perfil.setOrganizacao(request.getParameter("organizacao"));
                perfil.setLocalidade(request.getParameter("bairro"));

                String semestre = request.getParameter("semestre");
                if (semestre != null && !semestre.isEmpty()) {
                    perfil.setSemestre(Integer.parseInt(semestre));
                }

                perfilDAO.salvarOuAtualizar(perfil);
                response.sendRedirect("login.jsp?sucesso=1");
            }
        } catch (Exception e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        }
    }
}