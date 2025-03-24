CREATE TABLE `Player`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Rating` INT UNSIGNED NOT NULL CHECK(Rating >= 1000),
    `Country` VARCHAR(255) NOT NULL,
    `Age` INT UNSIGNED NOT NULL CHECK(Age >= 7)
);
CREATE TABLE `Competition`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `comp_name` VARCHAR(255) NOT NULL,
    `comp_place` VARCHAR(255) NOT NULL,
    `comp_date` DATE NOT NULL, 
    `time_control` ENUM('Blitz', 'Rapid', 'Classical')
);
CREATE TABLE `Match`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_round` INT UNSIGNED NOT NULL,
    `id_player1` INT UNSIGNED NOT NULL,
    `id_player2` INT UNSIGNED NOT NULL,
    `points_player_1` FLOAT NOT NULL CHECK (`points_player_1` IN (0, 0.5, 1)),
    `points_player_2` FLOAT NOT NULL CHECK (`points_player_2` IN (0, 0.5, 1))
);
CREATE TABLE `Player_competition`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_player` INT UNSIGNED NOT NULL,
    `id_competition` INT UNSIGNED NOT NULL
);
CREATE TABLE `Final_results`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_user` INT UNSIGNED NOT NULL,
    `id_competition` INT UNSIGNED  NOT NULL,
    `win_points` FLOAT DEFAULT 0
);
CREATE TABLE `Round`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_competition` INT UNSIGNED NOT NULL,
    `round_number` INT NOT NULL
);
ALTER TABLE
    `Match` ADD CONSTRAINT `match_id_player2_foreign` FOREIGN KEY(`id_player2`) REFERENCES `Player`(`id`);
ALTER TABLE
    `Final_results` ADD CONSTRAINT `final_results_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `Player`(`id`);
ALTER TABLE
    `Match` ADD CONSTRAINT `match_id_player1_foreign` FOREIGN KEY(`id_player1`) REFERENCES `Player`(`id`);
ALTER TABLE
    `Final_results` ADD CONSTRAINT `final_results_id_competition_foreign` FOREIGN KEY(`id_competition`) REFERENCES `Competition`(`id`);
ALTER TABLE
    `Player_competition` ADD CONSTRAINT `player_competition_id_player_foreign` FOREIGN KEY(`id_player`) REFERENCES `Player`(`id`);
ALTER TABLE
    `Player_competition` ADD CONSTRAINT `player_competition_id_competition_foreign` FOREIGN KEY(`id_competition`) REFERENCES `Competition`(`id`);
ALTER TABLE
    `Match` ADD CONSTRAINT `match_id_round_foreign` FOREIGN KEY(`id_round`) REFERENCES `Round`(`id`);
ALTER TABLE
    `Round` ADD CONSTRAINT `round_id_competition_foreign` FOREIGN KEY(`id_competition`) REFERENCES `Competition`(`id`);


    -- Trigger pentru actualizarea rezultatelor finale
DELIMITER $$

CREATE TRIGGER trg_update_final_results_on_update
AFTER UPDATE ON `Match`
FOR EACH ROW
BEGIN
    -- Actualizare puncte pentru Player1
    UPDATE Final_results
    SET win_points = win_points - OLD.points_player_1 + NEW.points_player_1
    WHERE id_user = NEW.id_player1;

    -- Actualizare puncte pentru Player2
    UPDATE Final_results
    SET win_points = win_points - OLD.points_player_2 + NEW.points_player_2
    WHERE id_user = NEW.id_player2;
END$$

DELIMITER ;

-- Trigger pentru actualizarea rating-ului dupa fiecare runda jucata
DELIMITER $$

CREATE TRIGGER trg_update_player_rating
AFTER INSERT ON `Match`
FOR EACH ROW
BEGIN
    -- Verificam rezultatul pentru Player1 si Player2
    IF NEW.points_player_1 = 1 AND NEW.points_player_2 = 0 THEN
        -- Jucatorul 1 castiga
        UPDATE Player
        SET Rating = Rating + 8
        WHERE id = NEW.id_player1;

        -- Jucatorul 2 pierde
        UPDATE Player
        SET Rating = Rating - 8
        WHERE id = NEW.id_player2;

    ELSEIF NEW.points_player_1 = 0 AND NEW.points_player_2 = 1 THEN
        -- Jucatorul 2 castiga
        UPDATE Player
        SET Rating = Rating + 8
        WHERE id = NEW.id_player2;

        -- Jucatorul 1 pierde
        UPDATE Player
        SET Rating = Rating - 8
        WHERE id = NEW.id_player1;

    -- ELSE IF NEW.points_player_1 = 0.5 AND NEW.points_player_2 = 0.5 THEN
        -- Remiza: Niciun jucator nu castiga sau pierde puncte
        -- Nu se face nicio actualizare.
    END IF; -- Închidem blocul IF principal
END$$

DELIMITER ;



