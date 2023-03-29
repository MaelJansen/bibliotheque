import { useSearchParams, Link, useNavigate } from 'react-router-dom';

function Paginator({ nbResult }) {

    const navigate = useNavigate();
    const [searchParams] = useSearchParams();

    const page = searchParams.get('page') ? parseInt(searchParams.get('page')) : 1;
    const resultByPage = searchParams.get('result') ? searchParams.get('result') : 10;
    const nbPage = Math.ceil(nbResult / resultByPage);
    const search = searchParams.get('q');

    if (page > nbPage) {
        navigate(`/books?q=${search}&page=${nbPage}&result=${resultByPage}`);
    }

    else if (nbResult > 0) {
        const previous = page <= 1 ? "" : "<<";
        const next = page >= nbPage ? "" : ">>"

        return (
            <div className="paginator p-2">
                <p>Showing <span className='text-iut-green'>{page >= nbPage ? nbResult % resultByPage : resultByPage}</span> of <span className='text-iut-green'>{nbResult}</span></p>
                <div className='flex flex-row space-x-5 justify-center'>
                    <Link to={`/books?q=${search}&page=${page - 1}&result=${resultByPage}`} replace={true}>{previous}</Link>
                    <p>{page} / {nbPage}</p>
                    <Link to={`/books?q=${search}&page=${page + 1}&result=${resultByPage}`} replace={true}>{next}</Link>
                </div>
            </div>
        )
    }

}

export default Paginator;