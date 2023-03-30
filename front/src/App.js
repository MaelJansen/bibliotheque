import { Routes, Route } from 'react-router-dom';
import BookPage from './routes/BookPage';
import FriendPage from './routes/FriendPage';
import Home from './routes/Home';
import Login from './routes/Login';
import Main from './routes/Main';
import Results from './routes/Results';
import Profile from './routes/Profile';


function App() {
    return (
        <Routes>
            <Route exact path="/" Component={Main}>
                <Route index Component={Home} />
                <Route path="books" Component={Results} />
                <Route path="books/:id" Component={BookPage} />
                <Route path="friends" Component={FriendPage} />
                <Route path="login" Component={Login} />
                <Route path="user/:id" Component={Profile} />
            </Route>
        </Routes>
    );
}

export default App;