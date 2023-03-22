/* Function to create the data base */
CREATE DATABASE IF NOT EXISTS Library ;

USE Library;

/*
    Function to create the language table :
    Primary key : LA_Id
*/
CREATE TABLE T_Language
(
    LA_Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    LA_Name VARCHAR(255) NOT NULL
);

/*
    Function to create the editor table
    Primary key : ED_Id
*/
CREATE TABLE T_Editor
(
    ED_Id INT NOT NULL AUTO_INCREMENT ,
    ED_Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ED_Id)
);

/*
    Function to create the book table
    Primary key : BO_Id
    Foreign key : BO_Editor reference T_Editor.ED_Id
*/
CREATE TABLE T_Book
( 
  BO_Id INT NOT NULL AUTO_INCREMENT ,
  BO_Name VARCHAR(255) NOT NULL,
  BO_Summary VARCHAR(255) ,
  BO_NbPages INT ,
  BO_Editor INT NOT NULL,
  BO_LinkImg VARCHAR(255) ,
  PRIMARY KEY(BO_Id) ,
  FOREIGN KEY (BO_Editor) REFERENCES T_Editor(ED_Id)
);

/*
    Fucntion to create the user table
    Primary key : US_Id
*/
CREATE TABLE T_User
(
    US_Id INT NOT NULL AUTO_INCREMENT ,
    US_Name VARCHAR(255) NOT NULL ,
    US_Email VARCHAR(255) NOT NULL,
    US_Password VARCHAR(255) NOT NULL,
    US_ProfilePicture VARCHAR(255) ,
    PRIMARY KEY(US_Id) 
);

/*
    Function to create the categories table
    Primary key : CA_Id
*/
CREATE TABLE T_Categories
(
    CA_Id INT NOT NULL AUTO_INCREMENT ,
    CA_Name VARCHAR(255) NOT NULL ,
    PRIMARY KEY (CA_Id)
);

/*
    Function to create the authors table
    Primary key : AU_Id
*/
CREATE TABLE T_Authors
(
    AU_Id INT NOT NULL AUTO_INCREMENT ,
    AU_Name VARCHAR(255) NOT NULL ,
    PRIMARY KEY (AU_Id)
);

/*
    Function to create the userBook table 
        (it will be used to manage the Borrowed books)
    Primary key : UB_IdUser, Ub_IdBook
    Foreign key : UB_IdUser reference T_User.US_Id, UB_IdBook reference T_Book.Bo_Id
*/
CREATE TABLE T_UserBook
(
    UB_IdUser INT NOT NULL ,
    UB_IdBook INT NOT NULL ,
    UB_DateBorrowed DATE NOT NULL,
    UB_DateGivenBack DATE ,
    UB_NumberSeen INT NOT NULL,
    PRIMARY KEY (UB_IdBook, UB_IdUser) ,
   	FOREIGN KEY (UB_IdUser) REFERENCES T_User(US_Id) ,
	FOREIGN KEY (UB_IdBook) REFERENCES T_Book(BO_Id)
);

/*
    Function to create the bookCategories table
        (it will be used to manage the differents categories of books)
    Primary key : BC_IdCatgories, BC_IdBook
    Foreign key : BC_IdCategories reference T_Categories.CA_Id, BC_IdBook reference T_Book.BO_Id
*/
CREATE TABLE T_BookCategories
(
    BC_IdCategories INT NOT NULL ,
    BC_IdBook INT NOT NULL ,
    PRIMARY KEY (BC_IdBook, BC_IdCategories) ,
    FOREIGN KEY (BC_IdCategories) REFERENCES T_Categories(CA_Id) ,
    FOREIGN KEY (BC_IdBook) REFERENCES T_Book(BO_Id)
);

/*
    Function to create the follow table
    Primary key : F_IdFollower, F_IdFollowed (F_IdFollower and F_IdFollowed must be different)
    Foreign key : F_IdFollowed reference T_User.US_Id, F_IdFollower reference T_User.US_Id
*/
CREATE TABLE T_Follow
(
    F_IdFollower INT NOT NULL , 
    F_IdFollowed INT NOT NULL ,
    PRIMARY KEY (F_IdFollowed, F_IdFollower) ,
    FOREIGN KEY (F_IdFollowed) REFERENCES T_User(US_Id) ,
    FOREIGN KEY (F_IdFollower) REFERENCES T_User(US_Id) ,
    CHECK (F_IdFollowed <> F_IdFollower)
);

/*
    Function to create the AvailableLanguages table
    Primary key : AL_IdLangauge, AL_IdBook
    Foreign key : AL_IdBook reference T_Book.BO_Id, AL_Language reference T_Language.LA_Id
*/
CREATE TABLE T_AvailableLanguages
(
    AL_IdLanguage INT NOT NULL ,
    AL_IdBook INT NOT NULL ,
    PRIMARY KEY (AL_IdBook, AL_IdLanguage) ,
    FOREIGN KEY (AL_IdBook) REFERENCES T_Book(BO_Id) ,
    FOREIGN KEY (AL_IdLanguage) REFERENCES T_Language(LA_Id)
);

/*
    Function to create the BookAuthors table
        (it will be used to manage the differents authors for books)
    Primary key : W_IdBook, W_IdAuthor
    Foreign key : W_IdAuthor reference T_Author.AU_Id, W_IdBook reference T_Book.Bo_Id
*/
CREATE TABLE T_BookAuthors
(
    W_IdBook INT NOT NULL ,
    W_IdAuthor INT NOT NULL ,
    PRIMARY KEY (W_IdAuthor, W_IdBook) ,
    FOREIGN KEY (W_IdAuthor) REFERENCES T_Authors(AU_Id) ,
    FOREIGN KEY (W_IdBook) REFERENCES T_Book(BO_Id)
);
