import './index.css';
import { Dropdown } from 'flowbite-react';

function Header(){
    return (
        <header>    
            <div class="flex justify-between px-5 py-5 text-xl">
                <div class="flex">
                    <p class="text-iut-green">IUT - Bibliothèque</p>
                </div>
                <div class="space-y-2 md:hidden">
                    <button class="tham-e-squeeze tham-w-6">
                        <div class="tham-box">
                            <div class="tham-inner"></div>
                        </div>
                    </button>
                    
                    <Dropdown
                    label="Menu"
                    dismissOnClick={false}
                    >
                    <Dropdown.Item>
                        Accueil
                    </Dropdown.Item>
                    <Dropdown.Item>
                        Amis
                    </Dropdown.Item>
                    </Dropdown>
                </div>
                <div class="hidden md:flex">
                    <p class="pr-10">Acceuil</p>
                    <p>Amis</p>
                </div>
            </div>
            <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        </header>
    )


}

export default Header;
