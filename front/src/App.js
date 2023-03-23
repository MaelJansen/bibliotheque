import SearchBar from "./components/searchbar";
import React, {useEffect, useState} from "react";

function App() {

  const [query, setQuery] = useState("");

  const onChangeQuery = (newQuery) => {
    setQuery(newQuery);
  }

  useEffect(() => {
    // Detect the change
    console.log(query)
  })

  return (
    <div className="App">
      <h1 className='text-iut-green font-saira'>Hello</h1>
      <SearchBar 
      query={query}
      onChangeQuery={onChangeQuery}/>
      <p>You search : {query}</p>
    </div>
  );
}

export default App;
