import SearchBar from "../components/searchbar";
import React, {useState } from "react";
import Header from "../components/Header";
import Footer from "../components/Footer";

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
        completion={completion}/>
      <p>You search : {query}</p>
      <Footer />
    </div>
  );
}

export default Home;
