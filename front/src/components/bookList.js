import BookPrev from "./bookPrev";

function BookList({ name, books }) {
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
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-3 m-2">
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