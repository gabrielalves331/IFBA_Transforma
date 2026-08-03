package br.edu.ifba.model;

import java.sql.Timestamp;

public class Anexo {

    private String id;
    private String projetoId;
    private String nomeArquivo;
    private String caminhoArquivo;
    private String tipoArquivo;
    private Timestamp dataUpload;


    public Anexo() {
    }

    public Anexo(String id,
                  String projetoId,
                  String nomeArquivo,
                  String caminhoArquivo,
                  String tipoArquivo) {

        this.id = id;
        this.projetoId = projetoId;
        this.nomeArquivo = nomeArquivo;
        this.caminhoArquivo = caminhoArquivo;
        this.tipoArquivo = tipoArquivo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjetoId() {
        return projetoId;
    }

    public void setProjetoId(String projetoId) {
        this.projetoId = projetoId;
    }

    public String getNomeArquivo() {
        return nomeArquivo;
    }

    public void setNomeArquivo(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

    public String getCaminhoArquivo() {
        return caminhoArquivo;
    }

    public void setCaminhoArquivo(String caminhoArquivo) {
        this.caminhoArquivo = caminhoArquivo;
    }

    public String getTipoArquivo() {
        return tipoArquivo;
    }

    public void setTipoArquivo(String tipoArquivo) {
        this.tipoArquivo = tipoArquivo;
    }

    public Timestamp getDataUpload() {
        return dataUpload;
    }

    public void setDataUpload(Timestamp dataUpload) {
        this.dataUpload = dataUpload;
    }
}

