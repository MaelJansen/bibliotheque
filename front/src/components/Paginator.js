import { useSearchParams, Link, useNavigate, useLocation } from 'react-router-dom';

function Paginator({ nbResult , default_res}) {

    const navigate = useNavigate();
    const location = useLocation();
    const [searchParams] = useSearchParams();

    const page = searchParams.get('page') ? parseInt(searchParams.get('page')) : 1;
    const resultByPage = searchParams.get('result') ? searchParams.get('result') : default_res;
    const nbPage = Math.max(Math.ceil(nbResult / resultByPage), 1);
    const search = searchParams.get('q') ? `&q=${searchParams.get('q')}` : "";

    if (page > nbPage) {
        navigate(`${location.pathname}?page=${nbPage}&result=${resultByPage}${search}`);
    }

    else if (nbResult > 0) {
        const previous = page <= 1 ? "" : "<<";
        const next = page >= nbPage ? "" : ">>"

        return (
            <div className="paginator p-2">
                <p>Showing <span className='text-iut-green'>{page >= nbPage ? nbResult % resultByPage : resultByPage}</span> of <span className='text-iut-green'>{nbResult}</span></p>
                <div className='flex flex-row space-x-5 justify-center'>
                    <Link to={`${location.pathname}?page=${page - 1}&result=${resultByPage}${search}`} className="hover:text-iut-green">{previous}</Link>
                    <p>{page} / {nbPage}</p>
                    <Link to={`${location.pathname}?page=${page + 1}&result=${resultByPage}${search}`} className="hover:text-iut-green">{next}</Link>
                </div>
            </div>
        )
    }

}

export default Paginator;