package com.poly.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Table(name="products")
@Data
public class Product {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="image")
    private String image;

    @Column(name="price")
    private double price;

    @Column(name="quantity")
    private int quantity;
    
    @Column(name="discount")
    private double discount;
    
    @Column(name="description")
    private String description;
    
    @JsonFormat(pattern="dd-MM-yyyy")
    @Column(name="created_date")
    private Date createdDate;
    
    @JsonFormat(pattern="dd-MM-yyyy")
    @Column(name="update_date")
    private Date updateDate;

    @Column(name="deleted")
    private int deleted;
    

    @ManyToOne
    @JoinColumn(name="category_id")
    private Category category;
}
