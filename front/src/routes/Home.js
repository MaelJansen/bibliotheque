import BookList from "../components/bookList";
import axios from 'axios';
import React, { useState, useEffect } from 'react';

function Home() {

  const [latest, setLatest] = useState([]);

  async function getLatest() {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/books/latest`;
    axios
      .get(serverQuery)
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

  useEffect(() => {
    getLatest();
  }, []);

  return (
    <div className="Home">
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
