DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS photo_url;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS pet_tag;
DROP TABLE IF EXISTS pet;

CREATE TABLE category (
  id IDENTITY,
  name VARCHAR(256) NOT NULL
);

CREATE TABLE photo_url (
  pet_id BIGINT NOT NULL,
  url VARCHAR(2048) NOT NULL,
  PRIMARY KEY(pet_id, url)
);

CREATE TABLE tag (
  id IDENTITY,
  name VARCHAR(256)
);

CREATE TABLE pet_tag (
  pet_id BIGINT NOT NULL,
  tag_id BIGINT NOT NULL,
  PRIMARY KEY(pet_id, tag_id)
);

CREATE TABLE pet (
  id IDENTITY,
  name VARCHAR(256) NOT NULL,
  category_id BIGINT,
  status VARCHAR(256) NOT NULL
);
