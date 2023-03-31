import { useNavigate, useParams, useSearchParams } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from 'axios';
import BookList from "../components/bookList";
import Paginator from "../components/Paginator";


function Profile() {
    const navigate = useNavigate();
    const params = useParams();
    const [searchParams] = useSearchParams();
    const [userData, setUserData] = useState({});
    const [userBooks, setUserBooks] = useState([]);

    const userId = localStorage.getItem('userId');

    async function getUserData(id) {
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${id}`;
        axios
            .get(serverQuery)
            .then((response) => {
                if (response.data) {
                    let user = response.data;
                    setUserData(user);
                } else {
                    setUserData({ "error": true });
                }
            })
    }

    async function getUserBooks(id, params) {
        let page = params.get('page') ? "?page=" + params.get('page') : "?page=1";
        let nbResult = params.get('result') ? "&result=" + params.get('result') : "&result=4";
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${id}/books${page}${nbResult}`;
        axios
            .get(serverQuery)
            .then((response) => {
                let tmp = [];
                let datas = response.data;
                for (let bookItem of datas.books) {
                    let book = bookItem.USBBook;
                    let tmpBook = {
                        "id": book.id,
                        "img": book.BOOLinkImg,
                    };
                    tmp.push(tmpBook);
                }
                setUserBooks({'books': tmp, 'nbResult': response.data.nbResult});
            })
            .catch(console.log)
    }

    useEffect(() => {
        getUserData(params.id);
    }, [params]);

    useEffect(() => {
        getUserBooks(params.id, searchParams)
    }, [userData]);

    return (
        <div className="m-3">
            <button onClick={() => navigate(-1)} className="mb-3 hover:text-iut-hover-green">{"<"} Revenir en arrière</button>
            <p className="text-2xl text-iut-green">{userId == userData.id ? "Votre profil" : `${userData.USRFirstName || "guest"} profile`}</p>
            <div className="flex flex-col items-center space-y-2">
                <img src={userData.USRProfilePicture || ""} alt="Profile picture" className="rounded-full" />
                <p className="text-iut-green text-lg text-center">{userData.USRFirstName || "Guest"} {userData.USRName || ""}</p>
            </div>
            <BookList
                name={`${userId == userData.id ? "Vos" : userData.USRFirstName || ""} derniers livres`}
                books={userBooks.books ? userBooks.books : []} />
            <Paginator 
            nbResult={userBooks.nbResult || 0}
            default_res={4} />
        </div>
    )
}

export default Profile;