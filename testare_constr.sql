-- CONSTRANGERE RATING >1000
INSERT INTO `Player` (`FirstName`, `LastName`, `Rating`, `Country`, `Age`) 
VALUES ('Test', 'Player', 500, 'Testland', 25);

--CONSTRANGERE SUB 7 ANI
INSERT INTO `Player` (`FirstName`, `LastName`, `Rating`, `Country`, `Age`) 
VALUES ('Child', 'Player', 1500, 'Kidland', 5);

-- Încearcă să inserezi un rezultat final pentru un jucător sau competiție inexistentă
INSERT INTO `Final_results` (`id_user`, `id_competition`, `win_points`) 
VALUES (999, 999, 1.0);

-- incearca sa inserezi o competitie cu o data din 2025
INSERT INTO `Competition` (`comp_place`, `comp_date`) 
VALUES ('Bucharest', '2025-01-01');