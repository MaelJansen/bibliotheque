import SearchBar from "../components/searchbar";
import Header from "../components/Header";
import Footer from "../components/Footer";
import BookList from "../components/bookList";
import { useSearchParams } from 'react-router-dom';

import { useState } from "react";

function Results() {

  const [query, setQuery] = useState("");
  const [completion, setCompletion] = useState([]);
  const [searchParams] = useSearchParams();

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

  return (
    <div className="results">
      <SearchBar
        query={query}
        onChangeQuery={onChangeQuery}
        completion={completion}
      />
      <BookList
        name={`Result for query : ${searchParams.get('q')}`}
        books={[
          {
            "id": 10,
            "title": "Tchoupi",
            "author": "me",
            "img": "https://site.nathan.fr/sites/default/files/visuels/9782092574225.jpg"
          },
          {
            "id": 45,
            "title": "Minecraft",
            "author": "",
            "date": 1940,
            "img": "https://kbimages1-a.akamaihd.net/09327661-3932-4b69-a3a8-2b95fa100cbf/353/569/90/False/diary-of-a-minecraft-noob-steve-book-6-biff-s-curse-an-unofficial-minecraft-diary-book.jpg"
          },
          {
            "id": 1,
            "title": "Livre avec un titre immense, on ne devrait pas le voir en entier",
            "author": "Cube",
            "date": 2010,
            "img": "https://image0.commarts.com/images1/8/0/6/8/860837_102_1160_LTg2NzQwODc2MjIxMjk3NDc3MzU.jpg"
          },
          {
            "id": 100,
            "title": "Le temps des tempetes",
            "author": "Sarkozy",
            "date": 2007,
            "img": "https://m.media-amazon.com/images/I/41wY41ART8S._SL500_.jpg"
          },
        ]} />
    </div>
  );
}

export default Results;