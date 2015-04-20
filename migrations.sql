psql

CREATE DATABASE travel;

\c travel;

CREATE TABLE locations (id SERIAL PRIMARY KEY, description VARCHAR(80));
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(80));
CREATE TABLE visits (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), location_id INTEGER REFERENCES locations(id));
