import { useNavigate, useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from 'axios';

function BookPage() {

    const navigate = useNavigate();
    const params = useParams();
    const [bookData, setBookData] = useState({});

    async function getBookData(id) {
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/books/${id}`;
        axios
            .get(serverQuery)
            .then((response) => {
                if (response.data.book) {
                    let book = response.data.book[0];
                    book.grade = response.data.averageGrade;
                    setBookData(book);
                } else {
                    setBookData({ "error": true });
                }
            })
    }

    useEffect(() => {
        getBookData(params.id);
    }, [params]);

    return (
        <div className="m-5">
            <button onClick={() => navigate(-1)} className="mb-3 hover:text-iut-hover-green">{"<"} Revenir en arrière</button>
            <p className="text-iut-green text-lg mb-3">{bookData.BOOName}</p>
            <div className="flex items-center mb-5">
                <svg aria-hidden="true" className={bookData.grade >= 1 ? "w-5 h-5 text-yellow-400" : "w-5 h-5 text-gray-300"} fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
                <svg aria-hidden="true" className={bookData.grade >= 2 ? "w-5 h-5 text-yellow-400" : "w-5 h-5 text-gray-300"} fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
                <svg aria-hidden="true" className={bookData.grade >= 3 ? "w-5 h-5 text-yellow-400" : "w-5 h-5 text-gray-300"} fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
                <svg aria-hidden="true" className={bookData.grade >= 4 ? "w-5 h-5 text-yellow-400" : "w-5 h-5 text-gray-300"} fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
                <svg aria-hidden="true" className={bookData.grade >= 5 ? "w-5 h-5 text-yellow-400" : "w-5 h-5 text-gray-300"} fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>

            </div>
            
            <div className="flex flex-col w-full h-full overflow-hidden md:flex-row" >
                <div className="mb-3 md:mb-0 w-full md:w-3/5 max-h-[600px] overflow-hidden md:mr-3 rounded-md">
                    <img src={bookData.BOOLinkImg || "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg"}
                        alt={bookData.BOOName}
                        className="object-cover w-full h-fit" />
                </div>
                <div className="bg-gray-200 w-full md:w-2/5 grid grid-cols-1 md:grid-cols-2 p-2 rounded-md">
                    <p>Langue : <span className="text-iut-green h-min p-2">{bookData.BOOLanguages ? bookData.BOOLanguages[0].LANName : "Non renseigné"}</span></p>
                    <p>Nombre de pages : <span className="text-iut-green h-min p-2">{bookData.BOONbPages || "Non renseigné"}</span></p>
                    <p>Catégorie : <span className="text-iut-green h-min p-2">{bookData.BOOCategory ? bookData.BOOCategory.CATName : "Non renseigné"}</span></p>
                    <p>Editeur : <span className="text-iut-green h-min p-2">{bookData.BOOEditor ? bookData.BOOEditor.EDIName : "Non renseigné"}</span></p>
                    <p className="text-xl md:col-span-2 font-semi-bold p-2">Resume</p>
                    <p className="md:col-span-2 p-2">{bookData.BOOSummary || "Non renseigné"}</p>
                </div>
            </div>
        </div>
    )
}

export default BookPage;