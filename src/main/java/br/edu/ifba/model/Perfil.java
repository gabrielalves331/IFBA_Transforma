package br.edu.ifba.model;

import java.io.Serializable;

public class Perfil implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String nome; // Ex: ADMIN, PROFESSOR, ESTUDANTE, COMUNIDADE

    // Construtor vazio
    public Perfil() {
    }

    // Construtor para cadastro/criação
    public Perfil(String nome) {
        this.nome = nome;
    }

    // Construtor completo
    public Perfil(Long id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}