import BookPrev from "./bookPrev";

import { useLocation } from "react-router-dom";

function BookList({ name, books }) {

    const location = useLocation();
    const path = location.pathname;

    if (books.length === 0) {
        return (
            <>
                <p className="text-iut-green m-2 text-lg">{name}</p>
                <div className="flex justify-center">
                    <p className="text-lg">No result</p>
                </div>
            </>
        )
    } else {

        return (
            <>
                <div id="bookList" className="mt-5">
                    <p className="text-iut-green m-2 text-lg">{name}</p>
                    <div className={path.includes("friends") ? "grid grid-cols-3 gap-3 m-2" : "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-3 m-2"}>
                        {books.map((book) => (
                            <BookPrev data={book} />
                        ))}
                    </div>
                </div>
            </>
        )
    }
}

export default BookList;