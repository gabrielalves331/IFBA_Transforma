package br.edu.ifba.dao;

import br.edu.ifba.model.Perfil;
import br.edu.ifba.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UsuarioDAO {

    // Método exigido pelo UsuarioServlet
    public boolean salvar(Usuario usuario) {
        if (usuario.getId() != null && usuario.getId() > 0) {
            return atualizar(usuario);
        } else {
            return cadastrar(usuario);
        }
    }

    public boolean cadastrar(Usuario usuario) {
        String sql = "INSERT INTO usuario (nome, email, senha, tipo, perfil_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setString(4, usuario.getTipo());

            if (usuario.getPerfil() != null && usuario.getPerfil().getId() != null) {
                stmt.setLong(5, usuario.getPerfil().getId());
            } else {
                stmt.setNull(5, java.sql.Types.BIGINT);
            }

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Usuario autenticar(String email, String senha) {
        String sql = "SELECT u.*, p.nome as nome_perfil FROM usuario u " +
                     "LEFT JOIN perfil p ON u.perfil_id = p.id " +
                     "WHERE u.email = ? AND u.senha = ?";
        Usuario usuario = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = montarUsuario(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Usuario buscarPorId(Long id) {
        if (id == null) return null;
        String sql = "SELECT u.*, p.nome as nome_perfil FROM usuario u " +
                     "LEFT JOIN perfil p ON u.perfil_id = p.id WHERE u.id = ?";
        Usuario usuario = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = montarUsuario(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Usuario buscarPorId(String id) {
        if (id == null || id.trim().isEmpty()) return null;
        try {
            return buscarPorId(Long.parseLong(id.trim()));
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public List<Usuario> listarTodos() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT u.*, p.nome as nome_perfil FROM usuario u " +
                     "LEFT JOIN perfil p ON u.perfil_id = p.id ORDER BY u.nome";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                usuarios.add(montarUsuario(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    // Método exigido pelo AdminServlet
    public Map<String, Integer> contarUsuariosPorTipo() {
        Map<String, Integer> resumo = new HashMap<>();
        String sql = "SELECT tipo, COUNT(*) as total FROM usuario GROUP BY tipo";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                resumo.put(rs.getString("tipo"), rs.getInt("total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resumo;
    }

    public boolean atualizar(Usuario usuario) {
        String sql = "UPDATE usuario SET nome = ?, email = ?, tipo = ?, perfil_id = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getTipo());

            if (usuario.getPerfil() != null && usuario.getPerfil().getId() != null) {
                stmt.setLong(4, usuario.getPerfil().getId());
            } else {
                stmt.setNull(4, java.sql.Types.BIGINT);
            }

            stmt.setLong(5, usuario.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean excluir(Long id) {
        if (id == null) return false;
        String sql = "DELETE FROM usuario WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean excluir(String id) {
        if (id == null || id.trim().isEmpty()) return false;
        try {
            return excluir(Long.parseLong(id.trim()));
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private Usuario montarUsuario(ResultSet rs) throws SQLException {
        Usuario u = new Usuario();
        u.setId(rs.getLong("id"));
        u.setNome(rs.getString("nome"));
        u.setEmail(rs.getString("email"));
        u.setSenha(rs.getString("senha"));
        u.setTipo(rs.getString("tipo"));
        u.setDataCriacao(rs.getTimestamp("data_criacao"));

        if (rs.getObject("perfil_id") != null) {
            Perfil p = new Perfil();
            p.setId(rs.getLong("perfil_id"));
            p.setNome(rs.getString("nome_perfil"));
            u.setPerfil(p);
        }
        return u;
    }
}