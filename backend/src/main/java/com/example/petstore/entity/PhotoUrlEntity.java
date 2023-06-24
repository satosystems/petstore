package com.example.petstore.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Builder
@Data
@Entity
@NoArgsConstructor
@Table(name = "photo_url")
@IdClass(PhotoUrlEntityKey.class)
public class PhotoUrlEntity {
	@Id
	@Column(name = "pet_id", nullable = false, updatable = false)
	private Long petId;

	@Id
	@Column(name = "url", nullable = false, length = 2048)
	private String url;

	@Override
	public String toString() {
		return super.toString();
	}
}
