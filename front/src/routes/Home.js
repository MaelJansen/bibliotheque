import SearchBar from "../components/searchbar";
import BookList from "../components/bookList";
import Header from "../components/Header";
import Footer from "../components/Footer";

import React, {useState } from "react";

function Home() {

  const [query, setQuery] = useState("");
  const [completion, setCompletion] = useState([]);

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
    <div className="Home">
      <Header />
      <SearchBar
        query={query}
        onChangeQuery={onChangeQuery}
        completion={completion} />
      <BookList
        name={"Vos derniers livres empruntés"}
        books={[
          {
            "id" : 10,
            "title" : "tchoupi",
            "author" : "me",
            "img" : "https://site.nathan.fr/sites/default/files/visuels/9782092574225.jpg"
          },
          {
            "id" : 45,
            "title" : "minecraft",
            "author" : "",
            "date" : 1945,
            "img" : "https://kbimages1-a.akamaihd.net/09327661-3932-4b69-a3a8-2b95fa100cbf/353/569/90/False/diary-of-a-minecraft-noob-steve-book-6-biff-s-curse-an-unofficial-minecraft-diary-book.jpg"
          },
          {
            "id" : 1,
            "title" : "Livre avec un titre immense, on ne devrait pas le voir en entier",
            "author" : "Cube",
            "date" : 201,
            "img" : "https://media.tenor.com/zvg8w0FkecYAAAAC/feur-theobabac.gif"
          },
          {
            "id" : 100,
            "title" : "Le temps des tempetes",
            "author" : "Sarcoco",
            "date" : 2007,
            "img" : "https://m.media-amazon.com/images/I/41wY41ART8S._SL500_.jpg"
          },
        ]}
      />
      <BookList
        name={"Dernieres sorties"}
        books={[
          {
            "id" : 10,
            "title" : "tchoupi",
            "author" : "me",
            "date" : 2030,
            "img" : "https://site.nathan.fr/sites/default/files/visuels/9782092574225.jpg"
          },
          {
            "id" : 45,
            "title" : "minecraft",
            "author" : "pipeline",
            "date" : 1945,
            "img" : "https://static.wikia.nocookie.net/minecraft/images/0/02/Enchanted_Book.png/revision/latest?cb=20190911213857"
          },
          {
            "id" : 1,
            "title" : "Quoi",
            "author" : "Cube",
            "img" : "https://media.tenor.com/zvg8w0FkecYAAAAC/feur-theobabac.gif"
          },
          {
            "id" : 100,
            "title" : "Le temps des tempetes",
            "author" : "Sarcoco",
            "date" : 2007,
            "img" : "https://m.media-amazon.com/images/I/41wY41ART8S._SL500_.jpg"
          },
        ]}
      />
      <Footer />
    </div>
  );
}

export default Home;
