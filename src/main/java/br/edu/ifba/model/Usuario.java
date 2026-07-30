package br.edu.ifba.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String nome;
    private String email;
    private String senha;
    private String tipo;    // Ex: "ADMIN", "ESTUDANTE"
    private Perfil perfil;  
    private Timestamp dataCriacao;

    // Construtor vazio obrigatório
    public Usuario() {
    }

    // CONSTRUTOR ANTIGO (MANTIDO para não quebrar chamadas antigas com String id)
    public Usuario(String id, String nome, String email, String senha, String tipo) {
        this.setId(id);
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.tipo = tipo;
    }

    // Construtor para cadastro rápido (sem ID/Data)
    public Usuario(String nome, String email, String senha, String tipo) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.tipo = tipo;
    }

    // Getters e Setters flexíveis
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    // Método utilitário para sobrecarga com String
    public void setId(String id) {
        if (id != null && !id.trim().isEmpty()) {
            try {
                this.id = Long.parseLong(id.trim());
            } catch (NumberFormatException e) {
                this.id = null;
            }
        } else {
            this.id = null;
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public Timestamp getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Timestamp dataCriacao) {
        this.dataCriacao = dataCriacao;
    }
}