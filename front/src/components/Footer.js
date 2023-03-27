/**
 * The footer
 * @returns The footer
 */
function Footer(){
    return(
        <footer class="bg-gray-200 mt-20">
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
                            <li class="py-1"><a href="https://www.iut.u-bordeaux.fr/general/">IUT de Bordeaux</a></li>
                            <li class="py-1"><a href="./">Bibliothèque de l'université de Bordeaux</a></li>
                            <li class="py-1"><a href="https://www.iut.u-bordeaux.fr/general/contacts/">Nous contacter</a></li>
                        </ul>
                    </div>
                    <div class="flex flex-col space-y-20">
                        <ul class="flex space-x-5">
                            <li><a href="https://www.facebook.com/iutdebordeaux"><img class="w-10" src={require("../img/facebook.png")}/></a></li>
                            <li><a href="https://www.instagram.com/iutdebordeaux/"><img class="w-10" src={require("../img/instagram.png")}/></a></li>
                            <li><a href="https://twitter.com/IUT_de_Bordeaux"><img class="w-10" src={require("../img/twitter.png")}/></a></li>
                            <li><a href="https://www.linkedin.com/authwall?trk=gf&trkInfo=AQEKgTrGKijbmAAAAYcS_MhoYSgxiLbN-9dVCm78vnLE0x649QljzceK8HRnRXCfjTIOPQ29XC-TXWkaPYSYN0TIdiJJpZzS5TELCRBdYP4TEXY9qHI-LdRYRijiF7AWjes3dOo=&original_referer=https://www.iut.u-bordeaux.fr/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fschool%2Fiut-de-bordeaux"><img class="w-10" src={require("../img/linkedin.png")}/></a></li>
                            <li><a href="https://www.youtube.com/channel/UCaWP9UzIsK3H9NKx9AruRdA"><img class="w-10" src={require("../img/youtube.png")}/></a></li>
                        </ul>
                        <a>Conditions générales d'utilisation</a>
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