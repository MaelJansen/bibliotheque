import { useSearchParams, Link } from 'react-router-dom';

function Paginator({ nbResult }) {

    const [searchParams] = useSearchParams();
    const page = searchParams.get('page') ? parseInt(searchParams.get('page')) : 1;
    const resultByPage = searchParams.get('result') ? searchParams.get('result') : 10;
    const nbPage = Math.ceil(nbResult / resultByPage);
    const search = searchParams.get('q');

    const previous = page <=1 ? "" : "<<";
    const next = page >= nbPage ? "" : ">>"

    return (
        <div className="paginator ">
            <p>Showing <span className='text-iut-green'>{page >= nbPage ? nbResult % resultByPage : resultByPage}</span> of <span className='text-iut-green'>{nbResult}</span></p>
            <div className='flex flex-row space-x-5 justify-center'>
                <Link to={`/books?q=${search}&page=${page-1}&result=${resultByPage}`}>{previous}</Link>
                <p>{page} / {nbPage}</p>
                <Link to={`/books?q=${search}&page=${page+1}&result=${resultByPage}`}>{next}</Link>
            </div>
        </div>
    )

}

export default Paginator;