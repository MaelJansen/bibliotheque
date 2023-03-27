import { Routes, Route } from 'react-router-dom';
import ErrorPage from './routes/error-page';
import Home from './routes/Home';
import Main from './routes/Main';
import Results from './routes/Results';

function App() {
    return (
        <Routes>
            <Route path="/" Component={Main}>
                <Route index Component={Home} />
                <Route path="books" Component={Results} />
                <Route path="books/:id" Component={Home} />
                <Route path="*" element={<ErrorPage />} />
            </Route>
            <Route path="*" element={<ErrorPage />} />
        </Routes>
    );
}

export default App;