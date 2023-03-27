/*The request to have the number of authors*/
SELECT COUNT(*) AS Nb_Authors FROM author;
/*The request to have the number of books*/
SELECT COUNT(*) AS Nb_Books FROM book;
/*The request to have the number of book_author (book writed by authors)*/
SELECT COUNT(*) AS Nb_Book_Author FROM book_author;
/*The request to have the number of book_language (book writed in language)*/
SELECT COUNT(*) AS Nb_Book_Language FROM book_language;
/*The request to have the number of categories*/
SELECT COUNT(*) AS Nb_Categories FROM categories;
/*The request to have the number of editors*/
SELECT COUNT(*) AS Nb_Editors FROM editor;
/*The request to have the number of grades*/
SELECT COUNT(*) AS Nb_Grades FROM grade;
/*The request to have the number of languages*/
SELECT COUNT(*) AS Nb_Language FROM language;
/*The request to have the number of users*/
SELECT COUNT(*) AS Nb_User FROM user;
/*The request to have the number of user_book (book borrwed by user)*/
SELECT COUNT(*) AS Nb_User_Book FROM user_book;
/*The request to have the number of user_user (user followed by user)*/
SELECT COUNT(*) AS Nb_User_User FROM user_user;