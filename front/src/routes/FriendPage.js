import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import FriendList from "../components/FriendList";

import Paginator from "../components/Paginator";


function FriendPage() {

    const navigate = useNavigate();
    const userId = localStorage.getItem("userId");

    const [friends, setFriends] = useState([]);
    const [friendsSuggestion, setFriendsSuggestion] = useState([]);

    if (!userId){
        navigate("/");
    }

    useEffect(() => {
        getFriend();
        getSuggestFriends();
    }, [])

    function getFriend () {
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${userId}/friends`;
        axios
        .get(serverQuery)
        .then(response => {
            let tmp = [];
            for (let friend of response.data){
                let data = {
                    "id": friend.id,
                    "fname": friend.USRFirstName,
                    "name": friend.USRName,
                    "img": friend.USRProfilePicture
                }
                tmp.push(data);
            }
            setFriends(tmp);
        })
        .catch(error => {
            console.log(error.response.status);
        })
    }

    function getSuggestFriends () {
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${userId}/recommendedusers`;
        console.log(serverQuery);
        axios
        .get(serverQuery)
        .then(response => {
            let tmp = [];
            for (let friend of response.data){
                let data = {
                    "id": friend.id,
                    "fname": friend.USRFirstName,
                    "name": friend.USRName,
                    "img": friend.USRProfilePicture
                }
                tmp.push(data);
            }
            setFriendsSuggestion(tmp);
        })
        .catch(error => {
            console.log(error.response.status);
        })
    }

    return(
        <div className="m-3">
            <p className="text-2xl text-iut-green">Amis</p>
            <FriendList 
            name={"Mes amis"}
            follow={false}
            friends={friends}/>
            <Paginator 
            nbResult={friends.length}/>
            <FriendList 
            name={"Recommendations"}
            follow={true}
            friends={friendsSuggestion}/>
        </div>
    )
}

export default FriendPage;