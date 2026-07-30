package br.edu.ifba.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProjetoParticipante implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private Projeto projeto;     // Referência ao Model Projeto
    private Usuario usuario;     // Referência ao Model Usuario
    private String papel;        // Ex: "ORIENTADOR", "BOLSISTA", "VOLUNTARIO"
    private Timestamp dataEntrada;

    // Construtor vazio
    public ProjetoParticipante() {
    }

    // Construtor sem ID
    public ProjetoParticipante(Projeto projeto, Usuario usuario, String papel) {
        this.projeto = projeto;
        this.usuario = usuario;
        this.papel = papel;
    }

    // Construtor completo
    public ProjetoParticipante(Long id, Projeto projeto, Usuario usuario, String papel, Timestamp dataEntrada) {
        this.id = id;
        this.projeto = projeto;
        this.usuario = usuario;
        this.papel = papel;
        this.dataEntrada = dataEntrada;
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Projeto getProjeto() {
        return projeto;
    }

    public void setProjeto(Projeto projeto) {
        this.projeto = projeto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }

    public Timestamp getDataEntrada() {
        return dataEntrada;
    }

    public void setDataEntrada(Timestamp dataEntrada) {
        this.dataEntrada = dataEntrada;
    }
}