import React, { useRef } from 'react';
function SearchBar({ query, onChangeQuery, completion }) {

    const searchRef = useRef(null);

    const handleChange = (newQuery) => {
        searchRef.current.focus();
        onChangeQuery(newQuery);
    }

    return (
        <>
            <div className='w-full h-fit bg-header-img p-16 flex flex-col align-middle justify-center'>
                <form className='flex flex-row justify-center'>
                    <label for="default-search" class="text-sm font-medium text-gray-900 sr-only">Search</label>
                    <div class="relative w-4/5 md:w-3/5">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                        </div>
                        <input type="search"
                            ref={searchRef}
                            id="default-search"
                            value={query}
                            class="block w-full p-4 pl-10 text-sm text-gray-900 bg-gray-50 focus:border-iut-hover-green"
                            placeholder="Search"
                            onChange={e => handleChange(e.target.value)}
                            required
                        />
                        <div className='absolute w-full border border-iut-green'>
                            <ol className='bg-white w-full'>
                                {completion.map((elem) => (
                                    <li key={elem}
                                        className="border border-b-gray-200 w-full">
                                        <button
                                            type='button'
                                            className='w-full text-left pl-2 py-2 overflow-x-clip hover:text-iut-hover-green hover:ring-1 hover:ring-iut-hover-green focus:text-iut-hover-green focus:ring-1 focus:ring-iut-hover-green'
                                            value={elem}
                                            onClick={e => handleChange(e.target.value)}>
                                            {elem}
                                        </button>
                                    </li>
                                ))}
                            </ol>
                        </div>
                    </div>
                    <button type="submit" class="p-2.5 text-sm font-medium text-white bg-iut-green border border-iut-green hover:bg-iut-hover-green focus:outline-none">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                        <span class="sr-only">Search</span>
                    </button>
                </form>
            </div>
        </>
    )
}

export default SearchBar;