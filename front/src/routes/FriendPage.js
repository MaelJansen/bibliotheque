import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import FriendList from "../components/FriendList";

import Paginator from "../components/Paginator";


function FriendPage() {

    const navigate = useNavigate();
    const userId = localStorage.getItem("userId");

    const [searchParams] = useSearchParams();

    const [friends, setFriends] = useState([]);
    const [friendsSuggestion, setFriendsSuggestion] = useState([]);

    if (!userId) {
        navigate("/");
    }

    useEffect(() => {
        getFriend(searchParams);
        getSuggestFriends();
    }, [])

    function getFriend(params) {
        let page = params.get('page') ? "?page=" + params.get('page') : "?page=1";
        let nbResult = params.get('result') ? "&result=" + params.get('result') : "&result=4";
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${userId}/friends${page}${nbResult}`;
        console.log(serverQuery);
        axios
            .get(serverQuery)
            .then(response => {
                console.log(response);
                let tmp = [];
                for (let friend of response.data.data) {
                    let data = {
                        "id": friend.id,
                        "fname": friend.USRFirstName,
                        "name": friend.USRName,
                        "img": friend.USRProfilePicture
                    }
                    tmp.push(data);
                }
                setFriends({ 'nbResult': response.data.nbResult, 'data': tmp });
            })
            .catch(error => {
                console.log(error.response.status);
            })
    }

    function getSuggestFriends() {
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/user/${userId}/recommendedusers`;
        axios
            .get(serverQuery)
            .then(response => {
                let tmp = [];
                for (let friend of response.data) {
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

    return (
        <div className="m-3">
            <p className="text-2xl text-iut-green">Amis</p>
            <FriendList
                name={"Mes amis"}
                following={true}
                friends={friends.data ? friends.data : []} />
            <Paginator
                nbResult={friends.nbResult ? friends.nbResult : 0} 
                default_res={4}/>
            <FriendList
                name={"Recommendations"}
                following={false}
                friends={friendsSuggestion} />
        </div>
    )
}

export default FriendPage;