INSERT INTO `Player` (`FirstName`, `LastName`, `Rating`, `Country`, `Age`) VALUES
('Magnus', 'Carlsen', 2850, 'Norway', 33),
('Ian', 'Nepomniachtchi', 2795, 'Russia', 33),
('Fabiano', 'Caruana', 2780, 'USA', 32),
('Ding', 'Liren', 2800, 'China', 31),
('Hikaru', 'Nakamura', 2785, 'USA', 36),
('Alireza', 'Firouzja', 2745, 'France', 21),
('Anish', 'Giri', 2765, 'Netherlands', 30),
('Levon', 'Aronian', 2755, 'USA', 41),
('Wesley', 'So', 2760, 'USA', 30),
('Richard', 'Rapport', 2750, 'Romania', 28);

-- Adaugarea de inregistrari pentru tabela Competition
INSERT INTO `Competition` (`comp_place`, `comp_date`, `comp_name`) VALUES
('Bucharest', '2024-03-15', 'Grand Chess Tour Romania'),
('Paris', '2024-05-20', 'Grand Chess Tour Blitz'),
('Wijk aan Zee', '2024-01-10', 'Tata Steel Chess Tournament'),
('Stavanger', '2024-06-05', 'Norway Chess'),
('Berlin', '2024-02-15', 'Candidates Tournament'),
('Dubai', '2024-04-12', 'World Rapid Championship'),
('Moscow', '2024-07-10', 'Tal Memorial'),
('London', '2024-09-01', 'London Chess Classic'),
('Chennai', '2024-10-15', 'Chess Olympiad'),
('New York', '2024-12-01', 'FIDE World Championship');

-- Adaugarea de inregistrari pentru tabela Round
INSERT INTO `Round` (`id_competition`, `round_number`) VALUES
(1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2), (4, 1), (5, 1), (5, 2), (6, 1);

-- Adaugarea de inregistrari pentru tabela Match
INSERT INTO `Match` (`id_round`, `id_player1`, `id_player2`, `points_player_1`, `points_player_2`) VALUES
(1, 1, 2, 1.0, 0.0),
(2, 3, 4, 0.5, 0.5),
(3, 5, 6, 1.0, 0.0),
(4, 7, 8, 0.5, 0.5),
(5, 9, 10, 1.0, 0.0),
(6, 2, 3, 0.5, 0.5),
(7, 4, 5, 1.0, 0.0),
(8, 6, 7, 0.5, 0.5),
(9, 8, 9, 1.0, 0.0),
(10, 10, 1, 0.0, 1.0);

-- Adaugarea de inregistrari pentru tabela Player_competition
INSERT INTO `Player_competition` (`id_player`, `id_competition`) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (7, 4), (8, 5), (9, 5), (10, 6);

-- Adaugarea de inregistrari pentru tabela Final_results
INSERT INTO `Final_results` (`id_user`, `id_competition`, `win_points`) VALUES
(1, 1, 10.0), (2, 1, 8.5), (3, 2, 7.0), (4, 2, 6.5), (5, 3, 9.0),
(6, 3, 7.5), (7, 4, 10.0), (8, 5, 8.0), (9, 5, 9.5), (10, 6, 10.0);


