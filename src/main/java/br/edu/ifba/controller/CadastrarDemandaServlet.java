package br.edu.ifba.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifba.dao.DemandaDAO;
import br.edu.ifba.model.Demanda;
import br.edu.ifba.model.Usuario;

@WebServlet("/CadastrarDemandaServlet" )
public class CadastrarDemandaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");

        if (usuarioLogado == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Demanda novaDemanda = new Demanda();
            novaDemanda.setTitulo(request.getParameter("titulo"));
            novaDemanda.setDescricao(request.getParameter("descricao"));
            novaDemanda.setContexto(request.getParameter("contexto"));
            novaDemanda.setImpactoEsperado(request.getParameter("impactoEsperado"));
            novaDemanda.setUsuarioId(usuarioLogado.getId());
            novaDemanda.setStatus("Submetida");

            // Tratamento de Subárea
            String subareaIdStr = request.getParameter("subareaId");
            novaDemanda.setSubareaId(subareaIdStr != null ? Integer.parseInt(subareaIdStr) : 1);

            // Tratamento de Prazo
            String prazoStr = request.getParameter("prazo");
            if (prazoStr != null && !prazoStr.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                novaDemanda.setPrazo(new java.sql.Date(sdf.parse(prazoStr).getTime()));
            }

            DemandaDAO dao = new DemandaDAO();
            if (dao.cadastrar(novaDemanda)) {
                session.setAttribute("mensagemSucesso", "Demanda cadastrada com sucesso!");
                response.sendRedirect("MinhasDemandasServlet");
            } else {
                throw new Exception("Erro ao inserir no banco.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao salvar demanda: " + e.getMessage());
            request.getRequestDispatcher("novaDemanda.jsp").forward(request, response);
        }
    }
}
