import BookList from "./bookList";

function Friend({ data }) {
  return (
    <div id="preview" className="h-64 w-full flex flex-col">
      <div className="group overflow-hidden cursor-pointer">
        <img
          src={
            data.img ||
            "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg"
          }
          className="object-cover object-top w-full h-full ease-in-out delay-100 transition-transform  group-hover:scale-110 group-focus:scale-110"
          alt={data.title}
        />
      </div>
      <div className="flex flex-col bg-gray-200">
        <div className="p-1">
          <button>Follow</button>
        </div>
        <div className="flex justify-between p-1">
            <BookList
            name={"Derniers livres empruntes"}
            books={[]}
            />
        </div>
      </div>
    </div>
  );
}

export default Friend;
