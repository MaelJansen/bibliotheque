import FriendList from "../components/FriendList";

function FriendPage() {

    return(
        <div className="m-3">
            <p className="text-2xl text-iut-green">Amis</p>
            <FriendList 
            friends={[]}/>
        </div>
    )
}

export default FriendPage;