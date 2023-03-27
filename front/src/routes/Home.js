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
            "title" : "Tchoupi",
            "author" : "me",
            "img" : "https://site.nathan.fr/sites/default/files/visuels/9782092574225.jpg"
          },
          {
            "id" : 45,
            "title" : "Minecraft",
            "author" : "",
            "date" : 1940,
            "img" : "https://kbimages1-a.akamaihd.net/09327661-3932-4b69-a3a8-2b95fa100cbf/353/569/90/False/diary-of-a-minecraft-noob-steve-book-6-biff-s-curse-an-unofficial-minecraft-diary-book.jpg"
          },
          {
            "id" : 1,
            "title" : "Livre avec un titre immense, on ne devrait pas le voir en entier",
            "author" : "Cube",
            "date" : 2010,
            "img" : "https://image0.commarts.com/images1/8/0/6/8/860837_102_1160_LTg2NzQwODc2MjIxMjk3NDc3MzU.jpg"
          },
          {
            "id" : 100,
            "title" : "Le temps des tempetes",
            "author" : "Sarkozy",
            "date" : 2007,
            "img" : "https://m.media-amazon.com/images/I/41wY41ART8S._SL500_.jpg"
          },
        ]}
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
      <Footer />
    </div>
  );
}

export default Home;
