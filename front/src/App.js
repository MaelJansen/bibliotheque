import { Routes, Route } from 'react-router-dom';
import BookPage from './routes/BookPage';
import FriendPage from './routes/FriendPage';
import Home from './routes/Home';
import Main from './routes/Main';
import Results from './routes/Results';

function App() {
    return (
        <Routes>
            <Route exact path="/" Component={Main}>
                <Route index Component={Home} />
                <Route path="books" Component={Results} />
                <Route path="books/:id" Component={BookPage} />
                <Route path="friend" Component={FriendPage} />
            </Route>
        </Routes>
    );
}

export default App;