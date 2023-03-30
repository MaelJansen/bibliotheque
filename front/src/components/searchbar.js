import React, { useRef, useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

function SearchBar() {
  const searchRef = useRef(null);

  const [query, setQuery] = useState("");
  const [completion, setCompletion] = useState([]);

  const handleChange = (newQuery) => {
    searchRef.current.focus();
    setQuery(newQuery);
  };

  async function getCompletion() {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/authors?q=${query}`;
    axios.get(serverQuery).then((response) => {
      let tmp = [];
      for (let author of response.data) {
        tmp.push(author.AUTName);
      }
      setCompletion(tmp);
    });
  }

  useEffect(() => {
    if (query.length >= 4) {
      getCompletion();
    } else {
      setCompletion([]);
    }
  }, [query]);

  return (
    <>
      <div className="w-full h-fit bg-header-img p-16 flex flex-col align-middle justify-center">
        <form className="flex flex-row justify-center">
          <label
            for="default-search"
            className="text-sm font-medium text-gray-900 sr-only"
          >
            Search
          </label>
          <div className="group relative w-4/5 md:w-3/5">
            <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
              <svg
                aria-hidden="true"
                className="w-5 h-5 text-gray-500"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                ></path>
              </svg>
            </div>
            <input
              type="search"
              ref={searchRef}
              id="default-search"
              value={query}
              className="peer block w-full p-4 pl-10 text-sm text-gray-900 bg-gray-50 focus:border-iut-hover-green"
              placeholder="Search"
              onChange={(e) => handleChange(e.target.value)}
              required
            />
            <div className="hidden group-focus-within:block absolute w-full border border-iut-green">
              <ol className="bg-white w-full">
                {completion.map((elem) => (
                  <li key={elem} className="border border-b-gray-200 w-full">
                    <button
                      type="button"
                      title={elem}
                      className="w-full text-left pl-2 py-2 overflow-x-clip hover:text-iut-hover-green hover:ring-1 hover:ring-iut-hover-green focus:text-iut-hover-green focus:ring-1 focus:ring-iut-hover-green"
                      value={elem}
                      onClick={(e) => handleChange(e.target.value)}
                    >
                      {elem}
                    </button>
                  </li>
                ))}
              </ol>
            </div>
          </div>
          <Link to={`/books?q=${query}&page=1`} className="w-fit h-fit">
            <button
              type="submit"
              className="p-4 text-sm font-medium text-white bg-iut-green border border-iut-green hover:bg-iut-hover-green focus:outline-none"
            >
              <svg
                className="w-5 h-5"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                ></path>
              </svg>
              <span className="sr-only">Search</span>
            </button>
          </Link>
        </form>
      </div>
    </>
  );
}

export default SearchBar;
