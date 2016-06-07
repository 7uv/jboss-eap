--
-- JBoss, Home of Professional Open Source
-- Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
-- contributors by the @authors tag. See the copyright.txt in the
-- distribution for a full listing of individual contributors.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- http://www.apache.org/licenses/LICENSE-2.0
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

-- You can use this file to load seed data into the database using SQL statements
CREATE TABLE `Member` (
  `id`           BIGINT(20)   NOT NULL,
  `email`        VARCHAR(255) NOT NULL,
  `name`         VARCHAR(25)  NOT NULL,
  `phone_number` VARCHAR(12)  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9qv6yhjqm8iafto8qk452gx8h` (`email`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- drop table stock_inventory;

CREATE TABLE `stock_inventory` (
  `id`        BIGINT(20)     NOT NULL,
  `from_date` DATETIME       NOT NULL,
  `to_date`   DATETIME       NOT NULL,
  `dept`      VARCHAR(12)    NOT NULL,
  `lob_head`  VARCHAR(255) DEFAULT NULL,
  `item_type` VARCHAR(255)   NOT NULL,
  `item_form` VARCHAR(255)   NOT NULL,
  `isbn`      VARCHAR(255)   NOT NULL,
  `price`     DECIMAL(10, 0) NOT NULL,
  `curr`      VARCHAR(3)   DEFAULT NULL,
  `qnty`      INT(12)        NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9qv6yhjqm8iafto8qk452gx8h` (`isbn`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

INSERT INTO Member (id, name, email, phone_number) VALUES (0, 'John Smith', 'john.smith@mailinator.com', '2125551212');
INSERT INTO stock_inventory VALUES (7, '2014-01-05', '2019-01-28', 'IT', 'Markets', 'PC Hardware', 'Rack Mount Server',
                                       'A0EE3C98-9R0B-4EF8-BB6D-6BW9BE390C12', '9999.999', 'USD', 2);

CREATE TABLE reports.inventory_mgmt
(
  Sr_No             INT PRIMARY KEY AUTO_INCREMENT,
  User_Id           VARCHAR(255) NOT NULL,
  Login_Name        VARCHAR(255) NOT NULL,
  Domain            VARCHAR(255) NOT NULL,
  Service_Tag       VARCHAR(255) NOT NULL,
  Machine           VARCHAR(255) NOT NULL,
  Model             VARCHAR(255) NOT NULL,
  Processor         VARCHAR(255) NOT NULL,
  Ram_Gb            INT          NOT NULL,
  Hdd_Gb            INT          NOT NULL,
  Operating_System  VARCHAR(255) NOT NULL,
  Open_Office       VARCHAR(255),
  MS_Office_Version VARCHAR(255),
  McAfee_Version    VARCHAR(255),
  Ip_add            VARCHAR(255),
  OS_Serial         VARCHAR(255),
  Last_check        VARCHAR(255)
);
CREATE UNIQUE INDEX inventory_mgmt_Login_Name_uindex ON reports.inventory_mgmt (Login_Name);
ALTER TABLE reports.inventory_mgmt
  COMMENT = 'Inventory of Hardware Items. For software items, look for Software Mgmt and Invoice Mgmt.';