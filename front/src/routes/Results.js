import BookList from "../components/bookList";
import { useSearchParams } from 'react-router-dom';

import { useEffect, useState } from "react";
import axios from "axios";
import Paginator from "../components/Paginator";

function Results() {

  const [searchParams] = useSearchParams();
  const [booksData, setBooksData] = useState({});

  async function getBookData(params) {
    let q = params.get('q') ? params.get('q') : "";
    let page = params.get('page') ? "&page=" + params.get('page') : "";
    let nbResult = params.get('result') ? "&result=" + params.get('result') : "";
    let searchQuery = "http://127.0.0.1:8000/api/books?q=" + q + page + nbResult;
    console.log(searchQuery);
    axios
    .get(searchQuery)
    .then((response) => {
      let tmp = [];
        for (let book of response.data.datas) {
          let tmpBook = {
            "id": book.id,
            "title": book.BOOName,
            "author": book.BOOAuthor ? book.BOOAuthor[0] ? book.BOOAuthor[0].AUTName : null : null,
            "img": book.BOOLinkImg,
            "date": book.BOOPublishDate ? book.BOOPublishDate.slice(0, 4) : null,
          };
          tmp.push(tmpBook);
        }
        setBooksData({"nbResult" : response.data.nbResult, "datas" : tmp});
    })
    .catch((error) => {
      console.log(error.response.status);
    })
  }

  useEffect(() => {
    getBookData(searchParams);
  }, [searchParams]);


  return (
    <div className="results">
      <Paginator
      nbResult={booksData.nbResult || 0}/>
      <BookList
        name={`Resultats pour : ${searchParams.get('q') ? searchParams.get('q') : "Tous les livres"}`}
        books={booksData.datas || []} />
        <Paginator
      nbResult={booksData.nbResult || 0}/>
    </div>
  );
}

export default Results;