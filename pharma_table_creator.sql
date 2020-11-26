-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pharmaceutical_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pharmaceutical_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pharmaceutical_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pharmaceutical_schema` ;

-- -----------------------------------------------------
-- Table `pharmaceutical_schema`.`companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pharmaceutical_schema`.`companies` ;

CREATE TABLE IF NOT EXISTS `pharmaceutical_schema`.`companies` (
  `company_code` INT NOT NULL,
  `company_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (company_code) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `companies` VALUES (5704,'Generic'),(5887,'Pfizer'),(5653,'Sanofi-Aventis'),(5685,'Genentech/Roche');

-- -----------------------------------------------------
-- Table `pharmaceutical_schema`.`drugs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pharmaceutical_schema`.`drugs` ;

CREATE TABLE IF NOT EXISTS `pharmaceutical_schema`.`drugs` (
  `generic_name` TEXT NULL DEFAULT NULL,
  `brand_name` VARCHAR(20) NOT NULL,
  `purpose` TEXT NULL DEFAULT NULL,
  `company_code` INT NULL DEFAULT NULL,
  PRIMARY KEY (`brand_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `drugs` VALUES ('Aripiprazole','Abilify','Psychosis; depression',5704),('Oxycodone','OxyContin','Pain',5704),('Pregabalin','Lyrica','Neuropathic pain',5887),('Duloxetine','Cymbalta','Depression; anxiety disorders',5704),('Insulin glargine','Lantus Solostar','Diabetes mellitus type 1 and 2',5653),('Bevacizumab','Avastin','Cancer',5685);

-- -----------------------------------------------------
-- Table `pharmaceutical_schema`.`transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pharmaceutical_schema`.`transactions` ;

CREATE TABLE IF NOT EXISTS `pharmaceutical_schema`.`transactions` (
  `order_id` VARCHAR(20) NOT NULL,
  `Invoice_date` TEXT NULL DEFAULT NULL,
  `company_code` INTEGER NOT NULL,
  `brand_name` VARCHAR(20) NOT NULL,
  `ship_to` TEXT NULL DEFAULT NULL,
  `sold_to` TEXT NULL DEFAULT NULL,
  `delivery_plant` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `price_kg` TEXT NULL DEFAULT NULL,
  `total_price` TEXT NULL DEFAULT NULL,
  `month` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (order_id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `transactions` VALUES ('CA-2015-169','9/8/2015',5887,'Lyrica','Indonesia','Indonesia',8095,205,' $500.0 ',' $102,500.0 ','Sep'),('CA-2015-092','9/7/2015',5887,'Lyrica','India','India',8095,293,' $500.0 ',' $146,500.0 ','Sep'),('CA-2015-128','9/5/2015',5887,'Lyrica','India','India',8095,92,' $500.0 ',' $46,000.0 ','Sep'),('CA-2015-060','9/4/2015',5887,'Lyrica','Singapore','Singapore',8095,398,' $500.0 ',' $199,000.0 ','Sep'),('CA-2015-028','9/29/2015',5887,'Lyrica','Nepal','Nepal',8095,18,' $500.0 ',' $9,000.0 ','Sep'),('CA-2015-146','9/27/2015',5887,'Lyrica','India','India',8095,499,' $500.0 ',' $249,500.0 ','Sep'),('CA-2015-166','9/26/2015',5887,'Lyrica','Philippines','Philippines',8095,423,' $500.0 ',' $211,500.0 ','Sep'),('CA-2015-189','9/24/2015',5887,'Lyrica','Indonesia','Indonesia',8095,55,' $500.0 ',' $27,500.0 ','Sep'),('CA-2015-106','9/22/2015',5887,'Lyrica','Uganda','Netherlands',8095,239,' $500.0 ',' $119,500.0 ','Sep'),('CA-2015-046','9/20/2015',5887,'Lyrica','Netherlands','Netherlands',8095,165,' $500.0 ',' $82,500.0 ','Sep'),('CA-2015-072','9/20/2015',5887,'Lyrica','Singapore','Singapore',8095,459,' $500.0 ',' $229,500.0 ','Sep'),('CA-2015-079','9/19/2015',5887,'Lyrica','India','India',8095,284,' $500.0 ',' $142,000.0 ','Sep'),('CA-2015-174','9/15/2015',5887,'Lyrica','Taiwan','China',8095,309,' $500.0 ',' $154,500.0 ','Sep'),('CA-2015-190','9/12/2015',5887,'Lyrica','Syria','Lebanon',8095,197,' $500.0 ',' $98,500.0 ','Sep'),('CA-2015-012','9/1/2015',5887,'Lyrica','India','India',8095,376,' $500.0 ',' $188,000.0 ','Sep'),('CA-2015-057','9/1/2015',5887,'Lyrica','India','India',8095,379,' $500.0 ',' $189,500.0 ','Sep'),('CA-2015-100','8/6/2015',5887,'Lyrica','India','India',8095,75,' $500.0 ',' $37,500.0 ','Aug'),('CA-2015-159','8/31/2015',5887,'Lyrica','India','India',8095,125,' $500.0 ',' $62,500.0 ','Aug'),('CA-2015-125','8/31/2015',5887,'Lyrica','India','India',8095,213,' $500.0 ',' $106,500.0 ','Aug'),('CA-2015-150','8/29/2015',5887,'Lyrica','India','India',8095,302,' $500.0 ',' $151,000.0 ','Aug'),('CA-2015-110','8/27/2015',5887,'Lyrica','India','India',8095,237,' $500.0 ',' $118,500.0 ','Aug'),('CA-2015-063','8/27/2015',5887,'Lyrica','Thailand','Thailand',8095,60,' $500.0 ',' $30,000.0 ','Aug'),('CA-2015-064','8/24/2015',5887,'Lyrica','Singapore','Singapore',8095,419,' $500.0 ',' $209,500.0 ','Aug'),('CA-2015-033','8/24/2015',5887,'Lyrica','Sudan','Utd.Arab Emir.',8095,22,' $500.0 ',' $11,000.0 ','Aug'),('CA-2015-147','8/23/2015',5887,'Lyrica','India','India',8095,341,' $500.0 ',' $170,500.0 ','Aug'),('CA-2015-066','8/20/2015',5887,'Lyrica','Vietnam','Netherlands',8095,416,' $500.0 ',' $208,000.0 ','Aug'),('CA-2015-118','8/16/2015',5887,'Lyrica','India','India',8095,485,' $500.0 ',' $242,500.0 ','Aug'),('CA-2015-040','8/16/2015',5887,'Lyrica','India','India',8095,352,' $500.0 ',' $176,000.0 ','Aug'),('CA-2015-134','8/13/2015',5887,'Lyrica','India','India',8095,15,' $500.0 ',' $7,500.0 ','Aug'),('CA-2015-132','8/12/2015',5887,'Lyrica','India','India',8095,101,' $500.0 ',' $50,500.0 ','Aug'),('CA-2015-188','8/11/2015',5887,'Lyrica','India','India',8095,309,' $500.0 ',' $154,500.0 ','Aug'),('CA-2015-056','8/11/2015',5887,'Lyrica','India','India',8095,95,' $500.0 ',' $47,500.0 ','Aug'),('CA-2015-038','8/1/2015',5887,'Lyrica','Cambodia','Cambodia',8095,295,' $500.0 ',' $147,500.0 ','Aug'),('IN-2015-005','7/9/2015',5704,'OxyContin','Singapore','Singapore',8370,394,' $472.0 ',' $185,968.0 ','Jul'),('CA-2015-119','7/9/2015',5887,'Lyrica','India','India',8095,220,' $500.0 ',' $110,000.0 ','Jul'),('CA-2015-041','7/9/2015',5887,'Lyrica','Utd.Arab Emir.','Utd.Arab Emir.',8095,259,' $500.0 ',' $129,500.0 ','Jul'),('CA-2015-013','7/9/2015',5887,'Lyrica','India','India',8095,135,' $500.0 ',' $67,500.0 ','Jul'),('CA-2015-201','7/9/2015',5887,'Lyrica','Thailand','Thailand',8095,236,' $500.0 ',' $118,000.0 ','Jul'),('CA-2015-197','7/8/2015',5887,'Lyrica','Thailand','Thailand',8095,232,' $500.0 ',' $116,000.0 ','Jul'),('CA-2015-193','7/8/2015',5887,'Lyrica','Indonesia','Indonesia',8095,177,' $500.0 ',' $88,500.0 ','Jul'),('CA-2015-108','7/5/2015',5887,'Lyrica','India','India',8095,429,' $500.0 ',' $214,500.0 ','Jul'),('CA-2015-094','7/4/2015',5887,'Lyrica','India','India',8095,203,' $500.0 ',' $101,500.0 ','Jul'),('CA-2015-095','7/31/2015',5887,'Lyrica','India','India',8095,496,' $500.0 ',' $248,000.0 ','Jul'),('CA-2015-136','7/30/2015',5887,'Lyrica','India','India',8095,209,' $500.0 ',' $104,500.0 ','Jul'),('CA-2015-157','7/3/2015',5887,'Lyrica','India','India',8095,487,' $500.0 ',' $243,500.0 ','Jul'),('CA-2015-027','7/27/2015',5887,'Lyrica','India','India',8095,227,' $500.0 ',' $113,500.0 ','Jul'),('CA-2015-020','7/27/2015',5887,'Lyrica','India','India',8095,254,' $500.0 ',' $127,000.0 ','Jul'),('CA-2015-155','7/25/2015',5887,'Lyrica','India','India',8095,45,' $500.0 ',' $22,500.0 ','Jul'),('CA-2015-158','7/24/2015',5887,'Lyrica','India','India',8095,263,' $500.0 ',' $131,500.0 ','Jul'),('CA-2015-049','7/23/2015',5887,'Lyrica','Egypt','Egypt',8095,3,' $500.0 ',' $1,500.0 ','Jul'),('CA-2015-070','7/23/2015',5887,'Lyrica','India','India',8095,497,' $500.0 ',' $248,500.0 ','Jul'),('CA-2015-126','7/22/2015',5887,'Lyrica','India','India',8095,83,' $500.0 ',' $41,500.0 ','Jul'),('CA-2015-014','7/22/2015',5887,'Lyrica','India','India',8095,379,' $500.0 ',' $189,500.0 ','Jul'),('CA-2015-103','7/22/2015',5887,'Lyrica','India','India',8095,213,' $500.0 ',' $106,500.0 ','Jul'),('CA-2015-181','7/20/2015',5887,'Lyrica','India','India',8095,61,' $500.0 ',' $30,500.0 ','Jul'),('CA-2015-023','7/20/2015',5887,'Lyrica','India','India',8095,240,' $500.0 ',' $120,000.0 ','Jul'),('TA-2015-035','7/15/2015',5704,'Cymbalta','India','India',8370,232,' $453.0 ',' $105,096.0 ','Jul'),('CA-2015-196','7/12/2015',5887,'Lyrica','Indonesia','Indonesia',8095,136,' $500.0 ',' $68,000.0 ','Jul'),('CA-2015-055','7/1/2015',5887,'Lyrica','India','India',8095,205,' $500.0 ',' $102,500.0 ','Jul'),('CA-2015-120','6/8/2015',5887,'Lyrica','India','India',8095,42,' $500.0 ',' $21,000.0 ','Jun'),('CA-2015-039','6/7/2015',5887,'Lyrica','India','India',8095,180,' $500.0 ',' $90,000.0 ','Jun'),('CA-2015-116','6/7/2015',5887,'Lyrica','India','India',8095,201,' $500.0 ',' $100,500.0 ','Jun'),('CA-2015-051','6/5/2015',5887,'Lyrica','India','India',8095,128,' $500.0 ',' $64,000.0 ','Jun'),('IN-2015-002','6/30/2015',5704,'OxyContin','Thailand','Thailand',8370,374,' $472.0 ',' $176,528.0 ','Jun'),('CA-2015-084','6/3/2015',5887,'Lyrica','India','India',8095,435,' $500.0 ',' $217,500.0 ','Jun'),('CA-2015-086','6/29/2015',5887,'Lyrica','Thailand','Philippines',8095,244,' $500.0 ',' $122,000.0 ','Jun'),('CA-2015-037','6/28/2015',5887,'Lyrica','India','India',8095,191,' $500.0 ',' $95,500.0 ','Jun'),('CA-2015-122','6/26/2015',5887,'Lyrica','India','India',8095,175,' $500.0 ',' $87,500.0 ','Jun'),('CA-2015-140','6/26/2015',5887,'Lyrica','Indonesia','Indonesia',8095,185,' $500.0 ',' $92,500.0 ','Jun'),('CA-2015-080','6/25/2015',5887,'Lyrica','India','India',8095,470,' $500.0 ',' $235,000.0 ','Jun'),('CA-2015-053','6/19/2015',5887,'Lyrica','India','India',8095,391,' $500.0 ',' $195,500.0 ','Jun'),('CA-2015-082','6/17/2015',5887,'Lyrica','India','India',8095,321,' $500.0 ',' $160,500.0 ','Jun'),('CA-2015-194','6/14/2015',5887,'Lyrica','Thailand','Thailand',8095,236,' $500.0 ',' $118,000.0 ','Jun'),('CA-2015-018','6/12/2015',5887,'Lyrica','Thailand','Thailand',8095,119,' $500.0 ',' $59,500.0 ','Jun'),('CA-2015-165','6/10/2015',5887,'Lyrica','India','India',8095,466,' $500.0 ',' $233,000.0 ','Jun'),('CA-2015-111','6/10/2015',5887,'Lyrica','India','India',8095,279,' $500.0 ',' $139,500.0 ','Jun'),('CA-2015-091','6/1/2015',5887,'Lyrica','India','India',8095,32,' $500.0 ',' $16,000.0 ','Jun'),('IN-2015-004','5/9/2015',5704,'OxyContin','Australia','Australia',8370,227,' $472.0 ',' $107,144.0 ','May'),('CA-2015-017','5/4/2015',5887,'Lyrica','Thailand','Thailand',8095,365,' $500.0 ',' $182,500.0 ','May'),('CA-2015-034','5/4/2015',5887,'Lyrica','Sudan','Utd.Arab Emir.',8095,306,' $500.0 ',' $153,000.0 ','May'),('CA-2015-074','5/30/2015',5887,'Lyrica','India','India',8095,113,' $500.0 ',' $56,500.0 ','May'),('CA-2015-164','5/24/2015',5887,'Lyrica','India','India',8095,352,' $500.0 ',' $176,000.0 ','May'),('CA-2015-085','5/23/2015',5887,'Lyrica','India','India',8095,208,' $500.0 ',' $104,000.0 ','May'),('IN-2015-208','5/22/2015',5685,'Avastin','India','India',8209,380,' $243.0 ',' $92,340.0 ','May'),('CA-2015-187','5/21/2015',5887,'Lyrica','India','India',8095,349,' $500.0 ',' $174,500.0 ','May'),('CA-2015-191','5/21/2015',5887,'Lyrica','Syria','Lebanon',8095,1,' $500.0 ',' $500.0 ','May'),('CA-2015-069','5/19/2015',5887,'Lyrica','India','India',8095,431,' $500.0 ',' $215,500.0 ','May'),('IN-2015-207','5/17/2015',5685,'Avastin','India','India',8209,97,' $243.0 ',' $23,571.0 ','May'),('CA-2015-167','5/17/2015',5887,'Lyrica','India','India',8095,123,' $500.0 ',' $61,500.0 ','May'),('CA-2015-019','5/13/2015',5887,'Lyrica','Thailand','Thailand',8095,127,' $500.0 ',' $63,500.0 ','May'),('CA-2015-198','5/13/2015',5887,'Lyrica','Malaysia','Malaysia',8095,143,' $500.0 ',' $71,500.0 ','May'),('CA-2015-088','5/12/2015',5887,'Lyrica','Yemen','Yemen',8095,214,' $500.0 ',' $107,000.0 ','May'),('IN-2015-007','4/9/2015',5704,'OxyContin','Thailand','Thailand',8370,129,' $472.0 ',' $60,888.0 ','Apr'),('CA-2015-065','4/9/2015',5887,'Lyrica','India','India',8095,404,' $500.0 ',' $202,000.0 ','Apr'),('CA-2015-161','4/9/2015',5887,'Lyrica','India','India',8095,267,' $500.0 ',' $133,500.0 ','Apr'),('CA-2015-026','4/6/2015',5887,'Lyrica','India','India',8095,416,' $500.0 ',' $208,000.0 ','Apr'),('CA-2015-104','4/6/2015',5887,'Lyrica','India','India',8095,296,' $500.0 ',' $148,000.0 ','Apr'),('IN-2015-205','4/6/2015',5685,'Avastin','India','India',8209,265,' $243.0 ',' $64,395.0 ','Apr'),('CA-2015-184','4/5/2015',5887,'Lyrica','India','India',8095,91,' $500.0 ',' $45,500.0 ','Apr'),('IN-2015-206','4/3/2015',5685,'Avastin','India','India',8209,285,' $243.0 ',' $69,255.0 ','Apr'),('CA-2015-077','4/28/2015',5887,'Lyrica','Thailand','Philippines',8095,122,' $500.0 ',' $61,000.0 ','Apr'),('CA-2015-199','4/27/2015',5887,'Lyrica','Egypt','Egypt',8095,290,' $500.0 ',' $145,000.0 ','Apr'),('CA-2015-109','4/25/2015',5887,'Lyrica','Uganda','Netherlands',8095,103,' $500.0 ',' $51,500.0 ','Apr'),('CA-2015-045','4/24/2015',5887,'Lyrica','India','India',8095,261,' $500.0 ',' $130,500.0 ','Apr'),('IN-2015-010','4/21/2015',5704,'OxyContin','Egypt','Egypt',8370,109,' $472.0 ',' $51,448.0 ','Apr'),('CA-2015-176','4/2/2015',5887,'Lyrica','India','India',8095,156,' $500.0 ',' $78,000.0 ','Apr'),('CA-2015-101','4/17/2015',5887,'Lyrica','India','India',8095,58,' $500.0 ',' $29,000.0 ','Apr'),('CA-2015-083','4/11/2015',5887,'Lyrica','India','India',8095,118,' $500.0 ',' $59,000.0 ','Apr'),('CA-2015-029','4/11/2015',5887,'Lyrica','India','India',8095,491,' $500.0 ',' $245,500.0 ','Apr'),('CA-2015-096','4/10/2015',5887,'Lyrica','India','India',8095,351,' $500.0 ',' $175,500.0 ','Apr'),('CA-2015-105','3/8/2015',5887,'Lyrica','Sudan','South Korea',8095,127,' $500.0 ',' $63,500.0 ','Mar'),('CA-2015-127','3/8/2015',5887,'Lyrica','India','India',8095,474,' $500.0 ',' $237,000.0 ','Mar'),('CA-2015-177','3/8/2015',5887,'Lyrica','India','India',8095,390,' $500.0 ',' $195,000.0 ','Mar'),('CA-2015-071','3/6/2015',5887,'Lyrica','India','India',8095,472,' $500.0 ',' $236,000.0 ','Mar'),('CA-2015-098','3/5/2015',5887,'Lyrica','India','India',8095,136,' $500.0 ',' $68,000.0 ','Mar'),('CA-2015-031','3/31/2015',5887,'Lyrica','India','India',8095,167,' $500.0 ',' $83,500.0 ','Mar'),('CA-2015-048','3/30/2015',5887,'Lyrica','India','India',8095,220,' $500.0 ',' $110,000.0 ','Mar'),('IN-2015-008','3/30/2015',5704,'OxyContin','Thailand','Thailand',8370,310,' $472.0 ',' $146,320.0 ','Mar'),('CA-2015-087','3/28/2015',5887,'Lyrica','India','India',8095,312,' $500.0 ',' $156,000.0 ','Mar'),('CA-2015-062','3/27/2015',5887,'Lyrica','South Korea','South Korea',8095,111,' $500.0 ',' $55,500.0 ','Mar'),('CA-2015-089','3/24/2015',5887,'Lyrica','Sudan','South Korea',8095,458,' $500.0 ',' $229,000.0 ','Mar'),('CA-2015-156','3/24/2015',5887,'Lyrica','India','India',8095,317,' $500.0 ',' $158,500.0 ','Mar'),('CA-2015-143','3/23/2015',5887,'Lyrica','India','India',8095,348,' $500.0 ',' $174,000.0 ','Mar'),('CA-2015-180','3/23/2015',5887,'Lyrica','Egypt','Egypt',8095,113,' $500.0 ',' $56,500.0 ','Mar'),('CA-2015-130','3/18/2015',5887,'Lyrica','India','India',8095,470,' $500.0 ',' $235,000.0 ','Mar'),('CA-2015-160','3/14/2015',5887,'Lyrica','India','India',8095,197,' $500.0 ',' $98,500.0 ','Mar'),('CA-2015-047','3/12/2015',5887,'Lyrica','Thailand','Thailand',8095,189,' $500.0 ',' $94,500.0 ','Mar'),('CA-2015-185','3/11/2015',5887,'Lyrica','India','India',8095,424,' $500.0 ',' $212,000.0 ','Mar'),('CA-2015-022','2/9/2015',5887,'Lyrica','South Africa','South Africa',8095,250,' $500.0 ',' $125,000.0 ','Feb'),('IN-2015-009','2/9/2015',5704,'OxyContin','Thailand','Thailand',8370,111,' $472.0 ',' $52,392.0 ','Feb'),('CA-2015-067','2/8/2015',5887,'Lyrica','Vietnam','Netherlands',8095,247,' $500.0 ',' $123,500.0 ','Feb'),('CA-2015-149','2/7/2015',5887,'Lyrica','India','India',8095,153,' $500.0 ',' $76,500.0 ','Feb'),('CA-2015-042','2/25/2015',5887,'Lyrica','India','India',8095,211,' $500.0 ',' $105,500.0 ','Feb'),('IN-2015-006','2/25/2015',5704,'OxyContin','Singapore','Singapore',8370,261,' $472.0 ',' $123,192.0 ','Feb'),('CA-2015-102','2/24/2015',5887,'Lyrica','Sudan','South Korea',8095,360,' $500.0 ',' $180,000.0 ','Feb'),('CA-2015-162','2/23/2015',5887,'Lyrica','India','India',8095,212,' $500.0 ',' $106,000.0 ','Feb'),('CA-2015-016','2/23/2015',5887,'Lyrica','India','India',8095,468,' $500.0 ',' $234,000.0 ','Feb'),('CA-2015-025','2/22/2015',5887,'Lyrica','Nepal','Nepal',8095,88,' $500.0 ',' $44,000.0 ','Feb'),('CA-2015-173','2/19/2015',5887,'Lyrica','Philippines','Philippines',8095,423,' $500.0 ',' $211,500.0 ','Feb'),('CA-2015-058','2/16/2015',5887,'Lyrica','India','India',8095,139,' $500.0 ',' $69,500.0 ','Feb'),('CA-2015-099','2/15/2015',5887,'Lyrica','India','India',8095,343,' $500.0 ',' $171,500.0 ','Feb'),('CA-2015-192','2/15/2015',5887,'Lyrica','Thailand','Thailand',8095,441,' $500.0 ',' $220,500.0 ','Feb'),('CA-2015-175','2/14/2015',5887,'Lyrica','India','India',8095,274,' $500.0 ',' $137,000.0 ','Feb'),('CA-2015-112','2/10/2015',5887,'Lyrica','India','India',8095,221,' $500.0 ',' $110,500.0 ','Feb'),('CA-2015-200','12/9/2015',5887,'Lyrica','Thailand','Thailand',8095,363,' $500.0 ',' $181,500.0 ','Dec'),('CA-2015-021','12/9/2015',5887,'Lyrica','India','India',8095,171,' $500.0 ',' $85,500.0 ','Dec'),('CA-2015-182','12/6/2015',5887,'Lyrica','Vietnam','Japan',8095,240,' $500.0 ',' $120,000.0 ','Dec'),('IN-2015-003','12/5/2015',5704,'OxyContin','Vietnam','Japan',8370,138,' $472.0 ',' $65,136.0 ','Dec'),('CA-2015-076','12/3/2015',5887,'Lyrica','South Korea','South Korea',8095,279,' $500.0 ',' $139,500.0 ','Dec'),('CA-2015-090','12/28/2015',5887,'Lyrica','India','India',8095,348,' $500.0 ',' $174,000.0 ','Dec'),('CA-2015-061','12/27/2015',5887,'Lyrica','India','India',8095,60,' $500.0 ',' $30,000.0 ','Dec'),('CA-2015-117','12/25/2015',5887,'Lyrica','India','India',8095,42,' $500.0 ',' $21,000.0 ','Dec'),('CA-2015-044','12/22/2015',5887,'Lyrica','Malaysia','Malaysia',8095,76,' $500.0 ',' $38,000.0 ','Dec'),('CA-2015-075','12/19/2015',5887,'Lyrica','South Korea','South Korea',8095,181,' $500.0 ',' $90,500.0 ','Dec'),('CA-2015-145','12/19/2015',5887,'Lyrica','India','India',8095,293,' $500.0 ',' $146,500.0 ','Dec'),('CA-2015-148','12/18/2015',5887,'Lyrica','India','India',8095,252,' $500.0 ',' $126,000.0 ','Dec'),('CA-2015-178','12/17/2015',5887,'Lyrica','India','India',8095,226,' $500.0 ',' $113,000.0 ','Dec'),('CA-2015-170','12/16/2015',5887,'Lyrica','Nigeria','Nigeria',8095,292,' $500.0 ',' $146,000.0 ','Dec'),('CA-2015-171','12/16/2015',5887,'Lyrica','Nepal','Nepal',8095,282,' $500.0 ',' $141,000.0 ','Dec'),('CA-2015-078','12/12/2015',5887,'Lyrica','Thailand','Philippines',8095,28,' $500.0 ',' $14,000.0 ','Dec'),('FY-2015-001','11/9/2015',5704,'Abilify','Mexico','Mexico',8370,450,' $204.0 ',' $91,800.0 ','Nov'),('AR-2015-113','11/4/2015',5653,'Lantus Solostar','India','India',7933,137,' $231.0 ',' $31,647.0 ','Nov'),('CA-2015-052','11/27/2015',5887,'Lyrica','India','India',8095,264,' $500.0 ',' $132,000.0 ','Nov'),('CA-2015-068','11/26/2015',5887,'Lyrica','India','India',8095,459,' $500.0 ',' $229,500.0 ','Nov'),('CA-2015-093','11/25/2015',5887,'Lyrica','India','India',8095,499,' $500.0 ',' $249,500.0 ','Nov'),('CA-2015-032','11/24/2015',5887,'Lyrica','India','India',8095,485,' $500.0 ',' $242,500.0 ','Nov'),('CA-2015-114','11/22/2015',5887,'Lyrica','Thailand','Thailand',8095,3,' $500.0 ',' $1,500.0 ','Nov'),('CA-2015-024','11/22/2015',5887,'Lyrica','India','India',8095,365,' $500.0 ',' $182,500.0 ','Nov'),('CA-2015-151','11/2/2015',5887,'Lyrica','Nepal','Nepal',8095,73,' $500.0 ',' $36,500.0 ','Nov'),('CA-2015-202','11/16/2015',5887,'Lyrica','India','India',8095,372,' $500.0 ',' $186,000.0 ','Nov'),('CA-2015-011','11/16/2015',5887,'Lyrica','India','India',8095,46,' $500.0 ',' $23,000.0 ','Nov'),('CA-2015-121','11/15/2015',5887,'Lyrica','India','India',8095,230,' $500.0 ',' $115,000.0 ','Nov'),('CA-2015-186','11/12/2015',5887,'Lyrica','India','India',8095,19,' $500.0 ',' $9,500.0 ','Nov'),('CA-2015-141','11/11/2015',5887,'Lyrica','India','India',8095,203,' $500.0 ',' $101,500.0 ','Nov'),('CA-2015-107','11/1/2015',5887,'Lyrica','India','India',8095,291,' $500.0 ',' $145,500.0 ','Nov'),('CA-2015-142','11/1/2015',5887,'Lyrica','Thailand','Thailand',8095,279,' $500.0 ',' $139,500.0 ','Nov'),('CA-2015-073','10/7/2015',5887,'Lyrica','India','India',8095,119,' $500.0 ',' $59,500.0 ','Oct'),('CA-2015-163','10/7/2015',5887,'Lyrica','India','India',8095,7,' $500.0 ',' $3,500.0 ','Oct'),('IN-2015-204','10/5/2015',5685,'Avastin','India','India',8209,325,' $243.0 ',' $78,975.0 ','Oct'),('CA-2015-144','10/4/2015',5887,'Lyrica','India','India',8095,406,' $500.0 ',' $203,000.0 ','Oct'),('CA-2015-131','10/30/2015',5887,'Lyrica','India','India',8095,433,' $500.0 ',' $216,500.0 ','Oct'),('CA-2015-036','10/3/2015',5887,'Lyrica','Egypt','Egypt',8095,77,' $500.0 ',' $38,500.0 ','Oct'),('CA-2015-043','10/26/2015',5887,'Lyrica','Malaysia','Malaysia',8095,175,' $500.0 ',' $87,500.0 ','Oct'),('CA-2015-129','10/22/2015',5887,'Lyrica','India','India',8095,49,' $500.0 ',' $24,500.0 ','Oct'),('CA-2015-135','10/22/2015',5887,'Lyrica','India','India',8095,136,' $500.0 ',' $68,000.0 ','Oct'),('CA-2015-154','10/2/2015',5887,'Lyrica','India','India',8095,117,' $500.0 ',' $58,500.0 ','Oct'),('CA-2015-168','10/19/2015',5887,'Lyrica','India','India',8095,247,' $500.0 ',' $123,500.0 ','Oct'),('AR-2015-203','10/16/2015',5653,'Lantus Solostar','India','India',7933,426,' $231.0 ',' $98,406.0 ','Oct'),('CA-2015-115','10/15/2015',5887,'Lyrica','India','India',8095,109,' $500.0 ',' $54,500.0 ','Oct'),('AR-2015-137','10/14/2015',5653,'Lantus Solostar','India','India',7933,64,' $231.0 ',' $14,784.0 ','Oct'),('CA-2015-054','10/14/2015',5887,'Lyrica','India','India',8095,157,' $500.0 ',' $78,500.0 ','Oct'),('CA-2015-153','10/13/2015',5887,'Lyrica','India','India',8095,469,' $500.0 ',' $234,500.0 ','Oct'),('CA-2015-179','10/13/2015',5887,'Lyrica','India','India',8095,204,' $500.0 ',' $102,000.0 ','Oct'),('AR-2015-133','10/13/2015',5653,'Lantus Solostar','India','India',7933,272,' $231.0 ',' $62,832.0 ','Oct'),('CA-2015-123','10/13/2015',5887,'Lyrica','India','India',8095,199,' $500.0 ',' $99,500.0 ','Oct'),('CA-2015-015','10/12/2015',5887,'Lyrica','India','India',8095,104,' $500.0 ',' $52,000.0 ','Oct'),('CA-2015-138','10/10/2015',5887,'Lyrica','Cambodia','Cambodia',8095,250,' $500.0 ',' $125,000.0 ','Oct'),('CA-2015-139','1/8/2015',5887,'Lyrica','Indonesia','Indonesia',8095,441,' $500.0 ',' $220,500.0 ','Jan'),('CA-2015-059','1/6/2015',5887,'Lyrica','Cambodia','Cambodia',8095,6,' $500.0 ',' $3,000.0 ','Jan'),('CA-2015-195','1/5/2015',5887,'Lyrica','Vietnam','Japan',8095,325,' $500.0 ',' $162,500.0 ','Jan'),('CA-2015-124','1/27/2015',5887,'Lyrica','India','India',8095,189,' $500.0 ',' $94,500.0 ','Jan'),('CA-2015-050','1/25/2015',5887,'Lyrica','Egypt','Egypt',8095,277,' $500.0 ',' $138,500.0 ','Jan'),('CA-2015-152','1/25/2015',5887,'Lyrica','Nepal','Nepal',8095,421,' $500.0 ',' $210,500.0 ','Jan'),('CA-2015-097','1/24/2015',5887,'Lyrica','India','India',8095,305,' $500.0 ',' $152,500.0 ','Jan'),('CA-2015-030','1/23/2015',5887,'Lyrica','India','India',8095,465,' $500.0 ',' $232,500.0 ','Jan'),('CA-2015-183','1/21/2015',5887,'Lyrica','Australia','Australia',8095,184,' $500.0 ',' $92,000.0 ','Jan'),('CA-2015-081','1/19/2015',5887,'Lyrica','India','India',8095,244,' $500.0 ',' $122,000.0 ','Jan'),('CA-2015-172','1/1/2015',5887,'Lyrica','Philippines','Philippines',8095,1,' $500.0 ',' $500.0 ','Jan');


-- -----------------------------------------------------
-- Table `pharmaceutical_schema`.`Pharmacy1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pharmaceutical_schema`.`pharmacy1` ;

CREATE TABLE IF NOT EXISTS `pharmaceutical_schema`.`pharmacy1` (
	id	INTEGER NOT NULL auto_increment,
	brand_name	VARCHAR(20) NOT NULL,
    quantity	Integer,
    price	float,
    primary key (id)
);

INSERT INTO pharmacy1 VALUES (1, 'Abilify', 75, 19.99);
INSERT INTO pharmacy1 VALUES (2, 'Avastin', 300, 7.99);
INSERT INTO pharmacy1 VALUES (3, 'Cymbalta', 15, 120.00);
INSERT INTO pharmacy1 VALUES (4, 'Lantus Solostar', 55, 29.99);
INSERT INTO pharmacy1 VALUES (5, 'Lyrica', 125, 13.99);
INSERT INTO pharmacy1 VALUES (6, 'Oxycontin', 7, 199.99);

-- -----------------------------------------------------
-- Table `pharmaceutical_schema`.`Pharmacy1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pharmaceutical_schema`.`pharmacy2` ;

CREATE TABLE IF NOT EXISTS `pharmaceutical_schema`.`pharmacy2` (
	id	INTEGER NOT NULL auto_increment,
	brand_name	VARCHAR(20) NOT NULL,
    quantity	Integer,
    price	float,
    primary key (id)
);

INSERT INTO pharmacy2 VALUES (1, 'Abilify', 95, 17.99);
INSERT INTO pharmacy2 VALUES (2, 'Avastin', 300, 5.99);
INSERT INTO pharmacy2 VALUES (3, 'Cymbalta', 15, 150.00);
INSERT INTO pharmacy2 VALUES (4, 'Lantus Solostar', 75, 25.99);
INSERT INTO pharmacy2 VALUES (5, 'Lyrica', 111, 15.99);
INSERT INTO pharmacy2 VALUES (6, 'Oxycontin', 3, 239.99);

-- -----------------------------------------------------
-- create user : admin
-- -----------------------------------------------------
DROP USER IF EXISTS 'admin';
CREATE USER IF NOT exists 'admin'@'%'
identified by 'admin';
-- grant priviliges
GRANT SELECT ON pharmaceutical_schema.* TO 'admin'@'%';
GRANT INSERT ON pharmaceutical_schema.* TO 'admin'@'%';
GRANT DELETE ON pharmaceutical_schema.* TO 'admin'@'%';
GRANT UPDATE ON pharmaceutical_schema.* TO 'admin'@'%';
-- GRANT CREATE ON pharmaceutical_schema.* TO 'admin'@'%';

-- -----------------------------------------------------
-- create user : pharmacy1
-- -----------------------------------------------------
DROP USER IF EXISTS pharmacy1;
CREATE USER IF NOT exists 'pharmacy1'@'%'
identified by 'pharmacy1';
-- grant priviliges
GRANT SELECT ON pharmaceutical_schema.pharmacy1 TO 'pharmacy1'@'%';
GRANT SELECT ON pharmaceutical_schema.drugs TO 'pharmacy1'@'%';
GRANT SELECT ON pharmaceutical_schema.companies TO 'pharmacy1'@'%';
GRANT insert ON pharmaceutical_schema.pharmacy1 TO 'pharmacy1'@'%';
GRANT UPDATE ON pharmaceutical_schema.pharmacy1 TO 'pharmacy1'@'%';
GRANT DELETE ON pharmaceutical_schema.pharmacy1 TO 'pharmacy1'@'%';
-- REVOKE SELECT ON pharmaceutical_schema.pharmacy2 from 'pharmacy1'@'%';


-- -----------------------------------------------------
-- create user : pharmacy2
-- -----------------------------------------------------
DROP USER IF EXISTS pharmacy2;
CREATE USER IF NOT exists 'pharmacy2'@'%';
-- grant priviliges
GRANT SELECT ON pharmaceutical_schema.pharmacy2 TO 'pharmacy2'@'%';
GRANT SELECT ON pharmaceutical_schema.drugs TO 'pharmacy2'@'%';
GRANT SELECT ON pharmaceutical_schema.companies TO 'pharmacy2'@'%';
GRANT insert ON pharmaceutical_schema.pharmacy2 TO 'pharmacy2'@'%';
GRANT UPDATE ON pharmaceutical_schema.pharmacy2 TO 'pharmacy2'@'%';
GRANT DELETE ON pharmaceutical_schema.pharmacy2 TO 'pharmacy2'@'%';
-- REVOKE SELECT ON pharmaceutical_schema.pharmacy1 from 'pharmacy2'@'%';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
