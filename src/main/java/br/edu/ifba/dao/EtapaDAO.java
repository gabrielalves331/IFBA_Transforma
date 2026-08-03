package br.edu.ifba.dao;

import br.edu.ifba.model.Etapa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class EtapaDAO {

    // CREATE
    public void salvar(Etapa etapa) throws SQLException {

        String sql =
                "INSERT INTO etapa (id, projeto_id, titulo, descricao, data_inicio, data_fim, status, ordem) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, etapa.getId());
            stmt.setString(2, etapa.getProjetoId());
            stmt.setString(3, etapa.getTitulo());
            stmt.setString(4, etapa.getDescricao());
            stmt.setDate(5, etapa.getDataInicio());
            stmt.setDate(6, etapa.getDataFim());
            stmt.setString(7, etapa.getStatus());
            stmt.setInt(8, etapa.getOrdem());

            stmt.executeUpdate();
        }
    }

    // READ - todas as etapas de um projeto, já em ordem de cronograma
    public List<Etapa> listarPorProjeto(String projetoId) throws SQLException {

        List<Etapa> lista = new ArrayList<>();

        String sql = "SELECT * FROM etapa WHERE projeto_id = ? ORDER BY ordem";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, projetoId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                lista.add(mapearEtapa(rs));
            }
        }

        return lista;
    }

    // READ - por id
    public Etapa buscarPorId(String id) throws SQLException {

        String sql = "SELECT * FROM etapa WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearEtapa(rs);
            }
        }

        return null;
    }

    // UPDATE - útil para marcar a etapa como concluída, por exemplo
    public void atualizarStatus(String id, String novoStatus) throws SQLException {

        String sql = "UPDATE etapa SET status = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, novoStatus);
            stmt.setString(2, id);

            stmt.executeUpdate();
        }
    }

    // DELETE
    public void excluir(String id) throws SQLException {

        String sql = "DELETE FROM etapa WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);
            stmt.executeUpdate();
        }
    }

    // Helper para não repetir o mapeamento de ResultSet -> Etapa
    private Etapa mapearEtapa(ResultSet rs) throws SQLException {

        Etapa e = new Etapa();

        e.setId(rs.getString("id"));
        e.setProjetoId(rs.getString("projeto_id"));
        e.setTitulo(rs.getString("titulo"));
        e.setDescricao(rs.getString("descricao"));
        e.setDataInicio(rs.getDate("data_inicio"));
        e.setDataFim(rs.getDate("data_fim"));
        e.setStatus(rs.getString("status"));
        e.setOrdem(rs.getInt("ordem"));

        return e;
    }
}
