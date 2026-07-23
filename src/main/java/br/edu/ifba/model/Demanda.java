package br.edu.ifba.model;

import java.sql.Date;

public class Demanda {

    private int id;
    private String usuarioId;
    private int subareaId;
    private String titulo;
    private String descricao;
    private String contexto;
    private String justificativa;
    private String impactoEsperado;
    private Date prazo;
    private String localidade;
    private String status;
    private String tipoCriador;
    private String descDemandante;
    private String orientadorId; // ADICIONADO AQUI

    public String getOrientadorId() {
        return orientadorId;
    }

    public void setOrientadorId(String orientadorId) {
        this.orientadorId = orientadorId;
    }

    public String getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(String usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getDescDemandante() {
        return descDemandante;
    }

    public void setDescDemandante(String descDemandante) {
        this.descDemandante = descDemandante;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}