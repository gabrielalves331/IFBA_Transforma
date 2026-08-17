package br.edu.ifba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifba.model.Anexo;

public class AnexoDAO {

	public void salvar(Anexo anexo) throws SQLException {
	    // Removido o campo 'id' pois é AUTO_INCREMENT no banco
	    String sql = "INSERT INTO anexo (projeto_id, nome_arquivo, caminho, tipo) VALUES (?, ?, ?, ?)";

	    try (Connection conn = ConexaoDB.getConexao();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, anexo.getProjetoId());
	        stmt.setString(2, anexo.getNomeArquivo());
	        stmt.setString(3, anexo.getCaminho());
	        stmt.setString(4, anexo.getTipoArquivo());
	        stmt.executeUpdate();
	    }
	}

    // READ - todos os anexos de um projeto
    public List<Anexo> listarPorProjeto(String projetoId) throws SQLException {

        List<Anexo> lista = new ArrayList<>();

        String sql = "SELECT * FROM anexo WHERE projeto_id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, projetoId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                lista.add(mapearAnexo(rs));
            }
        }

        return lista;
    }

    // READ - por id
    public Anexo buscarPorId(String id) throws SQLException {

        String sql = "SELECT * FROM anexo WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearAnexo(rs);
            }
        }

        return null;
    }

    // DELETE
    public void excluir(String id) throws SQLException {

        String sql = "DELETE FROM anexo WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);
            stmt.executeUpdate();
        }
    }

    // Helper para não repetir o mapeamento de ResultSet -> Anexo
    private Anexo mapearAnexo(ResultSet rs) throws SQLException {

        Anexo a = new Anexo();

        a.setId(rs.getString("id"));
        a.setProjetoId(rs.getString("projeto_id"));
        a.setNomeArquivo(rs.getString("nome_arquivo"));
        a.setCaminho(rs.getString("caminho_arquivo"));
        a.setTipoArquivo(rs.getString("tipo_arquivo"));
        a.setDataUpload(rs.getTimestamp("data_upload"));

        return a;
    }
}

