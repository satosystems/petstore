DELETE FROM category;
DELETE FROM photo_url;
DELETE FROM tag;
DELETE FROM pet_tag;
DELETE FROM pet;

INSERT INTO category(id, name) VALUES (1, 'dog');
INSERT INTO category(id, name) VALUES (2, 'cat');

INSERT INTO tag(id, name) VALUES (1, 'with pedigree');

INSERT INTO pet(id, name, category_id, status) VALUES (1, 'Hachi', 1, 'available');
INSERT INTO pet(id, name, category_id, status) VALUES (2, 'SNOOPY', 1, 'sold');
INSERT INTO pet(id, name, category_id, status) VALUES (3, 'Lassie', 1, 'pending');
INSERT INTO pet(id, name, category_id, status) VALUES (4, 'HELLO KITTY', 2, 'sold');
INSERT INTO pet(id, name, category_id, status) VALUES (5, 'Jibanyan', 2, 'pending');
INSERT INTO pet(id, name, category_id, status) VALUES (6, 'Doraemon', 2, 'available');

INSERT INTO pet_tag(pet_id, tag_id) VALUES (2, 1);
INSERT INTO pet_tag(pet_id, tag_id) VALUES (3, 1);
INSERT INTO pet_tag(pet_id, tag_id) VALUES (4, 1);

INSERT INTO photo_url(pet_id, url) VALUES(1, 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e');

INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1522770179533-24471fcdba45');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1444418776041-9c7e33cc5a9c');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1533827432537-70133748f5c8');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1516802273409-68526ee1bdd6');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1518756131217-31eb79b20e8f');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1597645587822-e99fa5d45d25');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1567306301408-9b74779a11af');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1471357674240-e1a485acb3e1');
INSERT INTO photo_url(pet_id, url) VALUES(2, 'https://images.unsplash.com/photo-1589118949245-7d38baf380d6');

INSERT INTO photo_url(pet_id, url) VALUES(3, 'https://images.unsplash.com/photo-1471357674240-e1a485acb3e1');
INSERT INTO photo_url(pet_id, url) VALUES(3, 'https://images.unsplash.com/photo-1589118949245-7d38baf380d6');

INSERT INTO photo_url(pet_id, url) VALUES(4, 'https://images.unsplash.com/photo-1444418776041-9c7e33cc5a9c');
INSERT INTO photo_url(pet_id, url) VALUES(4, 'https://images.unsplash.com/photo-1533827432537-70133748f5c8');
INSERT INTO photo_url(pet_id, url) VALUES(4, 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62');
INSERT INTO photo_url(pet_id, url) VALUES(4, 'https://images.unsplash.com/photo-1516802273409-68526ee1bdd6');

INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1522770179533-24471fcdba45');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1444418776041-9c7e33cc5a9c');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1533827432537-70133748f5c8');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1558642452-9d2a7deb7f62');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1516802273409-68526ee1bdd6');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1518756131217-31eb79b20e8f');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1597645587822-e99fa5d45d25');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1567306301408-9b74779a11af');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1471357674240-e1a485acb3e1');
INSERT INTO photo_url(pet_id, url) VALUES(6, 'https://images.unsplash.com/photo-1589118949245-7d38baf380d6');
