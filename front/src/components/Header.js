import '../index.css';
import { Link, useNavigate } from "react-router-dom";
import { Dropdown } from 'flowbite-react';
import axios from 'axios';

/**
 * The header
 * @returns the header
 */
function Header() {
    let menuDropdown;
    let menuLine;

    const navigate = useNavigate();

    const userId = localStorage.getItem("userId");
    const config = {
        headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
    };

    const logout = () => {
        console.log("In logout");
        let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/logout`
        axios
            .post(serverQuery, {}, config)
            .then()
            .catch()
    }

    const handleLogoutClick = async() => {
        await logout();
        localStorage.removeItem("token");
        localStorage.removeItem("userId");
        navigate('/');
    }

    //the layout of the menu depends on whether or not the user is connected
    if (userId) {
        menuDropdown =
            <div class="space-y-2 md:hidden">
                <Dropdown label="Menu" dismissOnClick={false}
                    class="text-white bg-iut-green rounded-lg hover:bg-iut-hover-green">
                    <Dropdown.Item>
                        <Link to={"/"}>Accueil</Link>
                    </Dropdown.Item>
                    <Dropdown.Item>
                        <Link to={"/friends?page=1"}>Amis</Link>
                    </Dropdown.Item>
                    <Dropdown.Item>
                        <Link to={`/user/${userId}`}>Mes livres</Link>
                    </Dropdown.Item>
                    <Dropdown.Item>
                        <Link onClick={handleLogoutClick}>Déconnexion</Link>
                    </Dropdown.Item>
                </Dropdown>
            </div>;


        menuLine = <div class="hidden md:flex space-x-10">
            <Link to={"/"} class="hover:underline hover:text-gray-700">Acceuil</Link>
            <Link to={"/friends?page=1"} class="hover:underline hover:text-gray-700">Amis</Link>
            <Link to={`/user/${userId}`} class="hover:underline hover:text-gray-700">Mes livres</Link>
            <Link onClick={handleLogoutClick}>Déconnexion</Link>
        </div>;
    }
    else {
        menuDropdown =
            <div class="space-y-2 md:hidden">
                <Dropdown label="Menu" dismissOnClick={false}
                    class="text-white bg-iut-green rounded-lg hover:bg-iut-hover-green">
                    <Dropdown.Item>
                        <Link to={"/"}>Accueil</Link>
                    </Dropdown.Item>
                    <Dropdown.Item>
                        <Link to={"/login"}>Se connecter</Link>
                    </Dropdown.Item>
                </Dropdown>
            </div>;

        menuLine = <div class="hidden md:flex space-x-10">
            <Link to={"/"} class="hover:underline hover:text-gray-700">Accueil</Link>
            <Link to={"/login"} class="hover:underline hover:text-gray-700">Se connecter</Link>
        </div>;
    }

    return (
        <header>
            <div class="flex justify-between px-5 py-5 text-xl">
                <div class="flex">
                    <Link to={'/'} class="text-iut-green">IUT - Bibliothèque</Link>
                </div>
                {menuDropdown}
                {menuLine}
            </div>
            <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        </header>
    )
}

export default Header;
