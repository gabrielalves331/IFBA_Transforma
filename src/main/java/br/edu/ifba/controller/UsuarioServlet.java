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

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"} )
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        UsuarioDAO dao = new UsuarioDAO();

        try {
            // AÇÃO DE EXCLUIR
            if ("excluir".equalsIgnoreCase(acao) && id != null) {
                dao.excluir(id);
                response.sendRedirect("AdminServlet"); // Volta para o dashboard atualizado
            } else {
                response.sendRedirect("AdminServlet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminServlet?erro=Erro ao excluir usuario");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        UsuarioDAO dao = new UsuarioDAO();
        
        String acao = request.getParameter("acao"); // Para diferenciar Criar de Editar
        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String tipo = request.getParameter("tipo");

        Usuario usuario = new Usuario(id, nome, email, senha, tipo);

        try {
            if ("editar".equalsIgnoreCase(acao)) {
                // AÇÃO DE ATUALIZAR
                dao.atualizar(usuario);
            } else {
                // AÇÃO DE CADASTRAR (PADRÃO)
                dao.salvar(usuario);
            }
            
            // Após a operação, volta para o Dashboard do Admin
            response.sendRedirect("AdminServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao processar usuário: " + e.getMessage());
            request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
        }
    }
}
