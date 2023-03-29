import { Link } from "react-router-dom";


function BookPrev({ data }) {
    
    return (
        <div id="preview" className="h-64 w-full flex flex-col">
            <div className="group overflow-hidden cursor-pointer">
                <Link to={`/books/${data.id}`} 
                className="w-full h-fit overflow-hidden">
                    <img src={data.img || "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg"}
                        className="object-cover object-top w-full h-full ease-in-out delay-100 transition-transform  group-hover:scale-110 group-focus:scale-110"
                        alt={data.title}/>
                </Link>
            </div>
            <div className="flex space-x-4 justify-between bg-gray-200 p-1">
                <p title={data.title} className="truncate">{data.title}</p>
                <p>{data.author || "no author"}</p>
                <p>{ data.date || "no date"}</p>
            </div>
        </div>
    )
}

export default BookPrev;