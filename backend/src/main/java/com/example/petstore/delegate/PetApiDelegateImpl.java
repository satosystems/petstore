package com.example.petstore.delegate;

import com.example.petstore.openapi.api.PetApiDelegate;
import com.example.petstore.openapi.model.Pet;
import com.example.petstore.service.PetApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class PetApiDelegateImpl implements PetApiDelegate {
	private final PetApiService petApiService;

	@Autowired
	public PetApiDelegateImpl(@NonNull final PetApiService petApiService) {
		this.petApiService = petApiService;
	}

	@Override
	public ResponseEntity<Pet> getPetById(Long petId) {
		final Optional<Pet> oPet = petApiService.getById(petId);
		return oPet.map(pet -> new ResponseEntity<>(pet, HttpStatus.OK)).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}
}
