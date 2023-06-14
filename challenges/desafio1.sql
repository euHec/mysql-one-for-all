DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE SCHEMA IF NOT EXISTS `SpotifyClone`;
USE `SpotifyClone` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `artist_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artists` (artist_id, name) VALUES
(1, 'Beyoncé'),
(2, 'Queen'),
(3, 'Elis Regina'),
(4, 'Baco Exu do Blues'),
(5, 'Blind Guardian'),
(6, 'Nina Simone');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  FOREIGN KEY (`artist_id`) REFERENCES `SpotifyClone`.`artists` (`artist_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`albuns` (album_id, name, artist_id) VALUES
(1, 'Renaissance', 1),
(2, 'Jazz', 2),
(3, 'Hot Space', 2),
(4, 'Falso Brilhante', 3),
(5, 'Vento de Maio', 3),
(6, 'QVVJFA?', 4),
(7, 'Somewhere Far Beyond', 5),
(8, 'I Put A Spell On You', 6);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `album_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `duration_seconds` INT NOT NULL,
  `release_year` YEAR NOT NULL,
  PRIMARY KEY (`song_id`),
  FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`albuns` (`album_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`songs` (song_id, album_id, name, duration_seconds, release_year) VALUES
(1, 1, "BREAK MY SOUL", 279, 2022),
(2, 1, "VIRGO'S GROOVE", 369, 2022),
(3, 1, "ALIEN SUPERSTAR", 116, 2022),
(4, 2, "Don't Stop Me Now", 203, 1978),
(5, 3, "Under Pressure", 152, 1982),
(6, 4, "Como Nossos Pais", 105, 1998),
(7, 5, "O Medo de Amar é o Medo de Ser Livre", 207, 2001),
(8, 6, "Samba em Paris", 267, 2003),
(9, 7, "The Bard's Song", 244, 2007),
(10, 8, "Feeling Good", 100, 2012);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`plans` (plan_id, name, price) VALUES
(1, 'gratuito', 0),
(2, 'pessoal', 6.99),
(3, 'universitário', 5.99),
(4, 'familiar', 7.99);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(70) NOT NULL,
  `age` INT NOT NULL,
  `plan_id` INT NOT NULL,
  `date_signing` DATE NOT NULL,
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (`plan_id`) REFERENCES `SpotifyClone`.`plans` (`plan_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`users` (user_id, name, age, plan_id, date_signing) VALUES
(1, 'Barbara Liskov', 82, 1, '2019-10-20'),
(2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
(3, 'Ada Lovelace', 37, 4, '2017-12-30'),
(4, 'Martin Fowler', 46, 4, '2017-01-17'),
(5, 'Sandi Metz', 58, 4, '2018-04-29'),
(6, 'Paulo Freire', 19, 3, '2018-02-14'),
(7, 'Bell Hooks', 26, 3, '2018-01-05'),
(8, 'Christopher Alexander', 85, 2, '2019-06-05'),
(9, 'Judith Butler', 45, 2, '2020-05-13'),
(10, 'Jorge Amado', 58, 2, '2017-02-17');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  FOREIGN KEY (`user_id`)  REFERENCES `SpotifyClone`.`users` (`user_id`),
  FOREIGN KEY (`song_id`) REFERENCES `SpotifyClone`.`songs` (`song_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`history` (user_id, song_id, date) VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`followers` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  FOREIGN KEY (`artist_id`) REFERENCES `SpotifyClone`.`artists` (`artist_id`),
  FOREIGN KEY (`user_id`) REFERENCES `SpotifyClone`.`users` (`user_id`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`followers` (user_id, artist_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);
