package com.example.petstore.repository;

import com.example.petstore.entity.PetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PetRepository extends JpaRepository<PetEntity, Long> {
	@NonNull
	Optional<PetEntity> findById(@NonNull final Long id);
}
