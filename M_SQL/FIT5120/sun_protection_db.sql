use onboarding_database;

CREATE DATABASE onboarding_database;

USE onboarding_database;

CREATE TABLE weather_data (
    year INT PRIMARY KEY,
    temperature_max FLOAT,
    temperature_min FLOAT,
    rain_sum FLOAT,
    relative_humidity_max FLOAT,
    relative_humidity_min FLOAT
);

CREATE TABLE cancer_incidence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cancer_group VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    sex ENUM('Males', 'Females', 'Persons') NOT NULL,
    age_group VARCHAR(20) NOT NULL,
    incidences INT NOT NULL,
    FOREIGN KEY (year) REFERENCES weather_data(year) ON DELETE CASCADE
);

CREATE TABLE cancer_mortality (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cancer_group VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    sex ENUM('Males', 'Females', 'Persons') NOT NULL,
    age_group VARCHAR(20) NOT NULL,
    mortalities INT NOT NULL,
    FOREIGN KEY (year) REFERENCES weather_data(year) ON DELETE CASCADE
);
