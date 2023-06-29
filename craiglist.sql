DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE Regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE Categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE Users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    encr_password TEXT NOT NULL,
    pref_region_id INTEGER REFERENCES Regions
);

CREATE TABLE Posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    post_location TEXT NOT NULL,
    user_id INTEGER REFERENCES Users,
    region_id INTEGER REFERENCES Regions,
    category_id INTEGER REFERENCES Categories
);



