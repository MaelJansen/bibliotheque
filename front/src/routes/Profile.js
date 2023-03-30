import { useNavigate, useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from 'axios';
import BookList from "../components/bookList";


function Profile() {
    const navigate = useNavigate();
    const params = useParams();
    const [userData, setUserData] = useState({});
    const [userBooks, setUserBooks] = useState([]);

    const userId = localStorage.getItem('userId');

    async function getUserData(id) {
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${id}`;
        axios
            .get(serverQuery)
            .then((response) => {
                console.log(response);
                if (response.data.user) {
                    let user = response.data.user;
                    setUserData(user);
                    console.log(user);
                } else {
                    setUserData({ "error": true });
                }
            })
    }

    async function getUserBooks() {

    }

    useEffect(() => {
        getUserData(params.id);
    }, [params]);

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