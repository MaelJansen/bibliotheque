import '../index.css';
import { Dropdown } from 'flowbite-react';

/**
 * The header
 * @returns the header
 */
function Header(){
    let menuDropdown;
    let menuLine;

    //the layout of the menu depends on whether or not the user is connected
    if(false){
        menuDropdown = 
        <div class="space-y-2 md:hidden">
            <Dropdown label="Menu" dismissOnClick={false}
            class = "text-white bg-iut-green rounded-lg hover:bg-iut-hover-green">
                <Dropdown.Item>
                    <a href="./">Accueil</a>
                </Dropdown.Item>
                <Dropdown.Item>
                    <a href="">Amis</a>
                </Dropdown.Item>
                <Dropdown.Item>
                    <a href="">Mes livres</a>
                </Dropdown.Item>
            </Dropdown>
        </div>;
        

        menuLine = <div class="hidden md:flex space-x-10">
                        <a href="./" class="hover:underline hover:text-gray-700">Acceuil</a>
                        <a href="" class="hover:underline hover:text-gray-700">Amis</a>
                        <a href="" class="hover:underline hover:text-gray-700">Mes livres</a>
                    </div>;
    }
    else{
        menuDropdown = 
        <div class="space-y-2 md:hidden">
            <Dropdown label="Menu" dismissOnClick={false}
            class = "text-white bg-iut-green rounded-lg hover:bg-iut-hover-green">
                <Dropdown.Item>
                <a href="./">Accueil</a>
            </Dropdown.Item>
            <Dropdown.Item>
                <a href="">Se connecter</a>
            </Dropdown.Item>
            </Dropdown>
        </div>;

        menuLine = <div class="hidden md:flex space-x-10">
                        <a href="./" class="hover:underline hover:text-gray-700">Acceuil</a>
                        <a href="" class="hover:underline hover:text-gray-700">Se connecter</a>
                    </div>;
    }

    return (
        <header>    
            <div class="flex justify-between px-5 py-5 text-xl">
                <div class="flex">
                    <p class="text-iut-green">IUT - Bibliothèque</p>
                </div>
                {menuDropdown}
                {menuLine}
            </div>
            <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        </header>
    )
}

export default Header;
