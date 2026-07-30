package br.edu.ifba.dao;

import br.edu.ifba.model.Perfil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PerfilDAO {

    public boolean cadastrar(Perfil perfil) {
        String sql = "INSERT INTO perfil (nome) VALUES (?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, perfil.getNome());
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Perfil buscarPorId(Long id) {
        String sql = "SELECT * FROM perfil WHERE id = ?";
        Perfil perfil = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    perfil = new Perfil();
                    perfil.setId(rs.getLong("id"));
                    perfil.setNome(rs.getString("nome"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return perfil;
    }

    public List<Perfil> listarTodos() {
        List<Perfil> perfis = new ArrayList<>();
        String sql = "SELECT * FROM perfil ORDER BY id";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Perfil p = new Perfil();
                p.setId(rs.getLong("id"));
                p.setNome(rs.getString("nome"));
                perfis.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return perfis;
    }

    public boolean atualizar(Perfil perfil) {
        String sql = "UPDATE perfil SET nome = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, perfil.getNome());
            stmt.setLong(2, perfil.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean excluir(Long id) {
        String sql = "DELETE FROM perfil WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}