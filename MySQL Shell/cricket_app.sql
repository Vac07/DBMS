CREATE DATABASE cricket_app;
USE cricket_app;

CREATE TABLE players (
    Player_ID VARCHAR(20) PRIMARY KEY,
    Player_Name VARCHAR(100),
    Batsman_Type VARCHAR(50),
    Batting_Order VARCHAR(50),
    Strike_Rate FLOAT,
    Total_Runs INT,
    Shot_Selection TEXT,
    Hundreds INT,
    Fifties INT,
    Innings INT,
    Highest_Score_Last_6_Months INT
);

CREATE TABLE venues (
    Stadium_ID VARCHAR(20) PRIMARY KEY,
    Stadium_Name VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    Pitch_Type VARCHAR(50),
    Batting_Style VARCHAR(50),
    Shot_Selection TEXT
);
SELECT * FROM players LIMIT 5;