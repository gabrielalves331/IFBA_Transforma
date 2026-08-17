package br.edu.ifba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifba.model.Perfil;

public class PerfilDAO {

    public boolean salvarOuAtualizar(Perfil perfil) {
        String sql = "INSERT INTO perfil (usuario_id, organizacao, contato, localidade, curso, semestre, curriculo_path, area_atuacao, disciplinas) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE organizacao=?, contato=?, localidade=?, curso=?, semestre=?, curriculo_path=?, area_atuacao=?, disciplinas=?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Parâmetros do INSERT (1 ao 9)
            stmt.setString(1, perfil.getUsuarioId());
            stmt.setString(2, perfil.getOrganizacao());
            stmt.setString(3, perfil.getContato());
            stmt.setString(4, perfil.getLocalidade());
            stmt.setString(5, perfil.getCurso());

            if (perfil.getSemestre() != null) {
                stmt.setInt(6, perfil.getSemestre());
            } else {
                stmt.setNull(6, java.sql.Types.INTEGER);
            }

            stmt.setString(7, perfil.getCurriculoPath());
            stmt.setString(8, perfil.getAreaAtuacao());
            stmt.setString(9, perfil.getDisciplinas());

            // Parâmetros para o ON DUPLICATE KEY UPDATE (10 ao 17)
            stmt.setString(10, perfil.getOrganizacao());
            stmt.setString(11, perfil.getContato());
            stmt.setString(12, perfil.getLocalidade());
            stmt.setString(13, perfil.getCurso());

            if (perfil.getSemestre() != null) {
                stmt.setInt(14, perfil.getSemestre());
            } else {
                stmt.setNull(14, java.sql.Types.INTEGER);
            }

            stmt.setString(15, perfil.getCurriculoPath());
            stmt.setString(16, perfil.getAreaAtuacao());
            stmt.setString(17, perfil.getDisciplinas());

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao salvar ou atualizar o perfil no banco de dados: " + e.getMessage(), e);
        }
    }

    // Método necessário para o PerfilServlet funcionar
    public List<Perfil> listarTodos() {
        String sql = "SELECT * FROM perfil";
        List<Perfil> perfis = new ArrayList<>();

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Perfil perfil = new Perfil();
                perfil.setId(rs.getLong("id"));
                perfil.setUsuarioId(rs.getString("usuario_id"));
                perfil.setOrganizacao(rs.getString("organizacao"));
                perfil.setContato(rs.getString("contato"));
                perfil.setLocalidade(rs.getString("localidade"));
                perfil.setCurso(rs.getString("curso"));

                int semestre = rs.getInt("semestre");
                if (!rs.wasNull()) {
                    perfil.setSemestre(semestre);
                }

                perfil.setCurriculoPath(rs.getString("curriculo_path"));
                perfil.setAreaAtuacao(rs.getString("area_atuacao"));
                perfil.setDisciplinas(rs.getString("disciplinas"));

                perfis.add(perfil);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao listar perfis: " + e.getMessage(), e);
        }

        return perfis;
    }
}