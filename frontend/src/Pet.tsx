import React, { useState } from "react";

import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Chip from "@mui/material/Chip";
import ImageList from "@mui/material/ImageList";
import ImageListItem from "@mui/material/ImageListItem";
import Input from "@mui/material/Input";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";

import { PetApi } from "./openapi/apis/PetApi";
import { Pet } from "./openapi/models/index";

export const FindPetById: React.FC = () => {
  const petApi = new PetApi();

  const petIdentityElement: Pet = {
    id: undefined,
    name: "",
    category: undefined,
    photoUrls: Array(),
    tags: undefined,
    status: undefined,
  };

  const [value, setValue] = useState("");
  const [pet, setPet] = useState(petIdentityElement);

  const findById = async () => {
    if (value === "") {
      alert("Empty pet id");
      return;
    }
    try {
      const pet: Pet = await petApi.getPetById({
        petId: Number(value),
      });
      setPet(pet);
    } catch (e) {
      alert("Not found");
      setPet(petIdentityElement);
    }
  };

  return (
    <div>
      <Box>
        <Input
          type="number"
          placeholder="Input pet id"
          value={value}
          onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
            setValue(e.target.value)
          }
          required
        />
        <Button variant="contained" onClick={findById}>
          Find
        </Button>
      </Box>
      <Card sx={{ minWidth: 275 }}>
        <CardContent>
          <Typography sx={{ fontSize: 14 }} gutterBottom>
            Id: {pet?.id}
          </Typography>
          <Typography variant="h5" component="div">
            Name: {pet.name}
          </Typography>
          <Typography sx={{ mb: 1.5 }} color="text.secondary">
            Category: {pet.category?.name}
          </Typography>

          <Stack spacing={1}>
            <Stack direction="row" spacing={1}>
              Tags:
              {pet.tags?.map((tag, i) => (
                <Chip label={tag.name} key={i} color="primary" />
              ))}
            </Stack>
          </Stack>

          <Typography variant="body2">Status: {pet.status}</Typography>

          <ImageList
            sx={{ width: 500, height: 450 }}
            cols={3}
            rowHeight={164}
            children=""
          >
            {pet.photoUrls.map((url, i) => (
              <ImageListItem key={i}>
                <img src={url} loading="lazy" />
              </ImageListItem>
            ))}
          </ImageList>
        </CardContent>
      </Card>
    </div>
  );
};
