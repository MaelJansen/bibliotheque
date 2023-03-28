import SearchBar from "../components/searchbar";
import BookList from "../components/bookList";
import Header from "../components/Header";
import Footer from "../components/Footer";
import axios from 'axios';

import React, { useEffect, useState } from "react";

function Home() {

  const [query, setQuery] = useState("");
  const [completion, setCompletion] = useState([]);
  const [latest, setLatest] = useState([]);



  async function getLatest() {
    let query = "http://127.0.0.1:8000/api/books/latest";
    axios
      .get(query)
      .then((response) => {
        let tmp = [];
        for (let book of response.data) {
          let tmpBook = {
            "id": book.id,
            "title": book.BOOName,
            "author": book.BOOAuthor ? book.BOOAuthor[0] ? book.BOOAuthor[0].AUTName : null : null,
            "img": book.BOOLinkImg,
            "date": book.BOOPublishDate ? book.BOOPublishDate.slice(0, 4) : null,
          };
          tmp.push(tmpBook);
          console.log("query done");
        }
        setLatest(tmp);
      });
  }

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

  useEffect(() => {
      getLatest();
  }, []);

  return (
    <div className="Home">
      <SearchBar
        query={query}
        onChangeQuery={onChangeQuery}
        completion={completion} />
      <BookList
        name={"Dernieres sorties"}
        books={latest}
        />
      <BookList
        name={"Vos derniers livres empruntés"}
        books={[]}
      />
    </div>
  );
}


export default Home;
