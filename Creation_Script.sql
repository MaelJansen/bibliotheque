CREATE TABLE T_Language
(
    LA_Id INT NOT NULL AUTO_INCREMENT ,
    LA_Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (LA_Id)
);

CREATE TABLE T_Editor
(
    ED_Id INT NOT NULL AUTO_INCREMENT ,
    ED_Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ED_Id)
);

CREATE TABLE T_Book
( 
  BO_Id INT NOT NULL AUTO_INCREMENT ,
  BO_Name VARCHAR(255) NOT NULL,
  BO_Summary VARCHAR(255) ,
  BO_NbPages INT ,
  BO_Editor VARCHAR(255) NOT NULL,
  BO_LinkImg VARCHAR(255) ,
  PRIMARY KEY(BO_Id) ,
  ADD FOREIGN KEY (BO_Editor) REFERENCES T_Editor(ED_Id)
);

CREATE TABLE T_User
(
    US_Id INT NOT NULL AUTO_INCREMENT ,
    US_Name VARCHAR(255) NOT NULL ,
    US_Email VARCHAR(255) NOT NULL,
    US_Password VARCHAR(255) NOT NULL,
    US_ProfilePicture VARCHAR(255) ,
    PRIMARY KEY(US_Id) 
);

CREATE TABLE T_Categories
(
    CA_Id INT NOT NULL AUTO_INCREMENT ,
    CA_Name VARCHAR(255) NOT NULL ,
    PRIMARY KEY (CA_Id)
);

CREATE TABLE T_Authors
(
    AU_Id INT NOT NULL AUTO_INCREMENT ,
    AU_Name VARCHAR(255) NOT NULL ,
    PRIMARY KEY (AU_Id)
);

CREATE TABLE T_UserBook
(
    UB_IdUser INT NOT NULL ,
    UB_IdBook INT NOT NULL ,
    UB_DateBorrowed DATE NOT NULL,
    UB_DateGivenBack DATE ,
    UB_NumberSeen INT NOT NULL,
    PRIMARY KEY (UB_IdBook, UB_IdUser) ,
    ADD FOREIGN KEY (UB_IdUser) REFERENCES T_User(US_Id) ,
    ADD FOREIGN KEY (UB_IdBook) REFERENCES T_Book(BO_Id)
);

CREATE TABLE T_BookCategories
(
    BC_IdCategories INT NOT NULL ,
    BC_IdBook INT NOT NULL ,
    PRIMARY KEY (BC_IdBook, BC_IdCategories) ,
    ADD FOREIGN KEY (BC_IdCategories) REFERENCES T_Categories(CA_Id) ,
    ADD FOREIGN KEY (BC_IdBook) REFERENCES T_Book(BO_Id)
);

CREATE TABLE T_Follow
(
    F_IdFollower INT NOT NULL , 
    F_IdFollowed INT NOT NULL ,
    PRIMARY KEY (F_IdFollowed, F_IdFollower) ,
    ADD FOREIGN KEY (F_IdFollowed) REFERENCES T_User(US_Id) ,
    ADD FOREIGN KEY (F_IdFollower) REFERENCES T_User(T_User) ,
    CONSTRAINT unique_ids CHECK (F_IdFollowed <> F_IdFollower)
);

CREATE TABLE T_AvailableLanguages
(
    AL_IdLanguage INT NOT NULL ,
    AL_IdBook INT NOT NULL ,
    PRIMARY KEY (AL_IdBook, AL_IdLanguage)
    ADD FOREIGN KEY (AL_IdBook) REFERENCES T_Book(BO_Id) ,
    ADD FOREIGN KEY (AL_IdLanguage) REFERENCES T_Language(LA_Id)
);

CREATE TABLE T_BookAuthors
(
    W_IdBook INT NOT NULL ,
    W_IdAuthor INT NOT NULL ,
    PRIMARY KEY (W_IdAuthor, W_IdBook)
    ADD FOREIGN KEY (W_IdAuthor) REFERENCES T_Authors(AU_Id) ,
    ADD FOREIGN KEY (W_IdBook) REFERENCES T_Book(BO_Id)
);
