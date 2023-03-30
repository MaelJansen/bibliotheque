import { useNavigate, useParams, useSearchParams } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from 'axios';
import BookList from "../components/bookList";


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
                if (response.data.user) {
                    let user = response.data.user;
                    setUserData(user);
                } else {
                    setUserData({ "error": true });
                }
            })
    }

    async function getUserBooks(id, params) {
        let page = params.get('page') ? "?page=" + params.get('page') : "?page=1";
        let nbResult = params.get('result') ? "&result=" + params.get('result') : "&result=8";
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${id}/books${page}${nbResult}`;
        axios
        .get(serverQuery)
        .then(response => {
            console.log(response);
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
        <p className="text-2xl text-iut-green">{userData.id === userId ? "Your profile" : `${userData.USRFirstName || "guest"} profile`}</p>
        <div className="flex flex-col items-center space-y-2">
            <img src={userData.USRProfilePicture || ""} alt="Profile picture" className="rounded-full"/>
            <p className="text-iut-green text-lg text-center">{userData.USRFirstName || "Guest"} {userData.USRName || ""}</p>
        </div>
        <BookList 
        name={`${userData.USRFirstName || "Last"} books`}
        books={[]} />
        </div>
    )
}

export default Profile;