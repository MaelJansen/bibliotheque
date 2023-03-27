import SearchBar from "../components/searchbar";
import BookList from "../components/bookList";
import Header from "../components/Header";
import Footer from "../components/Footer";
import axios from 'axios';


import React, {useState } from "react";

function Home() {

  const [query, setQuery] = useState("");
  const [completion, setCompletion] = useState([]);
  const [latest, setLatest] = useState([]);

  /**
   * Handle the changement of the query
   * @param {*} newQuery 
   */
  const onChangeQuery = (newQuery) => {
    setQuery(newQuery);
    complete(newQuery)
  }

  /**
   * Temporar function to auto complete
   * its actually dummy data to test the frontend
   * @param {*} query the actual query
   */
  const complete = ((query) => {
    var tmp = [];
    if (query === '') {
      setCompletion([]);
      return;
    }
    for (let step = 0; step < 10; step++) {
      tmp.push(query + step);
    }
    setCompletion(tmp);
  });

  const getLatest = (() => {
    let query = "http://127.0.0.1:8000/api/books/latest";
    axios
    .get(query)
    .then((response) => {
      let tmp = [];
      for(let book of response.data) {
        console.log(book);
        let tmpBook = {
          "id": book.id,
          "title": book.BOOName,
          "author": book.BOOAuthor ? book.BOOAuthor[0] ? book.BOOAuthor[0].AUTName: null : null ,
          "img": book.BOOLinkImg,
          "date": book.BOOPublishDate,
        };
        tmp.push(tmpBook);        
      };
      setLatest(tmp);
    });


  return (
    <div className="Home">
      <SearchBar
        query={query}
        onChangeQuery={onChangeQuery}
        completion={completion} />
      <BookList
        name={"Vos derniers livres empruntés"}
        books={latest}
      />
      <BookList
        name={"Dernieres sorties"}
        books={[
          {
            "id" : 30,
            "title" : "Le C",
            "author" : "C man",
            "date" : 2030,
            "img" : "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51HTieS6nkL._SX342_SY445_QL70_ML2_.jpg"
          },
          {
            "id" : 55,
            "title" : "API Please",
            "author" : "Equipe back",
            "date" : 1945,
            "img" : "https://www.editions-eni.fr/livre/symfony-5-developpez-des-sites-web-php-structures-et-performants-9782409037221_XL.jpg"
          },
          {
            "id" : 2,
            "title" : "UI/UX",
            "author" : "Equipe Frontend",
            "img" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlEF_yPjr9mxkJqsp86RsIYtjXxpGQiEElAA&usqp=CAU"
          },
          {
            "id" : 101,
            "title" : "Vous avez dit du style ?",
            "author" : "Equipe Frontend",
            "date" : 2007,
            "img" : "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71anm5gu60L._AC_UF1000,1000_QL80_.jpg"
          },
        ]}
      />
    </div>
  );
}

export default Home;
