CREATE DATABASE IF NOT EXISTS `library`;
USE `library`;

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `AUT_Id` int(11) NOT NULL,
  `AUT_Name` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `BOO_Id` int(11) NOT NULL,
  `BOO_Editor_id` int(11) NULL,
  `BOO_Name` varchar(255) NOT NULL,
  `BOO_Summary` varchar(5000) DEFAULT NULL,
  `BOO_Nb_pages` int(11) DEFAULT NULL,
  `BOO_Link_img` varchar(255) DEFAULT NULL
);

DROP TABLE IF EXISTS `book_author`;
CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
);

DROP TABLE IF EXISTS `book_categories`;
CREATE TABLE `book_categories` (
  `book_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
);

DROP TABLE IF EXISTS `book_language`;
CREATE TABLE `book_language` (
  `book_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
);

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CAT_Id` int(11) NOT NULL,
  `CAT_Name` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `editor`;
CREATE TABLE `editor` (
  `EDI_Id` int(11) NOT NULL,
  `EDI_Name` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `LAN_Id` int(11) NOT NULL,
  `LAN_Name` varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USR_Id` int(11) NOT NULL,
  `USR_Name` varchar(255) NOT NULL,
  `USR_First_name` varchar(255) NOT NULL,
  `USR_Email` varchar(255) NOT NULL,
  `USR_Password` varchar(255) NOT NULL,
  `USR_Profile_picture` varchar(255) DEFAULT NULL
);

DROP TABLE IF EXISTS `user_book`;
CREATE TABLE `user_book` (
  `USB_Id` int(11) NOT NULL,
  `USB_User_id` int(11) NOT NULL,
  `USB_Book_id` int(11) NOT NULL,
  `USB_Date_borrowed` date NOT NULL,
  `USB_Date_given_back` date DEFAULT NULL
) ;

DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user` (
  `user_source` int(11) NOT NULL,
  `user_target` int(11) NOT NULL
);

DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `GRD_User_Id` int(11) NOT NULL,
  `GRD_Book_Id` int(11) NOT NULL,
  `GRD_Grade` int(2) NOT NULL
);

ALTER TABLE `author`
  ADD PRIMARY KEY (`AUT_Id`);

ALTER TABLE `book`
  ADD PRIMARY KEY (`BOO_Id`),
  ADD KEY (`BOO_Editor_id`);

ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY (`book_id`),
  ADD KEY (`author_id`);

ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`book_id`,`categories_id`),
  ADD KEY (`book_id`),
  ADD KEY (`categories_id`);

ALTER TABLE `book_language`
  ADD PRIMARY KEY (`book_id`,`language_id`),
  ADD KEY (`book_id`),
  ADD KEY (`language_id`);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`CAT_Id`);

ALTER TABLE `editor`
  ADD PRIMARY KEY (`EDI_Id`);

ALTER TABLE `language`
  ADD PRIMARY KEY (`LAN_Id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`USR_Id`);

ALTER TABLE `user_book`
  ADD PRIMARY KEY (`USB_Id`),
  ADD KEY (`USB_User_id`),
  ADD KEY (`USB_Book_id`);

ALTER TABLE `user_user`
  ADD PRIMARY KEY (`user_source`,`user_target`),
  ADD KEY (`user_source`),
  ADD KEY (`user_target`);

ALTER TABLE `grade`
  ADD PRIMARY KEY (`GRD_User_Id`, `GRD_Book_Id`);

ALTER TABLE `author`
  MODIFY `AUT_ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `book`
  MODIFY `BOO_Id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `categories`
  MODIFY `CAT_Id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `editor`
  MODIFY `EDI_Id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `language`
  MODIFY `LAN_Id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user`
  MODIFY `USR_Id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_book`
  MODIFY `USB_Id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `book`
  ADD CONSTRAINT FOREIGN KEY (`boo_editor_id`) REFERENCES `editor` (`EDI_Id`);

ALTER TABLE `book_author`
  ADD CONSTRAINT FOREIGN KEY (`book_id`) REFERENCES `book` (`BOO_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT FOREIGN KEY (`author_id`) REFERENCES `author` (`AUT_Id`) ON DELETE CASCADE;

ALTER TABLE `book_categories`
  ADD CONSTRAINT FOREIGN KEY (`book_id`) REFERENCES `book` (`BOO_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT FOREIGN KEY (`categories_id`) REFERENCES `categories` (`CAT_Id`) ON DELETE CASCADE;

ALTER TABLE `book_language`
  ADD CONSTRAINT FOREIGN KEY (`book_id`) REFERENCES `book` (`BOO_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT FOREIGN KEY (`language_id`) REFERENCES `language` (`LAN_Id`) ON DELETE CASCADE;

ALTER TABLE `user_book`
  ADD CONSTRAINT FOREIGN KEY (`USB_Book_id`) REFERENCES `book` (`BOO_Id`),
  ADD CONSTRAINT FOREIGN KEY (`USB_User_id`) REFERENCES `user` (`USR_Id`);

ALTER TABLE `user_user`
  ADD CONSTRAINT FOREIGN KEY (`user_target`) REFERENCES `user` (`USR_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT FOREIGN KEY (`user_source`) REFERENCES `user` (`USR_Id`) ON DELETE CASCADE;

ALTER TABLE `grade`
  ADD CONSTRAINT FOREIGN KEY (`GRD_Book_Id`) REFERENCES `book` (`BOO_Id`),
  ADD CONSTRAINT FOREIGN KEY (`GRD_User_Id`) REFERENCES `user` (`USR_Id`);



DELIMITER//
CREATE TRIGGER `grade_constraint` 
BEFORE INSERT 
ON `grade` 
FOR EACH ROW 
BEGIN 
DECLARE usb_id integer; 
SELECT user_book.USB_Id INTO usb_id FROM user_book 
WHERE user_book.USB_Book_id = new.grade.GRD_Book_Id and user_book.USB_User_id = new.grade.GRD_User_Id; 
IF usb_id is null 
THEN SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = "You've never borrowed this book"; 
END IF; 
END;
DELIMITER;

COMMIT;
