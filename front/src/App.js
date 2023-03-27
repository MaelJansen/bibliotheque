import { Routes, Route } from 'react-router-dom';
import ErrorPage from './routes/error-page';
import Home from './routes/Home';
import Main from './routes/Main';
import Results from './routes/Results';

function App() {
    return (
        <Routes>
            <Route path="/" element={<Main />}>
                <Route index element={<Home />} />
                <Route path="/books" element={<Results />}>
                    <Route path="/books/:id" element={<Home />} />
                </Route>
                <Route path="*" element={<ErrorPage />} />
            </Route>
        </Routes>
    );
}

export default App;