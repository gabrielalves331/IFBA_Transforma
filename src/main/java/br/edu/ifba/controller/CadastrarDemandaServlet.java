package br.edu.ifba.controller;


import br.edu.ifba.dao.DemandaDAO;
import br.edu.ifba.model.Demanda;
import br.edu.ifba.model.Usuario;
import java.io.IOException;

// TROCADOS DE JAKARTA PARA JAVAX:
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CadastrarDemandaServlet")
public class CadastrarDemandaServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
        
        if (usuarioLogado == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        
        Demanda novaDemanda = new Demanda();
        novaDemanda.setTitulo(titulo);
        novaDemanda.setDescricao(descricao);
        
        // Regra de negócio baseada no tipo de perfil
        if (usuarioLogado.getTipo().equalsIgnoreCase("Professor Orientador") || 
            usuarioLogado.getTipo().equalsIgnoreCase("Professor")) {
            
            novaDemanda.setStatus("Em Andamento");
            novaDemanda.setDescDemandante("Cadastrado pelo Professor: " + usuarioLogado.getNome());
            novaDemanda.setOrientadorId(usuarioLogado.getId()); // Autovincula o professor
            
        } else {
            // Se for Empresa / Comunidade
            novaDemanda.setStatus("Pendente");
            novaDemanda.setDescDemandante(usuarioLogado.getNome());
            novaDemanda.setOrientadorId(null);
        }
        
        DemandaDAO dao = new DemandaDAO();
        boolean sucesso = dao.cadastrar(novaDemanda);
        
        if (sucesso) {
            response.sendRedirect("MinhasDemandasServlet");
        } else {
            request.setAttribute("erro", "Erro ao salvar a demanda no banco de dados.");
            request.getRequestDispatcher("novaDemanda.jsp").forward(request, response);
        }
    }
}