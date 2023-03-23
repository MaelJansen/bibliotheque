import SearchBar from "./components/searchbar";
import React, {useState } from "react";

function App() {

  const [query, setQuery] = useState("");
  const [completion, setCompletion] = useState([]);

  const onChangeQuery = (newQuery) => {
    setQuery(newQuery);
    complete(newQuery)
  }

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
    <div className="App">
      <h1 className='text-iut-green font-saira'>Hello</h1>
      <SearchBar
        query={query}
        onChangeQuery={onChangeQuery}
        completion={completion}/>
      <p>You search : {query}</p>
    </div>
  );
}

export default App;
