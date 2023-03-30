import { useEffect, useState } from "react";
import axios from "axios";
import BookList from "./bookList";

function Friend({ data, follow }) {

  const [books, setBooks] = useState([]);

  function getBooks() {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${data.id}/books?nb_books=3`;
    console.log(serverQuery);
    axios
      .get(serverQuery)
      .then((response) => {
        console.log(response);
        let tmp = [];
        for (let bookElem of response.data) {
          let book = bookElem.USBBook;
          let tmpBook = {
            "id": book.id,
            "img": book.BOOLinkImg,
          };
          tmp.push(tmpBook);
          console.log("query done");
        }
        setBooks(tmp);
      });
  }

  useEffect(() => {
    getBooks();
  }, [])

  return (
    <div id="preview" className="flex flex-col">
      <div className="group cursor-pointer overflow-hidden aspect-square ">
        <img
          src={
            data.img ||
            "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg"
          }
          className="object-contain object-top w-full h-full"
          alt={data.name}
        />
      </div>
      <div className="flex flex-col bg-gray-200">
        <div className="m-2 space-y-3 flex flex-col justify-center">
          <p>{data.fname} {data.name}</p>
          <button className="text-white bg-iut-green hover:bg-iut-hover-green focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">{follow ? "Suivre" : "Ne plus suivre"}</button>
        </div>
        <div className="flex justify-between p-1">
          <BookList
            name={"Derniers livres empruntes"}
            books={books}
          />
        </div>
      </div>
    </div>
  );
}

export default Friend;
