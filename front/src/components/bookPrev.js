import { Link } from "react-router-dom";


function BookPrev({ data }) {
    
    return (
        <div id="preview" className="h-64 w-full flex flex-col">
            <div className="h- group overflow-hidden cursor-pointer">
                <Link to={`/book/${data.id}`} 
                className="w-full h-fit overflow-hidden">
                    <img src={data.img}
                        className="object-cover object-top w-full h-full ease-in-out delay-100 transition-transform  group-hover:scale-110 group-focus:scale-110"
                        alt={data.title}/>
                </Link>
            </div>
            <div className="flex space-x-2 justify-between px-1">
                <p title={data.title} className="truncate">{data.title}</p>
                <p>{data.author || "no author"}</p>
                <p>{data.date || "no date"}</p>
            </div>
        </div>
    )
}

export default BookPrev;