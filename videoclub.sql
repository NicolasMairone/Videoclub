DROP DATABASE videoclub;
CREATE DATABASE videoclub;

\c videoclub;

CREATE TABLE actor (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE country(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE city (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    country_id INTEGER REFERENCES country,
    last_update TIMESTAMP DEFAULT  CURRENT_TIMESTAMP
);

CREATE TABLE address(
    id SERIAL PRIMARY KEY,
    addres VARCHAR (50) NOT NULL,
    addres2 VARCHAR (50),
    district VARCHAR (50) NOT NULL,
    city_id INTEGER REFERENCES city(id),
    postal_code DECIMAL,
    phone DECIMAL ,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    location VARCHAR (50)
);

CREATE TABLE category(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR (50)NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    addres_id INTEGER REFERENCES address,
    picture BYTEA NOT NULL,
    email VARCHAR(50) NOT NULL,
    store_id INTEGER,
    active BOOLEAN DEFAULT FALSE,
    username VARCHAR (50) NOT NULL,
    password VARCHAR (50) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE store(
    id SERIAL PRIMARY KEY,
    staff_id INTEGER REFERENCES staff,
    addres_id INTEGER REFERENCES address,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customer(
    id SERIAL PRIMARY KEY,
    store_id INTEGER REFERENCES store,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    addres_id INTEGER REFERENCES address,
    email VARCHAR(50) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    create_date DATE,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lenguage(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    descripcion VARCHAR (50) NOT NULL,
    release_year INTEGER,
    lenguage_id INTEGER REFERENCES lenguage,
    rental_duration INT,
    rental_rate DECIMAL,
    lenght INT,
    special_features VARCHAR (50) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film_actor(
    id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES film,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film_category(
    id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES film,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film_text(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
); 

CREATE TABLE inventory(
    id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES film,
    store_id INTEGER REFERENCES store,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rental(
    id SERIAL PRIMARY KEY,
    rental_date VARCHAR(50) NOT NULL,
    inventory_id INTEGER REFERENCES inventory,
    customer_id INTEGER REFERENCES customer,
    return_date VARCHAR(50) NOT NULL,
    staff_id INTEGER REFERENCES staff,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customer,
    staff_id INTEGER REFERENCES staff,
    rental_id INTEGER REFERENCES rental,
    amount DECIMAL,
    payment_date DATE,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);