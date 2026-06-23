DROP SCHEMA IF EXISTS cricket_db;
USE cricket_selection_db;

SHOW DATABASES;
USE cricket_selection_db;

SHOW TABLES;

SELECT * FROM player_dataset;

SELECT * FROM pitch_dataset;

USE cricket_selection_db;
DROP TABLE IF EXISTS pitch_dataset;
DROP TABLE IF EXISTS player_dataset;

CREATE TABLE pitch_dataset (
    Stadium_ID VARCHAR(10) PRIMARY KEY,
    Stadium_Name VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    Pitch_Type VARCHAR(20),
    Batting_Style VARCHAR(10),
    Shot_Selection VARCHAR(255)
);

CREATE TABLE player_dataset (
    Player_ID VARCHAR(15) PRIMARY KEY,
    Player_Name VARCHAR(100),
    Batsman_Type VARCHAR(50),
    Batting_Order VARCHAR(20),
    Strike_Rate FLOAT,
    Total_Runs INT,
    Shot_Selection VARCHAR(255),
    Hundreds INT,
    Fifties INT,
    Innings INT,
    Highest_Score_Last_6_Months INT
);


SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/Users/gajendra06/Downloads/player_dataset.csv'
INTO TABLE player_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Player_ID, Player_Name, Batsman_Type, Batting_Order, Strike_Rate,
 Total_Runs, Shot_Selection, Hundreds, Fifties, Innings, Highest_Score_Last_6_Months);

LOAD DATA LOCAL INFILE '/Users/gajendra06/Downloads/pitch_dataset.csv'
INTO TABLE pitch_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Stadium_ID, Stadium_Name, Country, City, Pitch_Type, Batting_Style, Shot_Selection);


SELECT COUNT(*) FROM player_dataset;   -- should show 64
SELECT COUNT(*) FROM pitch_dataset;    -- should show 28

pitch_database;


SELECT VERSION();
SHOW DATABASES;
