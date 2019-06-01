CREATE DATABASE `football` ;

/*creating tables*/
CREATE TABLE `football`.`players` (
  `players_id` INT NOT NULL AUTO_INCREMENT,
  `player_name` VARCHAR(50) NOT NULL,
  `birthday` DATE NOT NULL,
  `position_play` VARCHAR(20) NOT NULL,
  `team_id` INT NULL DEFAULT NULL,
  `goals` INT NULL DEFAULT 0,
  PRIMARY KEY (`players_id`));
  
  CREATE TABLE `football`.`teams` (
  `team_id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(20) NOT NULL,
  `first_kit_color` VARCHAR(20) NOT NULL,
  `second_kit_color` VARCHAR(20) NOT NULL,
  `place` INT NOT NULL,
  `score` INT NOT NULL,
  PRIMARY KEY (`team_id`));
  
  CREATE TABLE `football`.`matches` (
  `match_id` INT NOT NULL AUTO_INCREMENT,
  `first_team` INT NOT NULL,
  `second_team` INT NOT NULL,
  `match_date` DATE NOT NULL,
  `week` INT NOT NULL,
  `first_team_goals` INT NOT NULL DEFAULT 0,
  `second_team_goals` INT NOT NULL DEFAULT 0,
  `referee` INT NOT NULL,
  PRIMARY KEY (`match_id`));
  
  CREATE TABLE `football`.`goals` (
  `match_id` INT NOT NULL,
  `player_id` INT NOT NULL,
  `goal_minutes` INT NOT NULL);
  
    CREATE TABLE `football`.`referee` (
  `ref_id` INT NOT NULL AUTO_INCREMENT,
  `ref_name` VARCHAR(50) NOT NULL,
  `birthday` DATE NOT NULL,
  `ref_matches` INT NULL DEFAULT 0,
  PRIMARY KEY (`ref_id`));
  
  /*relations*/
  ALTER TABLE `football`.`players` 
ADD INDEX `team_id_idx` (`team_id` ASC) VISIBLE;
;
ALTER TABLE `football`.`players` 
ADD CONSTRAINT `team_id`
  FOREIGN KEY (`team_id`)
  REFERENCES `football`.`teams` (`team_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  ALTER TABLE `football`.`matches` 
ADD INDEX `first_team_idx` (`first_team` ASC) VISIBLE,
ADD INDEX `second_team_idx` (`second_team` ASC) VISIBLE;
;
ALTER TABLE `football`.`matches` 
ADD CONSTRAINT `first_team`
  FOREIGN KEY (`first_team`)
  REFERENCES `football`.`teams` (`team_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `second_team`
  FOREIGN KEY (`second_team`)
  REFERENCES `football`.`teams` (`team_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  ALTER TABLE `football`.`goals` 
ADD INDEX `match_id_idx` (`match_id` ASC) VISIBLE,
ADD INDEX `player_id_idx` (`player_id` ASC) VISIBLE;
;
ALTER TABLE `football`.`goals` 
ADD CONSTRAINT `match_id`
  FOREIGN KEY (`match_id`)
  REFERENCES `football`.`matches` (`match_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `player_id`
  FOREIGN KEY (`player_id`)
  REFERENCES `football`.`players` (`players_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  ALTER TABLE `football`.`matches` 
ADD INDEX `ref_id_idx` (`referee` ASC) VISIBLE;
;
ALTER TABLE `football`.`matches` 
ADD CONSTRAINT `ref_id`
  FOREIGN KEY (`referee`)
  REFERENCES `football`.`referee` (`ref_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

  
  