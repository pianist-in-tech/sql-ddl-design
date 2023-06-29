DROP DATABASE IF EXISTS soccer_leagues;

CREATE DATABASE soccer_leagues;

\c soccer_leagues

CREATE TABLE Teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,    
    city TEXT NOT NULL
);

CREATE TABLE Referees
(
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL,    
);

CREATE TABLE Season
(
    id SERIAL PRIMARY KEY,
    seas_start_date TEXT NOT NULL,    
    seas_end_date TEXT NOT NULL,    
);

CREATE TABLE MATCHES
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES Teams,
    away_team_id INTEGER REFERENCES Teams,
    match_location TEXT NOT NULL,
    match_date TEXT NOT NULL,
    start_time TEXT NOT NULL,
    season_id INTEGER REFERENCES Season,
    head_referee_1_id INTEGER REFERENCES Referees,
    assist_referee_1_id INTEGER REFERENCES Referees,
    assist_referee_2_id INTEGER REFERENCES Referees,
);

CREATE TABLE Results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES Teams,
    match_id INTEGER REFERENCES Matches,
    result TEXT NOT NULL
);

CREATE TABLE Players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    birthday TEXT NOT NULL,
    height INTEGER NOT NULL,
    cur_team_id INTEGER REFERENCES Teams
);

CREATE TABLE Goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES Players,
    match_id INTEGER REFERENCES Matches
);

CREATE TABLE Lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES Players,
    match_id INTEGER REFERENCES Matches,
    team_id INTEGER REFERENCES Teams
);





