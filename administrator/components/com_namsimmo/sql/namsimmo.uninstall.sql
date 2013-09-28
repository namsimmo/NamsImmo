-- -------------------------------------------------------------------------------------------------
-- FILENAME
--     namsImmo.uninstall.sql
--
-- DESCRIPTION
--
-- This file contains the database table removing script run by Joomla! installer component while
-- installing this extension. Do not modify this script unless you need to modify the database 
-- structure.
--
-- @author Yannick Sereckissy
-- @date September 19 2013
--
-- (c) Copyright 2013 NamsImmo Inc. All rights reserved.
-- -------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------
-- drop agent_immobiliers table fist
-- -------------------------------------------------------------------------------------------------

-- remove the foreign key on users table
ALTER TABLE `#__agents_immobilier` DROP FOREIGN KEY `fk_agent_user_id`;
-- remove the foreign key on agence_immobilieres table
ALTER TABLE `#__agents_immobilier` DROP FOREIGN KEY `fk_agent_agence_id`;
-- drop the table
DROP TABLE IF EXISTS `#__agents_immobilier`;

-- -------------------------------------------------------------------------------------------------
-- drop __agence_immobilieres table
-- -------------------------------------------------------------------------------------------------

-- remove foreign key first
ALTER TABLE `#__agence_immobilieres` DROP FOREIGN KEY `fk_agence_user_id`;
-- now drop the table
DROP TABLE IF EXISTS `#__agence_immobilieres`;
