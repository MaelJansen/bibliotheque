import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from 'axios';

function BookPage() {

    const [bookData, setBookData] = useState({});
    const params = useParams();

    async function getBookData(id) {
        let serverQuery = "http://127.0.0.1:8000/api/books/" + id;
        axios
            .get(serverQuery)
            .then((response) => {
                setBookData(response.data[0]);
            })
    }

    useEffect(() => {
        getBookData(params.id);
    }, [params]);

    return (
        <div className="m-5">
            <p className="text-iut-green text-lg mb-3">{bookData.BOOName}</p>
            <div className="flex flex-col w-full overflow-hidden max-h-[500px] md:flex-row" >
                <div className="group relative mb-3 w-full md:w-3/5 h-full overflow-hidden md:mr-3 rounded-md">
                    <img src={bookData.BOOLinkImg} alt={bookData.BOOName} className="object-cover w-full h-fit group-hover:scale-110"/>
                </div>
                <div className="bg-gray-200 w-full md:w-2/5 grid grid-cols-2 p-2 rounded-md">
                    <p>Langue : <span className="text-iut-green h-min p-1">{ bookData.BOOLanguages ? bookData.BOOLanguages[0].LANName : "Non renseigné"}</span></p>
                    <p>Nombre de pages : <span className="text-iut-green h-min p-1">{ bookData.BOONbPages | "Non renseigné"}</span></p>
                    <p>Catégorie : <span className="text-iut-green h-min p-1">{ bookData.BOOCategory ? bookData.BOOCategory.CATName : "Non renseigné"}</span></p>
                    <p>Editeur : <span className="text-iut-green h-min p-1">{ bookData.BOOEditor ? bookData.BOOEditor.EDIName : "Non renseigné"}</span></p>
                    <p className="text-xl col-span-2 font-semi-bold">Resume</p>
                    <p className="col-span-2">{bookData.BOOSummary ? bookData.BOOSummary : "Non renseigné"}</p>
                </div>
            </div>
        </div>
    )
}

export default BookPage;