/**
 * The footer
 * @returns The footer
 */
function Footer(){
    return(
        <footer class="bg-gray-100">
            <div class="px-20 py-5">
                <div class="md:flex justify-between">
                    <div>
                        <h2 class="text-iut-green text-xl">IUT - Bibliothèque</h2>
                        <ul class="py-4">
                            <li class="py-1">15 rue Naudet - CS 10207</li>
                            <li class="py-1">33 175 Gradignan Cedex</li>
                            <li class="py-1">Tél. +33 (0)5 56 84 57 57</li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="text-iut-green text-xl">Liens</h2>
                        <ul class="w-48 py-4">
                            <li class="py-1"><a href="https://www.iut.u-bordeaux.fr/general/" class="hover:underline hover:text-gray-700">IUT de Bordeaux</a></li>
                            <li class="py-1"><a href="https://bibliotheques.u-bordeaux.fr/" class="hover:underline hover:text-gray-700">Bibliothèque de l'université de Bordeaux</a></li>
                            <li class="py-1"><a href="https://www.iut.u-bordeaux.fr/general/contacts/" class="hover:underline hover:text-gray-700">Nous contacter</a></li>
                        </ul>
                    </div>
                    <div class="flex flex-col space-y-20">
                        <ul class="flex space-x-5">
                            <li><a href="https://www.facebook.com/iutdebordeaux"><img class="w-10" src={require("../img/facebook.png")} alt="facebook"/></a></li>
                            <li><a href="https://www.instagram.com/iutdebordeaux/"><img class="w-10" src={require("../img/instagram.png")} alt="instagram"/></a></li>
                            <li><a href="https://twitter.com/IUT_de_Bordeaux"><img class="w-10" src={require("../img/twitter.png")} alt="twitter"/></a></li>
                            <li><a href="https://www.linkedin.com/school/iut-de-bordeaux/"><img class="w-10" src={require("../img/linkedin.png")} alt="linkedin"/></a></li>
                            <li><a href="https://www.youtube.com/channel/UCaWP9UzIsK3H9NKx9AruRdA"><img class="w-10" src={require("../img/youtube.png")} alt="youtube"/></a></li>
                        </ul>
                        <a href="https://www.iut.u-bordeaux.fr/qlio/wp-content/uploads/2020/09/ri_iut_de_bx_2020-02-27.pdf" class="hover:underline hover:text-gray-700">Conditions générales d'utilisation</a>
                    </div>
                </div>

                <div class="flex justify-between">
                    <p>Copyright IUT - Bibliothèque</p>
                    <p>Designed by G-13</p>
                </div>
            </div>
        </footer>
    );
}
export default Footer;