package com.example.petstore.repository;

import com.example.petstore.entity.PhotoUrlEntity;
import com.example.petstore.entity.PhotoUrlEntityKey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhotoUrlRepository extends JpaRepository<PhotoUrlEntity, PhotoUrlEntityKey> {
	@NonNull
	List<PhotoUrlEntity> findByPetId(@NonNull final Long petId);
}
