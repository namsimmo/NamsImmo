-- -------------------------------------------------------------------------------------------------
-- FILENAME
--     namsImmo.install.sql
--
-- DESCRIPTION
--
-- This file contains the database table creation script run by Joomla! installer component while
-- installing this extension. Do not modify this script unless you need to modify the database 
-- structure.
--
-- @author Yannick Sereckissy
-- @date September 19 2013
--
-- (c) Copyright 2013 NamsImmo Inc. All rights reserved.
-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
-- In the section below, we create the real estate agencies table. This tables contains all the 
-- real estate agencies we are working with. before creating this table, we want to make sure it
-- does not exist. If it does, then we delete then recreate it
-- -------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `#__agence_immobilieres`;
-- Now create the table
CREATE TABLE IF NOT EXISTS `#__agence_immobilieres` (
    `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `numero_siret` VARCHAR(255) NOT NULL,
    `description` TEXT DEFAULT NULL,
    `user_id` INTEGER(11) NOT NULL,
    `website_url_client` VARCHAR(255) DEFAULT NULL,
    `address_client` VARCHAR(255) NOT NULL,
    `email_client` VARCHAR(100) NOT NULL,
    `telephone_client` VARCHAR(50) NOT NULL,
    `fax_client` VARCHAR(50) DEFAULT NULL,
    
    CONSTRAINT `pk_primary` PRIMARY KEY(`id`),
    CONSTRAINT `fk_agence_user_id` FOREIGN KEY(`user_id`) REFERENCES `#__users`(`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 AUTO_INCREMENT=1;
-- -------------------------------------------------------------------------------------------------
-- Agents Immobiliers table
-- -------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `#__agents_immobilier`;
-- Create the table Now
CREATE TABLE IF NOT EXISTS `#__agents_immobilier` (
    `id_user` INTEGER(11) NOT NULL,
    `id_agence` INTEGER(11) NOT NULL,
    CONSTRAINT `pk_id_agent_immobilier` PRIMARY KEY(`id_user`,`id_agence`),
    CONSTRAINT `fk_agent_user_id` FOREIGN KEY(`id_user`) REFERENCES `#__users`(`id`),
    CONSTRAINT `fk_agent_agence_id` FOREIGN KEY(`id_agence`) REFERENCES `#__agence_immobilieres`(`id`)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;



