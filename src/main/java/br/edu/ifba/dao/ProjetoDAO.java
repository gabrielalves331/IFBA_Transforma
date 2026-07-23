package br.edu.ifba.dao;

import java.sql.Connection;
import java.util.ArrayList; // Não esqueça de importar
import java.util.List;      // Não esqueça de importar
import br.edu.ifba.model.Projeto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class ProjetoDAO {

    public Map<Integer, Integer> contarProjetosConcluidosPorAno()
            throws SQLException {

        Map<Integer, Integer> resultado = new LinkedHashMap<>();

        String sql = """
            SELECT YEAR(data_fim) AS ano,
                   COUNT(*) AS quantidade
            FROM projeto
            WHERE status = 'Concluído'
              AND data_fim IS NOT NULL
            GROUP BY YEAR(data_fim)
            ORDER BY ano
        """;

        try (
            Connection conn = ConexaoDB.getConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()
        ) {

            while (rs.next()) {

                resultado.put(
                    rs.getInt("ano"),
                    rs.getInt("quantidade")
                );
            }
        }

        return resultado;
    }
    public List<Projeto> listarTodos() throws SQLException {
        List<Projeto> projetos = new ArrayList<>();
        String sql = "SELECT * FROM projeto"; // Ajuste os nomes das colunas conforme seu banco

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Projeto p = new Projeto();
                p.setId(rs.getInt("id"));
                p.setTitulo(rs.getString("titulo"));
                p.setOrientador(rs.getString("orientador"));
                p.setStatus(rs.getString("status"));
                projetos.add(p);
            }
        }
        return projetos;
    }

    public void excluir(int id) throws SQLException {
        String sql = "DELETE FROM projeto WHERE id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}