package com.example.petstore.repository;

import com.example.petstore.entity.TagEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagRepository extends JpaRepository<TagEntity, Long> {
	@NonNull
	@Query(value = "SELECT tag.id, tag.name FROM tag, pet_tag WHERE tag.id = pet_tag.tag_id AND pet_tag.pet_id = :id", nativeQuery = true)
	List<TagEntity> findTagEntitiesByPetId(@Param("id") @NonNull final Long id);
}
