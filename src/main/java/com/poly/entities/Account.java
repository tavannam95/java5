package com.poly.entities;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "username")
    private String username;
    
    @Column(name = "password")
    private String password;

    @Column(name = "fullname")
    private String fullname;

    @Column(name = "email")
    private String email;

    @Column(name = "photo")
    private String photo;
    
    @Column(name = "address")
    private String address;

    @Column(name = "activated")
    private int activated;

    @Column(name = "admin")
    private int admin;

}
