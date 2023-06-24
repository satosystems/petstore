package com.example.petstore.entity;

import jakarta.persistence.Column;
import lombok.Data;

import java.io.Serializable;

@Data
public class PhotoUrlEntityKey implements Serializable {
	@Column(name = "pet_id", nullable = false, updatable = false)
	private Long petId;

	@Column(name = "url", nullable = false, length = 2048)
	private String url;
}
