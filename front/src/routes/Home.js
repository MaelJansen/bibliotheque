import BookList from "../components/bookList";
import axios from "axios";
import React, { useState, useEffect } from "react";

function Home() {
  const [latest, setLatest] = useState([]);
  const [borrowed, setBorrowed] = useState([]);
  const [suggest, setSuggest] = useState([]);

  const userId = localStorage.getItem('userId');

  async function getLatest() {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/books/latest`;
    axios.get(serverQuery).then((response) => {
      let tmp = [];
      for (let book of response.data) {
        let tmpBook = {
          id: book.id,
          title: book.BOOName,
          author: book.BOOAuthor
            ? book.BOOAuthor[0]
              ? book.BOOAuthor[0].AUTName
              : null
            : null,
          img: book.BOOLinkImg,
          date: book.BOOPublishDate ? book.BOOPublishDate.slice(0, 4) : null,
        };
        tmp.push(tmpBook);
      }
      setLatest(tmp);
    });
  }

  async function getBorrowed(id) {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${id}/books?result=4`;
    axios
      .get(serverQuery)
      .then((response) => {
        let tmp = [];
        for (let bookElem of response.data.books) {
          let book = bookElem.USBBook;
          let tmpBook = {
            "id": book.id,
            "img": book.BOOLinkImg,
          };
          tmp.push(tmpBook);
        }
        setBorrowed(tmp);
      });
  }

  async function getSuggest(id) {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${id}/recommendedbooks?result=4`;
    axios.get(serverQuery).then((response) => {
      let tmp = [];
      for (let book of response.data) {
        let tmpBook = {
          id: book.id,
          title: book.BOOName,
          author: book.BOOAuthor
            ? book.BOOAuthor[0]
              ? book.BOOAuthor[0].AUTName
              : null
            : null,
          img: book.BOOLinkImg,
          date: book.BOOPublishDate ? book.BOOPublishDate.slice(0, 4) : null,
        };
        tmp.push(tmpBook);
      }
      setSuggest(tmp);
    });
  }

  async function getPopular() {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/books/popular`;
    axios.get(serverQuery).then((response) => {
      let tmp = [];
        for (let bookElem of response.data) {
          let book = bookElem[0];
          let tmpBook = {
            "id": book.id,
            "img": book.BOOLinkImg,
          };
          tmp.push(tmpBook);
        }
        setSuggest(tmp);
    });
  }

  useEffect(() => {
    getLatest();
    if (userId) {
      getBorrowed(userId);
      getSuggest(userId);
    } else {
    getPopular();
  }
  }, [userId]);

  return (
    <div className="Home">
      <BookList name={"Dernieres sorties"} books={latest} />
      {userId ? (
        <BookList name={"Vos derniers livres empruntés"} books={borrowed} />
      ) : (
        ""
      )}
      <BookList name={"Recommendations"} books={suggest} />
    </div>
  );
}

export default Home;
