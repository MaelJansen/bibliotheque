import { Link } from "react-router-dom";


function BookPrev({ data }) {

    return (
        <div id="preview" className="h-64 w-full flex flex-col">
            <div className="group overflow-hidden cursor-pointer">
                <Link to={`/books/${data.id}`}
                    className="w-full h-fit overflow-hidden">
                    <img src={data.img}
                        className="object-cover object-top w-full h-full ease-in-out delay-100 transition-transform  group-hover:scale-110 group-focus:scale-110"
                        alt={data.title} />
                </Link>
            </div>
            <div className="flex flex-col bg-gray-200">
                <div className="p-1">
                    <p title={data.title} className="truncate">{data.title}</p>
                </div>
                <div className="flex justify-between p-1">
                    <p className="truncate" title={data.author}>{data.author || "no author"}</p>
                    <p>{data.date || "no date"}</p>
                </div>
            </div>
        </div>
    )
}

export default BookPrev;