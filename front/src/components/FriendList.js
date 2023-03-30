import Friend from "./Friend";

function FriendList({name, following, friends}) {
  return (
    <>
      <div id="bookList" className="mt-5">
        <p className="text-iut-green m-2 text-lg">{name}</p>
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-3 m-2">
          {friends.map((friend) => (
            <Friend data={friend} 
            following={following}/>
          ))}
        </div>
      </div>
    </>
  );
}

export default FriendList;
