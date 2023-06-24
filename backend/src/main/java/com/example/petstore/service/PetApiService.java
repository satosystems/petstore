package com.example.petstore.service;

import com.example.petstore.entity.PetEntity;
import com.example.petstore.entity.PhotoUrlEntity;
import com.example.petstore.openapi.model.Category;
import com.example.petstore.openapi.model.Pet;
import com.example.petstore.openapi.model.Tag;
import com.example.petstore.repository.PetRepository;
import com.example.petstore.repository.PhotoUrlRepository;
import com.example.petstore.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PetApiService {
	private final PetRepository petRepository;
	private final TagRepository tagRepository;
	private final PhotoUrlRepository photoUrlRepository;

	@Autowired
	public PetApiService(
			@NonNull final PetRepository petRepository,
			@NonNull final TagRepository tagRepository,
			@NonNull final PhotoUrlRepository photoUrlRepository) {
		this.petRepository = petRepository;
		this.tagRepository = tagRepository;
		this.photoUrlRepository = photoUrlRepository;
	}

	@NonNull
	public Optional<Pet> getById(@NonNull final Long id) {
		final Optional<PetEntity> oPetEntity = petRepository.findById(id);
		if (oPetEntity.isEmpty()) {
			return Optional.empty();
		}
		final List<Tag> tags = tagRepository.findTagEntitiesByPetId(id).stream().map(x -> new Tag().id(x.getId()).name(x.getName())).toList();
		final List<String> photoUrls = photoUrlRepository.findByPetId(id).stream().map(PhotoUrlEntity::getUrl).toList();
		final PetEntity petEntity = oPetEntity.get();
		final Pet pet = new Pet(petEntity.getName(), photoUrls);
		pet.id(id);
		pet.tags(tags);
		pet.category(new Category().id(petEntity.getCategory().getId()).name(petEntity.getCategory().getName()));
		pet.status(Pet.StatusEnum.fromValue(petEntity.getStatus()));
		return Optional.of(pet);
	}
}
