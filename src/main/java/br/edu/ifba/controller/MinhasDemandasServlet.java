package br.edu.ifba.controller;

import br.edu.ifba.dao.DemandaDAO;
import br.edu.ifba.model.Demanda;
import br.edu.ifba.model.Usuario;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MinhasDemandasServlet")
public class MinhasDemandasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Recupera a sessão e o usuário que está logado atualmente
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");

        // 2. Proteção de rota: Se não tiver ninguém logado, manda pro login
        if (usuarioLogado == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 3. Instancia o DAO
            DemandaDAO demandaDAO = new DemandaDAO();
            
            // 4. Busca a lista do banco convertendo o ID do usuário para String e joga na variável
            List<Demanda> demandasDoProfessor = demandaDAO.listarPorOrientador(String.valueOf(usuarioLogado.getId()));
            
            // 5. Guarda a lista preenchida no "request" para o JSP ler
            request.setAttribute("minhasDemandas", demandasDoProfessor);

            // 6. Empurra tudo para a tela visual
            request.getRequestDispatcher("minhasDemandas.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // Em caso de erro no banco, manda pra tela com mensagem
            request.setAttribute("mensagemErro", "Erro ao carregar suas demandas.");
            request.getRequestDispatcher("minhasDemandas.jsp").forward(request, response);
        }
    }
}