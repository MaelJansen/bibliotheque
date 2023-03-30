import { Routes, Route } from 'react-router-dom';
import BookPage from './routes/BookPage';
import Home from './routes/Home';
import Login from './routes/Login';
import Main from './routes/Main';
import Results from './routes/Results';

function App() {
    return (
        <Routes>
            <Route exact path="/" Component={Main}>
                <Route index Component={Home} />
                <Route path="books" Component={Results} />
                <Route path="books/:id" Component={BookPage} />
                <Route path="login" Component={Login} />
            </Route>
        </Routes>
    );
}

export default App;