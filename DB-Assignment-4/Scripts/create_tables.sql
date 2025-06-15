CREATE DATABASE assignment4;
USE assignment4;


CREATE TABLE athletes (
    athlete_id INT PRIMARY KEY AUTO_INCREMENT,
    competitor VARCHAR(255) NOT NULL,
    dob DATE,
    nationality VARCHAR(100),
    sex ENUM('M', 'F') NOT NULL,
    UNIQUE (competitor, dob, nationality, sex)
)COMMENT='List of athletes';

CREATE TABLE disciplines (
    discipline_id INT PRIMARY KEY AUTO_INCREMENT,
    discipline VARCHAR(255) NOT NULL,
    type VARCHAR(100),
    normalized_discipline VARCHAR(255),
    track_field VARCHAR(50),
    UNIQUE (discipline, type)
)COMMENT='List of disciplines';

CREATE TABLE venues (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue VARCHAR(255) NOT NULL,
    venue_country VARCHAR(100),
    UNIQUE (venue, venue_country)
)COMMENT='Locations where events are held';

CREATE TABLE results (
    result_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    athlete_id INT NOT NULL,
    venue_id INT NOT NULL,
    discipline_id INT NOT NULL,
    `rank` INT,
    mark VARCHAR(50),
    wind FLOAT,
    position VARCHAR(100),
    date DATE,
    mark_numeric FLOAT,
    result_score FLOAT,
    season YEAR,
    age_at_event INT CHECK (age_at_event >= 0),
    FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (discipline_id) REFERENCES disciplines(discipline_id),
    INDEX idx_athlete (athlete_id),
    INDEX idx_discipline (discipline_id),
    INDEX idx_venue (venue_id)
)COMMENT='Event results';