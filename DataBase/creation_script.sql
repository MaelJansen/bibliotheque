-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : 172.16.1.2
-- Généré le : lun. 27 mars 2023 à 11:30
-- Version du serveur :  10.3.29-MariaDB-0+deb10u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etu_loileveque`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `AUT_Id` int(11) NOT NULL,
  `AUT_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`AUT_Id`, `AUT_Name`) VALUES
(1, 'Gerry Duggan'),
(2, 'Scott Koblish'),
(3, 'Matteo Lolli'),
(4, 'Michael B. Bendis'),
(5, 'Mike Deodato Jr'),
(6, 'Tom Taylor'),
(7, 'David Lopez'),
(8, 'Alain René Poirier'),
(9, 'L.J. Shen'),
(10, 'Terubo Aono'),
(11, 'Dan Slott'),
(12, 'VENICE. Magistrato della Sanità'),
(13, 'Cesare BALBO (Count.)'),
(14, 'Ricordano MALESPINI'),
(15, 'Pietro Estense Selvatico'),
(16, 'Giovanni Stefano Ferrari'),
(17, 'Accademia dei Filopieri (BOLOGNA)'),
(18, 'Samuel Loussouarn'),
(19, 'Mathieu-François Pidansat de Mairobert'),
(20, 'Mathieu François Pidanzat de Mairobert'),
(21, 'Mathieu François Pidansat de Mairobert'),
(22, 'Francesco Petrarca'),
(23, 'Pierre GAUTRUCHE'),
(24, 'Paul Revere Frothingham'),
(25, 'Tommy Hilfiger'),
(26, 'David A. Keeps'),
(27, 'Marjorie Bartholomew Paradis'),
(28, 'William F. Fitzgerald (Jr.)'),
(29, 'Anne Parrish'),
(30, 'Louis Herbert Gray'),
(31, 'George Foot Moore'),
(32, 'John Arnott MacCulloch'),
(33, 'Ulick O\'Connor'),
(34, 'Harold Bloom'),
(35, 'United States. Securities and Exchange Commission'),
(36, 'Elena Ruth Marshall'),
(37, 'Grover Lewis'),
(38, 'Barbara Kellerman'),
(39, 'Sebastiano Fantoni Castrucci'),
(40, 'José da Fonseca'),
(41, 'Luigi Ferdinando Marsili'),
(42, 'Carlo Fèa'),
(43, 'Alfano Alfani'),
(44, 'Louis DEBUSSI'),
(45, 'Luciano LIBERATORE (del SS. Redentore.)'),
(46, 'Ercole Ricotti'),
(47, 'Niccolò Sormani'),
(48, 'Omero BOZINO'),
(49, 'Girolamo Ferrari'),
(50, 'Comitato nazionale per le manifestazioni celebrative del 4° centenario della nascita di Galileo Galilei. Convegno (1964, 14-16 septembre. Florence-Pise)'),
(51, 'Symposium internazionale di storia, metodologia, logica e filosofia della scienza, Florence and Pisa, 1964'),
(52, 'Francine Charest'),
(53, 'Alain Lavigne'),
(54, 'Charles Moumouni'),
(55, 'Christophe Alcantara'),
(56, 'Archives départementales du Morbihan'),
(57, 'Akhtarhusein A. Tayebali'),
(58, 'Ching-ping Fang'),
(59, 'Commission of the European Communities. Library (Brussels, Belgium)'),
(60, 'Jan Hendrik Waszink'),
(61, 'Laurie ROUSSEAU'),
(62, 'Colin Sydenham Moore'),
(63, 'Adolphe Brisson'),
(64, 'Kollengode Subramanian Venkataraman'),
(65, 'M. H. Panhwar'),
(66, 'Thomas C. DURAND'),
(67, 'Statistical Office of the European Communities'),
(68, 'United States. National Oceanic and Atmospheric Administration');

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `BOO_Id` int(11) NOT NULL,
  `BOO_Category_id` int(11) DEFAULT NULL,
  `BOO_Editor_id` int(11) DEFAULT NULL,
  `BOO_Name` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BOO_Summary` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOO_Nb_pages` int(11) DEFAULT NULL,
  `BOO_Link_img` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`BOO_Id`, `BOO_Category_id`, `BOO_Editor_id`, `BOO_Name`, `BOO_Summary`, `BOO_Nb_pages`, `BOO_Link_img`) VALUES
(1, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(2, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(3, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(4, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(5, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(6, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(7, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(8, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(9, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(10, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(11, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(12, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(13, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(14, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(15, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(16, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(17, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(18, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(19, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(20, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(21, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(22, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(23, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(24, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(25, 8, 8, 'Intégrale - All Saints High', 'Seul l’amour peut les sauver... s’il ne les détruit pas avant Bienvenue à All Saints High, lycée d’élite de Californie, où les populaires n’hésitent pas à écraser les plus fragiles. C’est là, derrière le ballet des faux-semblants, que naissent des passions aussi intenses que destructrices. Admirés pour leur physique magnétique, craints pour leur absence complète de compassion, Penn, Knight et Vaughn s’imposent comme les rois du campus, et collectionnent les cœurs brisés comme les ennemis. Qui saura capturer ces séducteurs rebelles, qui inspirent autant de crainte que le désir ? Découvrez les histoires de Daria & Penn, Luna & Knight, Lenora & Vaughn. DIRTY DEVIL BROKEN KNIGHT ANGRY GOD Retrouvez l\'intégrale de la série All Saints High, de L.J. Shen, en un seul clic ! À propos de l’autrice L.J. Shen s’est imposée dès son tout premier roman comme une voix incontournable de la romance New Adult – un succès confirmé dès la parution de Vicious qui s’est immédiatement hissé en tête de tous les palmarès de vente. Elle vit en Californie du Nord avec son mari et leur petit garçon.', 1224, 'http://books.google.com/books/content?id=my9yEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(26, 1, 9, 'All Free T01', 'Jun Mifune est une judokate passionnée et lointaine descendante de Kyûzô Mifune, considéré comme le plus grand technicien du judo. Elle voue une admiration sans borne à son oncle, Hayaki Mifune, ancien champion du monde toutes catégories, s’étant retiré de la compétition. Pour suivre ses traces et lui prouver que le judo est un sport captivant, la jeune adolescente de 15 ans se décide à affronter des hommes plus lourds qu’elle... Lui-même judoka de ceinture noire, Terubo Aono nous livre toute son expertise et son savoir dans cette série en deux volumes. Avec All Free!, découvrez l’histoire d’une judokate optimiste, qui, malgré son corps délicat, compte bien en découdre avec ses adversaires : vitesse, anticipation et théories seront ses armes !', 241, 'http://books.google.com/books/content?id=8TRjEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(27, 1, 10, 'All-New Amazing Spider-Man (2015)', 'Peter, désormais PDG de Parker Industries, ne se déplace jamais sans son garde du corps Spider-Man ! Le héros va devoir affronter une équipe de super-vilains redoutable. Face au Zodiaque, le Tisseur pourra compter sur Mockingbird.', 136, 'http://books.google.com/books/content?id=XHeqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(28, NULL, NULL, 'Relationi di varie Pesti in Italia sin\'all\'anno corrente 1630. Con tutti li segni di quelle, e rimedij esperimentati nella vera cura ... stampate per ordine del magistrato della sanità di Venetia e ristampate ... ad instanza d\'A. Paladino', NULL, 74, 'http://books.google.com/books/content?id=KixkAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(29, NULL, NULL, 'Della storia d\'Italia dalle origini fino all\'anno 1814. Sommario ... Edizione quarta, fatta sulla prima compiuta, copiosamente corretta ed ampliata', NULL, 484, 'http://books.google.com/books/content?id=9k5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(30, NULL, NULL, 'Historia Antica dall\' edificazione di Fiorenza per insino all\' anno MCCLXXI. Con l\'aggiunta di Giachetto suo nipote dal detto anno per insino al 1286. Nuovamente posta in luce', NULL, 360, 'http://books.google.com/books/content?id=qi1YAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(31, NULL, NULL, 'Intorno alle condizioni presenti delle arti del disegno e all\'influenza che vi esercitano le accademie artistiche, considerazioni', NULL, 122, 'http://books.google.com/books/content?id=gygDAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(32, NULL, NULL, 'Porta all\'Eternita battula d\'Orationi jaculatorie', NULL, 470, 'http://books.google.com/books/content?id=KNQ8AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(33, NULL, NULL, 'All\' eminentissimo signor cardinale Giuseppe Mezzofanti bolognese, elevato all\' onore della porpora romana l\'anno 1838, applausi degli Accademici Filopierj', NULL, 100, 'http://books.google.com/books/content?id=_A5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(34, 9, 11, 'All Blacks Academy - Tome 3 - Un tournoi inoubliable', 'Il y a un an, si on m\'avait dit que j\'allais participer au Tournoi des Six Nations, j\'aurais cru qu\'on me faisait une blague ! Et pourtant, me voilà aujourd\'hui dans la ville de rugby en Angleterre pour représenter la All Blacks Academy lors de cette compétition légendaire. Cette année, exceptionnellement, la Nouvelle-Zélande est invitée au Tournoi. J\'ai l\'impression de vivre un rêve éveillé. Enfin, presque... Car Mathis, mon éternel rival, est lui aussi de la partie. Et il est bien décidé à décrocher la place de demi de mêlée titulaire et me renvoyer sur le banc des remplaçants ! Heureusement, mes coéquipiers, mes amis et ma famille sont là pour me soutenir. Si on veut remporter la coupe, il va falloir se dépasser et se montrer digne de la fougère argentée des All Blacks.', 192, 'http://books.google.com/books/content?id=5He_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(35, NULL, NULL, 'Lettera all\'Ill. S. Bali d\'Acri Fra Don Ant. Emanuel di Lisbona, contenente la Relazione delle feste fatte in Siena in occasione dell\'Esaltazione al Gran Magistero di Malta dell\'Emin. e Rev. Fra Marc\'Antonio Zondari', NULL, 20, 'http://books.google.com/books/content?id=LSZXAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(36, NULL, NULL, 'L\'espion anglais ou Correspondance secrète entre milord All\'eye et milord All\'ear', NULL, NULL, 'http://books.google.com/books/content?id=Ico_AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(37, 10, NULL, 'L\' Espion anglois ou correspondance secrète entre milord All\'eye et milord All\'ear', NULL, 400, 'http://books.google.com/books/content?id=d5sPAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(38, 11, NULL, '“L\'”Observateur Anglois, Ou Correspondance Secrete Entre Milord All\'Eye Et Milord All\'Ear', NULL, 504, 'http://books.google.com/books/content?id=YPsFAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(39, NULL, NULL, 'L\'espion anglois, ou correspondance secrète entre Milord All\'Eye et Milord All\'Ear', NULL, 476, 'http://books.google.com/books/content?id=MWVeAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(40, 11, NULL, 'L\'observateur anglois, ou Correspondance secrete entre Milord All\'Eye et Milord All\'Ear [sic] ...', NULL, 412, 'http://books.google.com/books/content?id=qSkGAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(41, NULL, NULL, 'Lettere di M. Francesco Petrarca all\'autor della prefazione premessa alla Rettorica d\'Aristotile fatta in lingua Toscana dal Commendatore A. Caro [P. Bassaglia. Dated, “Da\'felicissimi Campi Elisj”].', NULL, 120, 'http://books.google.com/books/content?id=Q59cAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(42, NULL, NULL, 'L\'espion anglois ou Correspondance secrète entre milord All\'eye et milord All\'ar', NULL, 444, 'http://books.google.com/books/content?id=9-laAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(43, NULL, NULL, 'The poetical histories, being a compleat collection of all the stories necessary for a perfect understanding of the Greek and Latine poets and other ancient authors ... Englisht and enricht with observation concerning the gods worshipped by our ancestors in this island, ... unto which are added two treatises, one of the curiosities of old Rome ... the other containing the most remarkable hieroglyphicks of Aegypt. By M. D\'Assigny', NULL, 478, 'http://books.google.com/books/content?id=yudoAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(44, 12, NULL, 'All These', NULL, 342, 'http://books.google.com/books/content?id=S2FkAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(45, 13, NULL, 'All American', 'This book is Hilfiger\'\'s personal celebration of American design classics, going as far back as the 50s and 60s to examine the elements of style that have influenced his wardrobe and formed his design sensibility.\'', 191, 'http://books.google.com/books/content?id=0wFBqTvT4u0C&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(46, 14, NULL, 'All India Reporter', NULL, 310, 'http://books.google.com/books/content?id=3ao2AAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(47, 15, NULL, 'Operating All-terrain Vehicles in the State of Washington', NULL, 13, 'http://books.google.com/books/content?id=8_JNAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(48, 16, NULL, 'One-act Plays for All-girl Casts', NULL, 193, 'http://books.google.com/books/content?id=k69RAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(49, 17, NULL, 'Gentlemen All', NULL, 314, 'http://books.google.com/books/content?id=aOVOAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(50, NULL, NULL, 'All Kneeling', NULL, 344, 'http://books.google.com/books/content?id=PQ41AAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(51, 18, NULL, 'The Mythology of All Races ...', NULL, 620, 'http://books.google.com/books/content?id=Am4AAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(52, NULL, NULL, 'Tudor Facsimile Texts: Two wise men and all the rest fools. 1913', NULL, NULL, 'http://books.google.com/books/content?id=yTRJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(53, NULL, NULL, 'All Things Counter', NULL, 50, 'http://books.google.com/books/content?id=UxWrAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(54, 19, 12, 'Robert Penn Warren\'s All the King\'s Men', 'A collection of critical essays on Warren\'s novel \"All the King\'s Men\" arranged in chronological order of publication.', 184, 'http://books.google.com/books/content?id=4--wAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(55, NULL, NULL, 'Judicial Decisions, Comprising All Court Decisions, Reported and Unreported, in Civil and Criminal Cases Involving Statutes Administeredd by the Securities and Exchange Commission', NULL, NULL, 'http://books.google.com/books/content?id=J7_1aH70CdIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(56, NULL, NULL, 'All Over', NULL, 462, 'http://books.google.com/books/content?id=sFvJc2Q4qQoC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(57, 14, NULL, 'The All Pakistan Legal Decisions', '\"Containing cases decided by the Federal Court, Privy Council, High Courts of Dacca, Lahore and Baghdad-ul-Jadid, Azad Jammu and Kashmir, Chief Court of Sind, Judicial Commissioner\'s Courts--Baluchistan and Peshawar, and revenue decisions Punjab\" (varies).', 430, 'http://books.google.com/books/content?id=t1M-AQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(58, 20, NULL, 'Proceedings of All India Symposium on Refrigeration, Air Conditioning and Environmental Control, March 10-11, 1967', NULL, 272, 'http://books.google.com/books/content?id=7K6aAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(59, 21, NULL, 'Academy All the Way', NULL, 362, 'http://books.google.com/books/content?id=OakPAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(60, 22, NULL, 'All the President\'s Kin', 'A provocative guide to the First Families from the Kennedys to the Reagans examines the different and important roles that family members play in presidential politics.', 320, 'http://books.google.com/books/content?id=Eo9NAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(61, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(62, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(63, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(64, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(65, 8, 8, 'Intégrale - All Saints High', 'Seul l’amour peut les sauver... s’il ne les détruit pas avant Bienvenue à All Saints High, lycée d’élite de Californie, où les populaires n’hésitent pas à écraser les plus fragiles. C’est là, derrière le ballet des faux-semblants, que naissent des passions aussi intenses que destructrices. Admirés pour leur physique magnétique, craints pour leur absence complète de compassion, Penn, Knight et Vaughn s’imposent comme les rois du campus, et collectionnent les cœurs brisés comme les ennemis. Qui saura capturer ces séducteurs rebelles, qui inspirent autant de crainte que le désir ? Découvrez les histoires de Daria & Penn, Luna & Knight, Lenora & Vaughn. DIRTY DEVIL BROKEN KNIGHT ANGRY GOD Retrouvez l\'intégrale de la série All Saints High, de L.J. Shen, en un seul clic ! À propos de l’autrice L.J. Shen s’est imposée dès son tout premier roman comme une voix incontournable de la romance New Adult – un succès confirmé dès la parution de Vicious qui s’est immédiatement hissé en tête de tous les palmarès de vente. Elle vit en Californie du Nord avec son mari et leur petit garçon.', 1224, 'http://books.google.com/books/content?id=my9yEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(66, 1, 9, 'All Free T01', 'Jun Mifune est une judokate passionnée et lointaine descendante de Kyûzô Mifune, considéré comme le plus grand technicien du judo. Elle voue une admiration sans borne à son oncle, Hayaki Mifune, ancien champion du monde toutes catégories, s’étant retiré de la compétition. Pour suivre ses traces et lui prouver que le judo est un sport captivant, la jeune adolescente de 15 ans se décide à affronter des hommes plus lourds qu’elle... Lui-même judoka de ceinture noire, Terubo Aono nous livre toute son expertise et son savoir dans cette série en deux volumes. Avec All Free!, découvrez l’histoire d’une judokate optimiste, qui, malgré son corps délicat, compte bien en découdre avec ses adversaires : vitesse, anticipation et théories seront ses armes !', 241, 'http://books.google.com/books/content?id=8TRjEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(67, 1, 10, 'All-New Amazing Spider-Man (2015)', 'Peter, désormais PDG de Parker Industries, ne se déplace jamais sans son garde du corps Spider-Man ! Le héros va devoir affronter une équipe de super-vilains redoutable. Face au Zodiaque, le Tisseur pourra compter sur Mockingbird.', 136, 'http://books.google.com/books/content?id=XHeqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(68, NULL, NULL, 'Relationi di varie Pesti in Italia sin\'all\'anno corrente 1630. Con tutti li segni di quelle, e rimedij esperimentati nella vera cura ... stampate per ordine del magistrato della sanità di Venetia e ristampate ... ad instanza d\'A. Paladino', NULL, 74, 'http://books.google.com/books/content?id=KixkAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(69, NULL, NULL, 'Della storia d\'Italia dalle origini fino all\'anno 1814. Sommario ... Edizione quarta, fatta sulla prima compiuta, copiosamente corretta ed ampliata', NULL, 484, 'http://books.google.com/books/content?id=9k5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(70, NULL, NULL, 'Historia Antica dall\' edificazione di Fiorenza per insino all\' anno MCCLXXI. Con l\'aggiunta di Giachetto suo nipote dal detto anno per insino al 1286. Nuovamente posta in luce', NULL, 360, 'http://books.google.com/books/content?id=qi1YAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(71, NULL, NULL, 'Intorno alle condizioni presenti delle arti del disegno e all\'influenza che vi esercitano le accademie artistiche, considerazioni', NULL, 122, 'http://books.google.com/books/content?id=gygDAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(72, NULL, NULL, 'Porta all\'Eternita battula d\'Orationi jaculatorie', NULL, 470, 'http://books.google.com/books/content?id=KNQ8AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(73, NULL, NULL, 'All\' eminentissimo signor cardinale Giuseppe Mezzofanti bolognese, elevato all\' onore della porpora romana l\'anno 1838, applausi degli Accademici Filopierj', NULL, 100, 'http://books.google.com/books/content?id=_A5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(74, 9, 11, 'All Blacks Academy - Tome 3 - Un tournoi inoubliable', 'Il y a un an, si on m\'avait dit que j\'allais participer au Tournoi des Six Nations, j\'aurais cru qu\'on me faisait une blague ! Et pourtant, me voilà aujourd\'hui dans la ville de rugby en Angleterre pour représenter la All Blacks Academy lors de cette compétition légendaire. Cette année, exceptionnellement, la Nouvelle-Zélande est invitée au Tournoi. J\'ai l\'impression de vivre un rêve éveillé. Enfin, presque... Car Mathis, mon éternel rival, est lui aussi de la partie. Et il est bien décidé à décrocher la place de demi de mêlée titulaire et me renvoyer sur le banc des remplaçants ! Heureusement, mes coéquipiers, mes amis et ma famille sont là pour me soutenir. Si on veut remporter la coupe, il va falloir se dépasser et se montrer digne de la fougère argentée des All Blacks.', 192, 'http://books.google.com/books/content?id=5He_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(75, NULL, NULL, 'Lettera all\'Ill. S. Bali d\'Acri Fra Don Ant. Emanuel di Lisbona, contenente la Relazione delle feste fatte in Siena in occasione dell\'Esaltazione al Gran Magistero di Malta dell\'Emin. e Rev. Fra Marc\'Antonio Zondari', NULL, 20, 'http://books.google.com/books/content?id=LSZXAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(76, NULL, NULL, 'L\'espion anglais ou Correspondance secrète entre milord All\'eye et milord All\'ear', NULL, NULL, 'http://books.google.com/books/content?id=Ico_AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(77, 10, NULL, 'L\' Espion anglois ou correspondance secrète entre milord All\'eye et milord All\'ear', NULL, 400, 'http://books.google.com/books/content?id=d5sPAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(78, 11, NULL, '“L\'”Observateur Anglois, Ou Correspondance Secrete Entre Milord All\'Eye Et Milord All\'Ear', NULL, 504, 'http://books.google.com/books/content?id=YPsFAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(79, NULL, NULL, 'L\'espion anglois, ou correspondance secrète entre Milord All\'Eye et Milord All\'Ear', NULL, 476, 'http://books.google.com/books/content?id=MWVeAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(80, 11, NULL, 'L\'observateur anglois, ou Correspondance secrete entre Milord All\'Eye et Milord All\'Ear [sic] ...', NULL, 412, 'http://books.google.com/books/content?id=qSkGAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(81, NULL, NULL, 'Lettere di M. Francesco Petrarca all\'autor della prefazione premessa alla Rettorica d\'Aristotile fatta in lingua Toscana dal Commendatore A. Caro [P. Bassaglia. Dated, “Da\'felicissimi Campi Elisj”].', NULL, 120, 'http://books.google.com/books/content?id=Q59cAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(82, NULL, NULL, 'L\'espion anglois ou Correspondance secrète entre milord All\'eye et milord All\'ar', NULL, 444, 'http://books.google.com/books/content?id=9-laAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(83, NULL, NULL, 'The poetical histories, being a compleat collection of all the stories necessary for a perfect understanding of the Greek and Latine poets and other ancient authors ... Englisht and enricht with observation concerning the gods worshipped by our ancestors in this island, ... unto which are added two treatises, one of the curiosities of old Rome ... the other containing the most remarkable hieroglyphicks of Aegypt. By M. D\'Assigny', NULL, 478, 'http://books.google.com/books/content?id=yudoAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(84, 12, NULL, 'All These', NULL, 342, 'http://books.google.com/books/content?id=S2FkAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(85, 13, NULL, 'All American', 'This book is Hilfiger\'\'s personal celebration of American design classics, going as far back as the 50s and 60s to examine the elements of style that have influenced his wardrobe and formed his design sensibility.\'', 191, 'http://books.google.com/books/content?id=0wFBqTvT4u0C&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(86, 14, NULL, 'All India Reporter', NULL, 310, 'http://books.google.com/books/content?id=3ao2AAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(87, 15, NULL, 'Operating All-terrain Vehicles in the State of Washington', NULL, 13, 'http://books.google.com/books/content?id=8_JNAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(88, 16, NULL, 'One-act Plays for All-girl Casts', NULL, 193, 'http://books.google.com/books/content?id=k69RAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(89, 17, NULL, 'Gentlemen All', NULL, 314, 'http://books.google.com/books/content?id=aOVOAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(90, NULL, NULL, 'All Kneeling', NULL, 344, 'http://books.google.com/books/content?id=PQ41AAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(91, 18, NULL, 'The Mythology of All Races ...', NULL, 620, 'http://books.google.com/books/content?id=Am4AAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(92, NULL, NULL, 'Tudor Facsimile Texts: Two wise men and all the rest fools. 1913', NULL, NULL, 'http://books.google.com/books/content?id=yTRJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(93, NULL, NULL, 'All Things Counter', NULL, 50, 'http://books.google.com/books/content?id=UxWrAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(94, 19, 12, 'Robert Penn Warren\'s All the King\'s Men', 'A collection of critical essays on Warren\'s novel \"All the King\'s Men\" arranged in chronological order of publication.', 184, 'http://books.google.com/books/content?id=4--wAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(95, NULL, NULL, 'Judicial Decisions, Comprising All Court Decisions, Reported and Unreported, in Civil and Criminal Cases Involving Statutes Administeredd by the Securities and Exchange Commission', NULL, NULL, 'http://books.google.com/books/content?id=J7_1aH70CdIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(96, NULL, NULL, 'All Over', NULL, 462, 'http://books.google.com/books/content?id=sFvJc2Q4qQoC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(97, 14, NULL, 'The All Pakistan Legal Decisions', '\"Containing cases decided by the Federal Court, Privy Council, High Courts of Dacca, Lahore and Baghdad-ul-Jadid, Azad Jammu and Kashmir, Chief Court of Sind, Judicial Commissioner\'s Courts--Baluchistan and Peshawar, and revenue decisions Punjab\" (varies).', 430, 'http://books.google.com/books/content?id=t1M-AQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(98, 20, NULL, 'Proceedings of All India Symposium on Refrigeration, Air Conditioning and Environmental Control, March 10-11, 1967', NULL, 272, 'http://books.google.com/books/content?id=7K6aAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(99, 21, NULL, 'Academy All the Way', NULL, 362, 'http://books.google.com/books/content?id=OakPAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(100, 22, NULL, 'All the President\'s Kin', 'A provocative guide to the First Families from the Kennedys to the Reagans examines the different and important roles that family members play in presidential politics.', 320, 'http://books.google.com/books/content?id=Eo9NAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(101, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(102, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(103, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(104, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(105, 8, 8, 'Intégrale - All Saints High', 'Seul l’amour peut les sauver... s’il ne les détruit pas avant Bienvenue à All Saints High, lycée d’élite de Californie, où les populaires n’hésitent pas à écraser les plus fragiles. C’est là, derrière le ballet des faux-semblants, que naissent des passions aussi intenses que destructrices. Admirés pour leur physique magnétique, craints pour leur absence complète de compassion, Penn, Knight et Vaughn s’imposent comme les rois du campus, et collectionnent les cœurs brisés comme les ennemis. Qui saura capturer ces séducteurs rebelles, qui inspirent autant de crainte que le désir ? Découvrez les histoires de Daria & Penn, Luna & Knight, Lenora & Vaughn. DIRTY DEVIL BROKEN KNIGHT ANGRY GOD Retrouvez l\'intégrale de la série All Saints High, de L.J. Shen, en un seul clic ! À propos de l’autrice L.J. Shen s’est imposée dès son tout premier roman comme une voix incontournable de la romance New Adult – un succès confirmé dès la parution de Vicious qui s’est immédiatement hissé en tête de tous les palmarès de vente. Elle vit en Californie du Nord avec son mari et leur petit garçon.', 1224, 'http://books.google.com/books/content?id=my9yEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(106, 1, 9, 'All Free T01', 'Jun Mifune est une judokate passionnée et lointaine descendante de Kyûzô Mifune, considéré comme le plus grand technicien du judo. Elle voue une admiration sans borne à son oncle, Hayaki Mifune, ancien champion du monde toutes catégories, s’étant retiré de la compétition. Pour suivre ses traces et lui prouver que le judo est un sport captivant, la jeune adolescente de 15 ans se décide à affronter des hommes plus lourds qu’elle... Lui-même judoka de ceinture noire, Terubo Aono nous livre toute son expertise et son savoir dans cette série en deux volumes. Avec All Free!, découvrez l’histoire d’une judokate optimiste, qui, malgré son corps délicat, compte bien en découdre avec ses adversaires : vitesse, anticipation et théories seront ses armes !', 241, 'http://books.google.com/books/content?id=8TRjEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(107, 1, 10, 'All-New Amazing Spider-Man (2015)', 'Peter, désormais PDG de Parker Industries, ne se déplace jamais sans son garde du corps Spider-Man ! Le héros va devoir affronter une équipe de super-vilains redoutable. Face au Zodiaque, le Tisseur pourra compter sur Mockingbird.', 136, 'http://books.google.com/books/content?id=XHeqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(108, NULL, NULL, 'Relationi di varie Pesti in Italia sin\'all\'anno corrente 1630. Con tutti li segni di quelle, e rimedij esperimentati nella vera cura ... stampate per ordine del magistrato della sanità di Venetia e ristampate ... ad instanza d\'A. Paladino', NULL, 74, 'http://books.google.com/books/content?id=KixkAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(109, NULL, NULL, 'Della storia d\'Italia dalle origini fino all\'anno 1814. Sommario ... Edizione quarta, fatta sulla prima compiuta, copiosamente corretta ed ampliata', NULL, 484, 'http://books.google.com/books/content?id=9k5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(110, NULL, NULL, 'Historia Antica dall\' edificazione di Fiorenza per insino all\' anno MCCLXXI. Con l\'aggiunta di Giachetto suo nipote dal detto anno per insino al 1286. Nuovamente posta in luce', NULL, 360, 'http://books.google.com/books/content?id=qi1YAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(111, NULL, NULL, 'Intorno alle condizioni presenti delle arti del disegno e all\'influenza che vi esercitano le accademie artistiche, considerazioni', NULL, 122, 'http://books.google.com/books/content?id=gygDAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(112, NULL, NULL, 'Porta all\'Eternita battula d\'Orationi jaculatorie', NULL, 470, 'http://books.google.com/books/content?id=KNQ8AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(113, NULL, NULL, 'All\' eminentissimo signor cardinale Giuseppe Mezzofanti bolognese, elevato all\' onore della porpora romana l\'anno 1838, applausi degli Accademici Filopierj', NULL, 100, 'http://books.google.com/books/content?id=_A5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(114, 9, 11, 'All Blacks Academy - Tome 3 - Un tournoi inoubliable', 'Il y a un an, si on m\'avait dit que j\'allais participer au Tournoi des Six Nations, j\'aurais cru qu\'on me faisait une blague ! Et pourtant, me voilà aujourd\'hui dans la ville de rugby en Angleterre pour représenter la All Blacks Academy lors de cette compétition légendaire. Cette année, exceptionnellement, la Nouvelle-Zélande est invitée au Tournoi. J\'ai l\'impression de vivre un rêve éveillé. Enfin, presque... Car Mathis, mon éternel rival, est lui aussi de la partie. Et il est bien décidé à décrocher la place de demi de mêlée titulaire et me renvoyer sur le banc des remplaçants ! Heureusement, mes coéquipiers, mes amis et ma famille sont là pour me soutenir. Si on veut remporter la coupe, il va falloir se dépasser et se montrer digne de la fougère argentée des All Blacks.', 192, 'http://books.google.com/books/content?id=5He_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(115, NULL, NULL, 'Lettera all\'Ill. S. Bali d\'Acri Fra Don Ant. Emanuel di Lisbona, contenente la Relazione delle feste fatte in Siena in occasione dell\'Esaltazione al Gran Magistero di Malta dell\'Emin. e Rev. Fra Marc\'Antonio Zondari', NULL, 20, 'http://books.google.com/books/content?id=LSZXAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(116, NULL, NULL, 'L\'espion anglais ou Correspondance secrète entre milord All\'eye et milord All\'ear', NULL, NULL, 'http://books.google.com/books/content?id=Ico_AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(117, 10, NULL, 'L\' Espion anglois ou correspondance secrète entre milord All\'eye et milord All\'ear', NULL, 400, 'http://books.google.com/books/content?id=d5sPAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(118, 11, NULL, '“L\'”Observateur Anglois, Ou Correspondance Secrete Entre Milord All\'Eye Et Milord All\'Ear', NULL, 504, 'http://books.google.com/books/content?id=YPsFAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(119, NULL, NULL, 'L\'espion anglois, ou correspondance secrète entre Milord All\'Eye et Milord All\'Ear', NULL, 476, 'http://books.google.com/books/content?id=MWVeAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(120, 11, NULL, 'L\'observateur anglois, ou Correspondance secrete entre Milord All\'Eye et Milord All\'Ear [sic] ...', NULL, 412, 'http://books.google.com/books/content?id=qSkGAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(121, NULL, NULL, 'Lettere di M. Francesco Petrarca all\'autor della prefazione premessa alla Rettorica d\'Aristotile fatta in lingua Toscana dal Commendatore A. Caro [P. Bassaglia. Dated, “Da\'felicissimi Campi Elisj”].', NULL, 120, 'http://books.google.com/books/content?id=Q59cAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(122, NULL, NULL, 'L\'espion anglois ou Correspondance secrète entre milord All\'eye et milord All\'ar', NULL, 444, 'http://books.google.com/books/content?id=9-laAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(123, NULL, NULL, 'The poetical histories, being a compleat collection of all the stories necessary for a perfect understanding of the Greek and Latine poets and other ancient authors ... Englisht and enricht with observation concerning the gods worshipped by our ancestors in this island, ... unto which are added two treatises, one of the curiosities of old Rome ... the other containing the most remarkable hieroglyphicks of Aegypt. By M. D\'Assigny', NULL, 478, 'http://books.google.com/books/content?id=yudoAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(124, 12, NULL, 'All These', NULL, 342, 'http://books.google.com/books/content?id=S2FkAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(125, 13, NULL, 'All American', 'This book is Hilfiger\'\'s personal celebration of American design classics, going as far back as the 50s and 60s to examine the elements of style that have influenced his wardrobe and formed his design sensibility.\'', 191, 'http://books.google.com/books/content?id=0wFBqTvT4u0C&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(126, 14, NULL, 'All India Reporter', NULL, 310, 'http://books.google.com/books/content?id=3ao2AAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(127, 15, NULL, 'Operating All-terrain Vehicles in the State of Washington', NULL, 13, 'http://books.google.com/books/content?id=8_JNAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(128, 16, NULL, 'One-act Plays for All-girl Casts', NULL, 193, 'http://books.google.com/books/content?id=k69RAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(129, 17, NULL, 'Gentlemen All', NULL, 314, 'http://books.google.com/books/content?id=aOVOAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(130, NULL, NULL, 'All Kneeling', NULL, 344, 'http://books.google.com/books/content?id=PQ41AAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(131, 18, NULL, 'The Mythology of All Races ...', NULL, 620, 'http://books.google.com/books/content?id=Am4AAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(132, NULL, NULL, 'Tudor Facsimile Texts: Two wise men and all the rest fools. 1913', NULL, NULL, 'http://books.google.com/books/content?id=yTRJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(133, NULL, NULL, 'All Things Counter', NULL, 50, 'http://books.google.com/books/content?id=UxWrAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(134, 19, 12, 'Robert Penn Warren\'s All the King\'s Men', 'A collection of critical essays on Warren\'s novel \"All the King\'s Men\" arranged in chronological order of publication.', 184, 'http://books.google.com/books/content?id=4--wAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(135, NULL, NULL, 'Judicial Decisions, Comprising All Court Decisions, Reported and Unreported, in Civil and Criminal Cases Involving Statutes Administeredd by the Securities and Exchange Commission', NULL, NULL, 'http://books.google.com/books/content?id=J7_1aH70CdIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(136, NULL, NULL, 'All Over', NULL, 462, 'http://books.google.com/books/content?id=sFvJc2Q4qQoC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(137, 14, NULL, 'The All Pakistan Legal Decisions', '\"Containing cases decided by the Federal Court, Privy Council, High Courts of Dacca, Lahore and Baghdad-ul-Jadid, Azad Jammu and Kashmir, Chief Court of Sind, Judicial Commissioner\'s Courts--Baluchistan and Peshawar, and revenue decisions Punjab\" (varies).', 430, 'http://books.google.com/books/content?id=t1M-AQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(138, 20, NULL, 'Proceedings of All India Symposium on Refrigeration, Air Conditioning and Environmental Control, March 10-11, 1967', NULL, 272, 'http://books.google.com/books/content?id=7K6aAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(139, 21, NULL, 'Academy All the Way', NULL, 362, 'http://books.google.com/books/content?id=OakPAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(140, 22, NULL, 'All the President\'s Kin', 'A provocative guide to the First Families from the Kennedys to the Reagans examines the different and important roles that family members play in presidential politics.', 320, 'http://books.google.com/books/content?id=Eo9NAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(141, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(142, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(143, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(144, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(145, 8, 8, 'Intégrale - All Saints High', 'Seul l’amour peut les sauver... s’il ne les détruit pas avant Bienvenue à All Saints High, lycée d’élite de Californie, où les populaires n’hésitent pas à écraser les plus fragiles. C’est là, derrière le ballet des faux-semblants, que naissent des passions aussi intenses que destructrices. Admirés pour leur physique magnétique, craints pour leur absence complète de compassion, Penn, Knight et Vaughn s’imposent comme les rois du campus, et collectionnent les cœurs brisés comme les ennemis. Qui saura capturer ces séducteurs rebelles, qui inspirent autant de crainte que le désir ? Découvrez les histoires de Daria & Penn, Luna & Knight, Lenora & Vaughn. DIRTY DEVIL BROKEN KNIGHT ANGRY GOD Retrouvez l\'intégrale de la série All Saints High, de L.J. Shen, en un seul clic ! À propos de l’autrice L.J. Shen s’est imposée dès son tout premier roman comme une voix incontournable de la romance New Adult – un succès confirmé dès la parution de Vicious qui s’est immédiatement hissé en tête de tous les palmarès de vente. Elle vit en Californie du Nord avec son mari et leur petit garçon.', 1224, 'http://books.google.com/books/content?id=my9yEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api');
INSERT INTO `book` (`BOO_Id`, `BOO_Category_id`, `BOO_Editor_id`, `BOO_Name`, `BOO_Summary`, `BOO_Nb_pages`, `BOO_Link_img`) VALUES
(146, 1, 9, 'All Free T01', 'Jun Mifune est une judokate passionnée et lointaine descendante de Kyûzô Mifune, considéré comme le plus grand technicien du judo. Elle voue une admiration sans borne à son oncle, Hayaki Mifune, ancien champion du monde toutes catégories, s’étant retiré de la compétition. Pour suivre ses traces et lui prouver que le judo est un sport captivant, la jeune adolescente de 15 ans se décide à affronter des hommes plus lourds qu’elle... Lui-même judoka de ceinture noire, Terubo Aono nous livre toute son expertise et son savoir dans cette série en deux volumes. Avec All Free!, découvrez l’histoire d’une judokate optimiste, qui, malgré son corps délicat, compte bien en découdre avec ses adversaires : vitesse, anticipation et théories seront ses armes !', 241, 'http://books.google.com/books/content?id=8TRjEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(147, 1, 10, 'All-New Amazing Spider-Man (2015)', 'Peter, désormais PDG de Parker Industries, ne se déplace jamais sans son garde du corps Spider-Man ! Le héros va devoir affronter une équipe de super-vilains redoutable. Face au Zodiaque, le Tisseur pourra compter sur Mockingbird.', 136, 'http://books.google.com/books/content?id=XHeqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(148, NULL, NULL, 'Relationi di varie Pesti in Italia sin\'all\'anno corrente 1630. Con tutti li segni di quelle, e rimedij esperimentati nella vera cura ... stampate per ordine del magistrato della sanità di Venetia e ristampate ... ad instanza d\'A. Paladino', NULL, 74, 'http://books.google.com/books/content?id=KixkAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(149, NULL, NULL, 'Della storia d\'Italia dalle origini fino all\'anno 1814. Sommario ... Edizione quarta, fatta sulla prima compiuta, copiosamente corretta ed ampliata', NULL, 484, 'http://books.google.com/books/content?id=9k5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(150, NULL, NULL, 'Historia Antica dall\' edificazione di Fiorenza per insino all\' anno MCCLXXI. Con l\'aggiunta di Giachetto suo nipote dal detto anno per insino al 1286. Nuovamente posta in luce', NULL, 360, 'http://books.google.com/books/content?id=qi1YAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(151, NULL, NULL, 'Intorno alle condizioni presenti delle arti del disegno e all\'influenza che vi esercitano le accademie artistiche, considerazioni', NULL, 122, 'http://books.google.com/books/content?id=gygDAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(152, NULL, NULL, 'Porta all\'Eternita battula d\'Orationi jaculatorie', NULL, 470, 'http://books.google.com/books/content?id=KNQ8AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(153, NULL, NULL, 'All\' eminentissimo signor cardinale Giuseppe Mezzofanti bolognese, elevato all\' onore della porpora romana l\'anno 1838, applausi degli Accademici Filopierj', NULL, 100, 'http://books.google.com/books/content?id=_A5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(154, 9, 11, 'All Blacks Academy - Tome 3 - Un tournoi inoubliable', 'Il y a un an, si on m\'avait dit que j\'allais participer au Tournoi des Six Nations, j\'aurais cru qu\'on me faisait une blague ! Et pourtant, me voilà aujourd\'hui dans la ville de rugby en Angleterre pour représenter la All Blacks Academy lors de cette compétition légendaire. Cette année, exceptionnellement, la Nouvelle-Zélande est invitée au Tournoi. J\'ai l\'impression de vivre un rêve éveillé. Enfin, presque... Car Mathis, mon éternel rival, est lui aussi de la partie. Et il est bien décidé à décrocher la place de demi de mêlée titulaire et me renvoyer sur le banc des remplaçants ! Heureusement, mes coéquipiers, mes amis et ma famille sont là pour me soutenir. Si on veut remporter la coupe, il va falloir se dépasser et se montrer digne de la fougère argentée des All Blacks.', 192, 'http://books.google.com/books/content?id=5He_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(155, NULL, NULL, 'Lettera all\'Ill. S. Bali d\'Acri Fra Don Ant. Emanuel di Lisbona, contenente la Relazione delle feste fatte in Siena in occasione dell\'Esaltazione al Gran Magistero di Malta dell\'Emin. e Rev. Fra Marc\'Antonio Zondari', NULL, 20, 'http://books.google.com/books/content?id=LSZXAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(156, NULL, NULL, 'L\'espion anglais ou Correspondance secrète entre milord All\'eye et milord All\'ear', NULL, NULL, 'http://books.google.com/books/content?id=Ico_AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(157, 10, NULL, 'L\' Espion anglois ou correspondance secrète entre milord All\'eye et milord All\'ear', NULL, 400, 'http://books.google.com/books/content?id=d5sPAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(158, 11, NULL, '“L\'”Observateur Anglois, Ou Correspondance Secrete Entre Milord All\'Eye Et Milord All\'Ear', NULL, 504, 'http://books.google.com/books/content?id=YPsFAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(159, NULL, NULL, 'L\'espion anglois, ou correspondance secrète entre Milord All\'Eye et Milord All\'Ear', NULL, 476, 'http://books.google.com/books/content?id=MWVeAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(160, 11, NULL, 'L\'observateur anglois, ou Correspondance secrete entre Milord All\'Eye et Milord All\'Ear [sic] ...', NULL, 412, 'http://books.google.com/books/content?id=qSkGAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(161, NULL, NULL, 'Lettere di M. Francesco Petrarca all\'autor della prefazione premessa alla Rettorica d\'Aristotile fatta in lingua Toscana dal Commendatore A. Caro [P. Bassaglia. Dated, “Da\'felicissimi Campi Elisj”].', NULL, 120, 'http://books.google.com/books/content?id=Q59cAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(162, NULL, NULL, 'L\'espion anglois ou Correspondance secrète entre milord All\'eye et milord All\'ar', NULL, 444, 'http://books.google.com/books/content?id=9-laAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(163, NULL, NULL, 'The poetical histories, being a compleat collection of all the stories necessary for a perfect understanding of the Greek and Latine poets and other ancient authors ... Englisht and enricht with observation concerning the gods worshipped by our ancestors in this island, ... unto which are added two treatises, one of the curiosities of old Rome ... the other containing the most remarkable hieroglyphicks of Aegypt. By M. D\'Assigny', NULL, 478, 'http://books.google.com/books/content?id=yudoAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(164, 12, NULL, 'All These', NULL, 342, 'http://books.google.com/books/content?id=S2FkAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(165, 13, NULL, 'All American', 'This book is Hilfiger\'\'s personal celebration of American design classics, going as far back as the 50s and 60s to examine the elements of style that have influenced his wardrobe and formed his design sensibility.\'', 191, 'http://books.google.com/books/content?id=0wFBqTvT4u0C&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(166, 14, NULL, 'All India Reporter', NULL, 310, 'http://books.google.com/books/content?id=3ao2AAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(167, 15, NULL, 'Operating All-terrain Vehicles in the State of Washington', NULL, 13, 'http://books.google.com/books/content?id=8_JNAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(168, 16, NULL, 'One-act Plays for All-girl Casts', NULL, 193, 'http://books.google.com/books/content?id=k69RAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(169, 17, NULL, 'Gentlemen All', NULL, 314, 'http://books.google.com/books/content?id=aOVOAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(170, NULL, NULL, 'All Kneeling', NULL, 344, 'http://books.google.com/books/content?id=PQ41AAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(171, 18, NULL, 'The Mythology of All Races ...', NULL, 620, 'http://books.google.com/books/content?id=Am4AAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(172, NULL, NULL, 'Tudor Facsimile Texts: Two wise men and all the rest fools. 1913', NULL, NULL, 'http://books.google.com/books/content?id=yTRJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(173, NULL, NULL, 'All Things Counter', NULL, 50, 'http://books.google.com/books/content?id=UxWrAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(174, 19, 12, 'Robert Penn Warren\'s All the King\'s Men', 'A collection of critical essays on Warren\'s novel \"All the King\'s Men\" arranged in chronological order of publication.', 184, 'http://books.google.com/books/content?id=4--wAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(175, NULL, NULL, 'Judicial Decisions, Comprising All Court Decisions, Reported and Unreported, in Civil and Criminal Cases Involving Statutes Administeredd by the Securities and Exchange Commission', NULL, NULL, 'http://books.google.com/books/content?id=J7_1aH70CdIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(176, NULL, NULL, 'All Over', NULL, 462, 'http://books.google.com/books/content?id=sFvJc2Q4qQoC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(177, 14, NULL, 'The All Pakistan Legal Decisions', '\"Containing cases decided by the Federal Court, Privy Council, High Courts of Dacca, Lahore and Baghdad-ul-Jadid, Azad Jammu and Kashmir, Chief Court of Sind, Judicial Commissioner\'s Courts--Baluchistan and Peshawar, and revenue decisions Punjab\" (varies).', 430, 'http://books.google.com/books/content?id=t1M-AQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(178, 20, NULL, 'Proceedings of All India Symposium on Refrigeration, Air Conditioning and Environmental Control, March 10-11, 1967', NULL, 272, 'http://books.google.com/books/content?id=7K6aAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(179, 21, NULL, 'Academy All the Way', NULL, 362, 'http://books.google.com/books/content?id=OakPAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(180, 22, NULL, 'All the President\'s Kin', 'A provocative guide to the First Families from the Kennedys to the Reagans examines the different and important roles that family members play in presidential politics.', 320, 'http://books.google.com/books/content?id=Eo9NAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(181, 1, 1, 'All-New Deadpool (2016)', 'Deadpool a essayé de créer une franchise mais il a été trahi. Il existe cependant d\'autres versions de Deadpool : Masacre, le Deadpool mexicain ou Deadpool 2099. Cette Deadpool réserve d\'ailleurs bien des surprises...', 136, 'http://books.google.com/books/content?id=PRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(182, 1, 1, 'All-New Iron Man (2015)', 'Iron Man et War Machine font équipe avec Spider-Man pour mener une enquête en Asie, tandis que Tony Stark embauche Mary Jane Watson pour diriger les affaires courantes ! Des épisodes en lien avec Civil War II.', 200, 'http://books.google.com/books/content?id=Q-pDDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(183, 1, 1, 'All-New Wolverine (2016)', 'Reprenant le costume de Logan, Laura veut faire honneur à sa mémoire. Mais des clones de la jeune femme font leur apparition et le passé de l\'héroïne vient la hanter. Réussira-t-elle à rester Wolverine ?', 296, 'http://books.google.com/books/content?id=RRZBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(184, 2, 2, 'All my Worst-seller', 'Œuvre complète 2013-2015 Tome 1 Anarchie, Meutres Sexe et Rock\'n Roll Quand Passent les Pibales Dieu Créa le monde en écoutant les Rolling Stones Vivre en 2084', 586, 'http://books.google.com/books/content?id=jg9mBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(185, 8, 8, 'Intégrale - All Saints High', 'Seul l’amour peut les sauver... s’il ne les détruit pas avant Bienvenue à All Saints High, lycée d’élite de Californie, où les populaires n’hésitent pas à écraser les plus fragiles. C’est là, derrière le ballet des faux-semblants, que naissent des passions aussi intenses que destructrices. Admirés pour leur physique magnétique, craints pour leur absence complète de compassion, Penn, Knight et Vaughn s’imposent comme les rois du campus, et collectionnent les cœurs brisés comme les ennemis. Qui saura capturer ces séducteurs rebelles, qui inspirent autant de crainte que le désir ? Découvrez les histoires de Daria & Penn, Luna & Knight, Lenora & Vaughn. DIRTY DEVIL BROKEN KNIGHT ANGRY GOD Retrouvez l\'intégrale de la série All Saints High, de L.J. Shen, en un seul clic ! À propos de l’autrice L.J. Shen s’est imposée dès son tout premier roman comme une voix incontournable de la romance New Adult – un succès confirmé dès la parution de Vicious qui s’est immédiatement hissé en tête de tous les palmarès de vente. Elle vit en Californie du Nord avec son mari et leur petit garçon.', 1224, 'http://books.google.com/books/content?id=my9yEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(186, 1, 9, 'All Free T01', 'Jun Mifune est une judokate passionnée et lointaine descendante de Kyûzô Mifune, considéré comme le plus grand technicien du judo. Elle voue une admiration sans borne à son oncle, Hayaki Mifune, ancien champion du monde toutes catégories, s’étant retiré de la compétition. Pour suivre ses traces et lui prouver que le judo est un sport captivant, la jeune adolescente de 15 ans se décide à affronter des hommes plus lourds qu’elle... Lui-même judoka de ceinture noire, Terubo Aono nous livre toute son expertise et son savoir dans cette série en deux volumes. Avec All Free!, découvrez l’histoire d’une judokate optimiste, qui, malgré son corps délicat, compte bien en découdre avec ses adversaires : vitesse, anticipation et théories seront ses armes !', 241, 'http://books.google.com/books/content?id=8TRjEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(187, 1, 10, 'All-New Amazing Spider-Man (2015)', 'Peter, désormais PDG de Parker Industries, ne se déplace jamais sans son garde du corps Spider-Man ! Le héros va devoir affronter une équipe de super-vilains redoutable. Face au Zodiaque, le Tisseur pourra compter sur Mockingbird.', 136, 'http://books.google.com/books/content?id=XHeqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(188, NULL, NULL, 'Relationi di varie Pesti in Italia sin\'all\'anno corrente 1630. Con tutti li segni di quelle, e rimedij esperimentati nella vera cura ... stampate per ordine del magistrato della sanità di Venetia e ristampate ... ad instanza d\'A. Paladino', NULL, 74, 'http://books.google.com/books/content?id=KixkAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(189, NULL, NULL, 'Della storia d\'Italia dalle origini fino all\'anno 1814. Sommario ... Edizione quarta, fatta sulla prima compiuta, copiosamente corretta ed ampliata', NULL, 484, 'http://books.google.com/books/content?id=9k5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(190, NULL, NULL, 'Historia Antica dall\' edificazione di Fiorenza per insino all\' anno MCCLXXI. Con l\'aggiunta di Giachetto suo nipote dal detto anno per insino al 1286. Nuovamente posta in luce', NULL, 360, 'http://books.google.com/books/content?id=qi1YAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(191, NULL, NULL, 'Intorno alle condizioni presenti delle arti del disegno e all\'influenza che vi esercitano le accademie artistiche, considerazioni', NULL, 122, 'http://books.google.com/books/content?id=gygDAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(192, NULL, NULL, 'Porta all\'Eternita battula d\'Orationi jaculatorie', NULL, 470, 'http://books.google.com/books/content?id=KNQ8AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(193, NULL, NULL, 'All\' eminentissimo signor cardinale Giuseppe Mezzofanti bolognese, elevato all\' onore della porpora romana l\'anno 1838, applausi degli Accademici Filopierj', NULL, 100, 'http://books.google.com/books/content?id=_A5gAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(194, 9, 11, 'All Blacks Academy - Tome 3 - Un tournoi inoubliable', 'Il y a un an, si on m\'avait dit que j\'allais participer au Tournoi des Six Nations, j\'aurais cru qu\'on me faisait une blague ! Et pourtant, me voilà aujourd\'hui dans la ville de rugby en Angleterre pour représenter la All Blacks Academy lors de cette compétition légendaire. Cette année, exceptionnellement, la Nouvelle-Zélande est invitée au Tournoi. J\'ai l\'impression de vivre un rêve éveillé. Enfin, presque... Car Mathis, mon éternel rival, est lui aussi de la partie. Et il est bien décidé à décrocher la place de demi de mêlée titulaire et me renvoyer sur le banc des remplaçants ! Heureusement, mes coéquipiers, mes amis et ma famille sont là pour me soutenir. Si on veut remporter la coupe, il va falloir se dépasser et se montrer digne de la fougère argentée des All Blacks.', 192, 'http://books.google.com/books/content?id=5He_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(195, NULL, NULL, 'Lettera all\'Ill. S. Bali d\'Acri Fra Don Ant. Emanuel di Lisbona, contenente la Relazione delle feste fatte in Siena in occasione dell\'Esaltazione al Gran Magistero di Malta dell\'Emin. e Rev. Fra Marc\'Antonio Zondari', NULL, 20, 'http://books.google.com/books/content?id=LSZXAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(196, NULL, NULL, 'L\'espion anglais ou Correspondance secrète entre milord All\'eye et milord All\'ear', NULL, NULL, 'http://books.google.com/books/content?id=Ico_AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(197, 10, NULL, 'L\' Espion anglois ou correspondance secrète entre milord All\'eye et milord All\'ear', NULL, 400, 'http://books.google.com/books/content?id=d5sPAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(198, 11, NULL, '“L\'”Observateur Anglois, Ou Correspondance Secrete Entre Milord All\'Eye Et Milord All\'Ear', NULL, 504, 'http://books.google.com/books/content?id=YPsFAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(199, NULL, NULL, 'L\'espion anglois, ou correspondance secrète entre Milord All\'Eye et Milord All\'Ear', NULL, 476, 'http://books.google.com/books/content?id=MWVeAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(200, 11, NULL, 'L\'observateur anglois, ou Correspondance secrete entre Milord All\'Eye et Milord All\'Ear [sic] ...', NULL, 412, 'http://books.google.com/books/content?id=qSkGAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(201, NULL, NULL, 'Lettere di M. Francesco Petrarca all\'autor della prefazione premessa alla Rettorica d\'Aristotile fatta in lingua Toscana dal Commendatore A. Caro [P. Bassaglia. Dated, “Da\'felicissimi Campi Elisj”].', NULL, 120, 'http://books.google.com/books/content?id=Q59cAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(202, NULL, NULL, 'L\'espion anglois ou Correspondance secrète entre milord All\'eye et milord All\'ar', NULL, 444, 'http://books.google.com/books/content?id=9-laAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(203, NULL, NULL, 'The poetical histories, being a compleat collection of all the stories necessary for a perfect understanding of the Greek and Latine poets and other ancient authors ... Englisht and enricht with observation concerning the gods worshipped by our ancestors in this island, ... unto which are added two treatises, one of the curiosities of old Rome ... the other containing the most remarkable hieroglyphicks of Aegypt. By M. D\'Assigny', NULL, 478, 'http://books.google.com/books/content?id=yudoAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(204, 12, NULL, 'All These', NULL, 342, 'http://books.google.com/books/content?id=S2FkAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(205, 13, NULL, 'All American', 'This book is Hilfiger\'\'s personal celebration of American design classics, going as far back as the 50s and 60s to examine the elements of style that have influenced his wardrobe and formed his design sensibility.\'', 191, 'http://books.google.com/books/content?id=0wFBqTvT4u0C&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(206, 14, NULL, 'All India Reporter', NULL, 310, 'http://books.google.com/books/content?id=3ao2AAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(207, 15, NULL, 'Operating All-terrain Vehicles in the State of Washington', NULL, 13, 'http://books.google.com/books/content?id=8_JNAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(208, 16, NULL, 'One-act Plays for All-girl Casts', NULL, 193, 'http://books.google.com/books/content?id=k69RAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(209, 17, NULL, 'Gentlemen All', NULL, 314, 'http://books.google.com/books/content?id=aOVOAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(210, NULL, NULL, 'All Kneeling', NULL, 344, 'http://books.google.com/books/content?id=PQ41AAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(211, 18, NULL, 'The Mythology of All Races ...', NULL, 620, 'http://books.google.com/books/content?id=Am4AAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(212, NULL, NULL, 'Tudor Facsimile Texts: Two wise men and all the rest fools. 1913', NULL, NULL, 'http://books.google.com/books/content?id=yTRJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(213, NULL, NULL, 'All Things Counter', NULL, 50, 'http://books.google.com/books/content?id=UxWrAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(214, 19, 12, 'Robert Penn Warren\'s All the King\'s Men', 'A collection of critical essays on Warren\'s novel \"All the King\'s Men\" arranged in chronological order of publication.', 184, 'http://books.google.com/books/content?id=4--wAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(215, NULL, NULL, 'Judicial Decisions, Comprising All Court Decisions, Reported and Unreported, in Civil and Criminal Cases Involving Statutes Administeredd by the Securities and Exchange Commission', NULL, NULL, 'http://books.google.com/books/content?id=J7_1aH70CdIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(216, NULL, NULL, 'All Over', NULL, 462, 'http://books.google.com/books/content?id=sFvJc2Q4qQoC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(217, 14, NULL, 'The All Pakistan Legal Decisions', '\"Containing cases decided by the Federal Court, Privy Council, High Courts of Dacca, Lahore and Baghdad-ul-Jadid, Azad Jammu and Kashmir, Chief Court of Sind, Judicial Commissioner\'s Courts--Baluchistan and Peshawar, and revenue decisions Punjab\" (varies).', 430, 'http://books.google.com/books/content?id=t1M-AQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(218, 20, NULL, 'Proceedings of All India Symposium on Refrigeration, Air Conditioning and Environmental Control, March 10-11, 1967', NULL, 272, 'http://books.google.com/books/content?id=7K6aAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(219, 21, NULL, 'Academy All the Way', NULL, 362, 'http://books.google.com/books/content?id=OakPAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(220, 22, NULL, 'All the President\'s Kin', 'A provocative guide to the First Families from the Kennedys to the Reagans examines the different and important roles that family members play in presidential politics.', 320, 'http://books.google.com/books/content?id=Eo9NAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(221, 23, NULL, 'Istoria della città d\'Avignone, e del Contado Venesino stati della sede apostolica nella Gallia', NULL, 510, 'http://books.google.com/books/content?id=DDpDAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(222, 24, NULL, 'Prosas selectas; ou, Escolha dos melhores logares dos auctores portuguezes antiguos e modernos', NULL, 340, 'http://books.google.com/books/content?id=zNsNAAAAYAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(223, NULL, NULL, 'Orazioni panegiriche composte e recitate da diversi celebri oratori per l\'esaltamento al Pontificato di sua Eminenza Card. Prospepero Lambertini ora Benedetto XIV.', NULL, 168, 'http://books.google.com/books/content?id=cGc-AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(224, NULL, NULL, 'Stato militare dell\' imperio Ottomano, incremento e decremento del medesimo', NULL, 472, 'http://books.google.com/books/content?id=uQtUAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(225, 25, NULL, 'Tratado definitivo de paz, e uniaõ entre os Serenissimos e Potentissimos Principes D. Joseph I, Rey fidelissimo de Portugal e dos Algarves, Jorge III, Rey da Gram Bretanha, de huma parte, Luiz XV, Rey Christianissimo de França, e D. Carlos III, Rey Catholico de Hespanha, de outra parte', NULL, 102, 'http://books.google.com/books/content?id=rE2K0b694MgC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(226, NULL, NULL, 'Il diritto sovrano della santa sede sopra le valli di Comacchio e sopra la repubblica di S. Marino', NULL, 182, 'http://books.google.com/books/content?id=Euw_AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(227, NULL, NULL, 'Memorie di Alfano Alfani illustre Perugino vissuto tra il XV, e il XVI secolo con illustrazioni e documenti inediti spettanti alla storia di Perugia e d\'Italia per cura di Giancarlo Conestabile', NULL, 182, 'http://books.google.com/books/content?id=ic45AAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(228, NULL, NULL, 'Mis mae, mis ar verc\' hes vari ... laqeat e brezonec gat G. L...., curé Taulé [i.e. G. LeLez] ... Augmentet a zaou gantiq en henor d\'ar verc\' hes, a un exerciç evit an ofern ac a psalmou ar gousperou. Eil edition', NULL, 424, 'http://books.google.com/books/content?id=z_piAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(229, NULL, NULL, 'L\'Italia e la Religione Cattolica nel 1848 e 1849. Con un Appendice sulla vera origine dell\'Autorità civile del P. Liberatore Luciano del SS. Redentore', NULL, 184, 'http://books.google.com/books/content?id=Jy5YAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(230, NULL, NULL, 'Breve storia d\'Europa e specialmente d\'Italia', NULL, 272, 'http://books.google.com/books/content?id=aoRBAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(231, NULL, NULL, 'L\'origine apostolica della chiesa Milanese, e del rito della stessa', NULL, NULL, 'http://books.google.com/books/content?id=FOVaAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(232, NULL, NULL, 'La Finanza del regno d\'Italia e la vendita dei beni ecclesiastici', NULL, 100, 'http://books.google.com/books/content?id=BL5VAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(233, NULL, NULL, 'Delle notizie Storiche della lega tra l\'Imperatore Carlo VI. e la Republ. di Venezia contra il Gran Sultano Aemèt III.', NULL, 364, 'http://books.google.com/books/content?id=Or9CAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(234, 26, NULL, 'Atti del Symposium internazionale di storia, metodologia, logica e filosofia della scienza', NULL, 570, 'http://books.google.com/books/content?id=FK4lAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(235, NULL, NULL, 'E-Réputation et Influenceurs Dans les Médias Sociaux', NULL, NULL, NULL),
(236, 27, NULL, 'BM/E\'s World Broadcast News', NULL, 776, 'http://books.google.com/books/content?id=AzsJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(237, 28, NULL, 'Inventaire-sommaire des Archives départementales antérieures à 1790, Morbihan: Série E, supplément. 1. ptie. nos. 1 à 807: Arrondissement de Lorient, arrondissement de Ploermel', NULL, 444, 'http://books.google.com/books/content?id=BadJAAAAYAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(238, 29, NULL, 'Delamination and Shoving of Asphalt Concrete Layers Containing Baghouse Fines', 'This study investigated the causes of the excessive delamination and shoving distresses observed in the North Carolina Department of Transportation (NCDOT) Division 13. Two possible causes of these distresses were identified to be: (1) the intermittent purging of the baghouse fines in in-situ asphalt mixes; and (2) improper selection and/or application of the tack coat, i.e., the use of CRS-2 emulsion versus the PG64-22 asphalt binder. Laboratory performance test results on field cores and asphalt mixtures showed that baghouse fines had a stiffening effect on mixtures and these mixtures were more resistant to rutting. However, mixtures containing baghouse fines were found to be moisture-sensitive, with tensile stress ratios below that specified by NCDOT.', 180, 'http://books.google.com/books/content?id=gwxRAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(239, NULL, NULL, 'A Fundamental Study of Multinozzle Micro-orifice Impactors', NULL, 198, 'http://books.google.com/books/content?id=sfSJu2w137QC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(240, 30, NULL, 'Catalogue des publications et des documents des communautés européenes reçus à la bibliothèque de la commission', NULL, NULL, 'http://books.google.com/books/content?id=72sSeR3iTPIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(241, 31, NULL, 'Iano Henrico Waszink, A.d. VI Kal. Nov. A MCMLXXIII XIII Lustra Complenti Oblata', NULL, 430, 'http://books.google.com/books/content?id=z34wAAAAYAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(242, NULL, NULL, 'Food Art Smoothies', '« Food Art Smoothie » est un livre de recettes qui associent l\'art culinaire, la simplicité et la \'\'cuisine\'\' saine. L\'art culinaire évoqué est l\'art de dresser et de décorer son assiette.Vous trouverez dans ce livre mes recettes créées avec comme ingrédient principal la banane et sous forme de smoothies ou purées, colorés, décorés et gourmands !Et avec une touche florale puisque toutes les décorations se mangent y compris les magnifiques fleurs. Retrouvez plus de 40 recettes pour expérimenter le food art et peut-être vous inspirer des recettes afin de créer vos propres créations avec un design unique ! Une touche de food art dans son assiette apporte \"un goût supplémentaire\".A tester et en faire une activité à partager en famille voire même sous forme de jeu avec les enfants !', 100, NULL),
(243, 32, NULL, 'Wage Rates, Australia', NULL, 230, 'http://books.google.com/books/content?id=XNVYAAAAYAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(244, 33, NULL, 'Military Law and Law of War Review', NULL, NULL, 'http://books.google.com/books/content?id=5vM3AQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(245, 34, NULL, 'Functiones Et Approximatio Commentarii Mathematici', NULL, NULL, 'http://books.google.com/books/content?id=l6InAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(246, 35, NULL, '2AN.', NULL, NULL, 'http://books.google.com/books/content?id=4v0SAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(247, NULL, 13, 'A Finite Element Approach for Structural Reliability Analysis of Marine Structures', NULL, 344, 'http://books.google.com/books/content?id=mQxHAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(248, 36, 14, 'Les prophètes', NULL, 410, 'http://books.google.com/books/content?id=prgLAAAAYAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(249, NULL, NULL, 'Material Transport and Continuous Grinding of Mineral Mixtures in Ball Mills', NULL, 442, 'http://books.google.com/books/content?id=HYlJAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(250, NULL, NULL, 'Standard Oil Company of New Jersey Et Al., Appellants, V. United States of America, Appellee ...', NULL, NULL, 'http://books.google.com/books/content?id=Z1w0AQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(251, 37, NULL, 'Data Report of C S K.', NULL, NULL, 'http://books.google.com/books/content?id=3NMjAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(252, 38, NULL, 'Journal of Philippine Statistics', NULL, NULL, 'http://books.google.com/books/content?id=zsgUAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(253, 39, NULL, 'Cahiers de Topologie Et Géométrie Différentielle', NULL, NULL, 'http://books.google.com/books/content?id=b4lVAAAAYAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(254, 40, NULL, 'Bulletin', NULL, NULL, 'http://books.google.com/books/content?id=awhSAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(255, 41, NULL, 'Source Material on Sind', NULL, 628, 'http://books.google.com/books/content?id=tbQJAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(256, 42, NULL, 'Special Report', NULL, NULL, 'http://books.google.com/books/content?id=qrrDemTe7OIC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(257, 43, 15, 'La vie après la mort ?', 'Les témoignages d\'expérience de mort imminente abondent. Mais cette \"expérience\" est-elle effectivement liée à la mort ?... Le livre de T.C. Durand répond clairement aux questions qui se posent.', 71, 'http://books.google.com/books/content?id=5ETrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
(258, 44, 16, 'Forest Tree Improvement', NULL, 271, 'http://books.google.com/books/content?id=bm5FAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(259, 32, NULL, 'Lønstrukturen inden for handel, banker og forsikringvæsen i 1974: France', NULL, NULL, 'http://books.google.com/books/content?id=o982rDpUvtAC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
(260, 45, NULL, 'NOAA Technical Report ERL.', NULL, NULL, 'http://books.google.com/books/content?id=028cAQAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api');

-- --------------------------------------------------------

--
-- Structure de la table `book_author`
--

CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book_author`
--

INSERT INTO `book_author` (`book_id`, `author_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(5, 1),
(5, 2),
(5, 3),
(6, 4),
(6, 5),
(7, 6),
(7, 7),
(8, 8),
(9, 1),
(9, 2),
(9, 3),
(10, 4),
(10, 5),
(11, 6),
(11, 7),
(12, 8),
(13, 1),
(13, 2),
(13, 3),
(14, 4),
(14, 5),
(15, 6),
(15, 7),
(16, 8),
(17, 1),
(17, 2),
(17, 3),
(18, 4),
(18, 5),
(19, 6),
(19, 7),
(20, 8),
(21, 1),
(21, 2),
(21, 3),
(22, 4),
(22, 5),
(23, 6),
(23, 7),
(24, 8),
(25, 9),
(26, 10),
(27, 11),
(28, 12),
(29, 13),
(30, 14),
(31, 15),
(32, 16),
(33, 17),
(34, 18),
(36, 19),
(37, 20),
(38, 20),
(39, 21),
(40, 20),
(41, 22),
(42, 21),
(43, 23),
(44, 24),
(45, 25),
(45, 26),
(48, 27),
(49, 28),
(50, 29),
(51, 30),
(51, 31),
(51, 32),
(53, 33),
(54, 34),
(55, 35),
(56, 36),
(59, 37),
(60, 38),
(61, 1),
(61, 2),
(61, 3),
(62, 4),
(62, 5),
(63, 6),
(63, 7),
(64, 8),
(65, 9),
(66, 10),
(67, 11),
(68, 12),
(69, 13),
(70, 14),
(71, 15),
(72, 16),
(73, 17),
(74, 18),
(76, 19),
(77, 20),
(78, 20),
(79, 21),
(80, 20),
(81, 22),
(82, 21),
(83, 23),
(84, 24),
(85, 25),
(85, 26),
(88, 27),
(89, 28),
(90, 29),
(91, 30),
(91, 31),
(91, 32),
(93, 33),
(94, 34),
(95, 35),
(96, 36),
(99, 37),
(100, 38),
(101, 1),
(101, 2),
(101, 3),
(102, 4),
(102, 5),
(103, 6),
(103, 7),
(104, 8),
(105, 9),
(106, 10),
(107, 11),
(108, 12),
(109, 13),
(110, 14),
(111, 15),
(112, 16),
(113, 17),
(114, 18),
(116, 19),
(117, 20),
(118, 20),
(119, 21),
(120, 20),
(121, 22),
(122, 21),
(123, 23),
(124, 24),
(125, 25),
(125, 26),
(128, 27),
(129, 28),
(130, 29),
(131, 30),
(131, 31),
(131, 32),
(133, 33),
(134, 34),
(135, 35),
(136, 36),
(139, 37),
(140, 38),
(141, 1),
(141, 2),
(141, 3),
(142, 4),
(142, 5),
(143, 6),
(143, 7),
(144, 8),
(145, 9),
(146, 10),
(147, 11),
(148, 12),
(149, 13),
(150, 14),
(151, 15),
(152, 16),
(153, 17),
(154, 18),
(156, 19),
(157, 20),
(158, 20),
(159, 21),
(160, 20),
(161, 22),
(162, 21),
(163, 23),
(164, 24),
(165, 25),
(165, 26),
(168, 27),
(169, 28),
(170, 29),
(171, 30),
(171, 31),
(171, 32),
(173, 33),
(174, 34),
(175, 35),
(176, 36),
(179, 37),
(180, 38),
(181, 1),
(181, 2),
(181, 3),
(182, 4),
(182, 5),
(183, 6),
(183, 7),
(184, 8),
(185, 9),
(186, 10),
(187, 11),
(188, 12),
(189, 13),
(190, 14),
(191, 15),
(192, 16),
(193, 17),
(194, 18),
(196, 19),
(197, 20),
(198, 20),
(199, 21),
(200, 20),
(201, 22),
(202, 21),
(203, 23),
(204, 24),
(205, 25),
(205, 26),
(208, 27),
(209, 28),
(210, 29),
(211, 30),
(211, 31),
(211, 32),
(213, 33),
(214, 34),
(215, 35),
(216, 36),
(219, 37),
(220, 38),
(221, 39),
(222, 40),
(224, 41),
(226, 42),
(227, 43),
(228, 44),
(229, 45),
(230, 46),
(231, 47),
(232, 48),
(233, 49),
(234, 50),
(234, 51),
(235, 52),
(235, 53),
(235, 54),
(235, 55),
(237, 56),
(238, 57),
(239, 58),
(240, 59),
(241, 60),
(242, 61),
(247, 62),
(248, 63),
(249, 64),
(255, 65),
(257, 66),
(259, 67),
(260, 68);

-- --------------------------------------------------------

--
-- Structure de la table `book_language`
--

CREATE TABLE `book_language` (
  `book_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book_language`
--

INSERT INTO `book_language` (`book_id`, `language_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(180, 2),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 2),
(235, 1),
(236, 2),
(237, 1),
(238, 2),
(239, 2),
(240, 2),
(241, 2),
(242, 1),
(243, 2),
(244, 2),
(245, 2),
(246, 2),
(247, 2),
(248, 1),
(249, 2),
(250, 2),
(251, 2),
(252, 2),
(253, 2),
(254, 2),
(255, 2),
(256, 2),
(257, 1),
(258, 2),
(259, 2),
(260, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `CAT_Id` int(11) NOT NULL,
  `CAT_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`CAT_Id`, `CAT_Name`) VALUES
(1, 'Comics & Graphic Novels'),
(2, 'Sports & Recreation'),
(8, 'Fiction'),
(9, 'Juvenile Fiction'),
(10, 'Digital images'),
(11, 'Europe'),
(12, 'Biography'),
(13, 'Fashion'),
(14, 'Law reports, digests, etc'),
(15, 'All terrain vehicles'),
(16, 'Drama'),
(17, 'Families'),
(18, 'Folklore'),
(19, 'Politicians in literature'),
(20, 'Air conditioning'),
(21, 'Hollywood (Los Angeles, Calif.)'),
(22, 'Presidents'),
(23, 'Avignon (France)'),
(24, 'Portuguese language'),
(25, 'Seven Years\' War, 1756-1763'),
(26, 'Science'),
(27, 'Radio broadcasting'),
(28, 'Morbihan (France)'),
(29, 'Asphalt'),
(30, 'European Economic Community countries'),
(31, 'Church history'),
(32, 'Wages'),
(33, 'Military law'),
(34, 'Approximation theory'),
(35, 'Mathematical models'),
(36, 'France'),
(37, 'Kuroshio'),
(38, 'Philippines'),
(39, 'Geometry, Differential'),
(40, 'Geology'),
(41, 'Sindh (Pakistan)'),
(42, 'Agriculture'),
(43, 'Body, Mind & Spirit'),
(44, 'Technology & Engineering'),
(45, 'Atmosphere');

-- --------------------------------------------------------

--
-- Structure de la table `editor`
--

CREATE TABLE `editor` (
  `EDI_Id` int(11) NOT NULL,
  `EDI_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editor`
--

INSERT INTO `editor` (`EDI_Id`, `EDI_Name`) VALUES
(1, 'Marvel Entertainment'),
(2, 'BoD - Books on Demand'),
(8, 'HarperCollins'),
(9, 'Mangetsu Manga'),
(10, 'Panini'),
(11, 'Hachette Romans'),
(12, 'Chelsea House Publications'),
(13, 'Ann Arbor, Mich. : University Microfilms International'),
(14, 'Paris, J. Tallandier'),
(15, 'Book e-Book'),
(16, 'Food & Agriculture Org');

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

CREATE TABLE `language` (
  `LAN_Id` int(11) NOT NULL,
  `LAN_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `language`
--

INSERT INTO `language` (`LAN_Id`, `LAN_Name`) VALUES
(1, 'fr'),
(2, 'en');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `USR_Id` int(11) NOT NULL,
  `USR_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USR_First_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USR_Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USR_Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USR_Profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`USR_Id`, `USR_Name`, `USR_First_name`, `USR_Email`, `USR_Password`, `USR_Profile_picture`) VALUES
(1, 'Morin', 'Augustin', 'augustin.morin@example.com', '$2y$10$MPBc1vmZ.gvYh8fBpcR.8epnte0S9jOCMlCjl9MS9cmIL7RQkYuC.', 'https://randomuser.me/api/portraits/men/65.jpg'),
(2, 'Berger', 'Titouan', 'titouan.berger@example.com', '$2y$10$C6gIwDr4nmeccdUbFChMcOSR6cnzfHOhNBvnbUoZJUFwYBqm.kktK', 'https://randomuser.me/api/portraits/men/70.jpg'),
(3, 'Robin', 'Julia', 'julia.robin@example.com', '$2y$10$dv9cgKaxprlTnNGXRE0/U.yJZaN8UdV099X8R63AggVX1UvkL/hMq', 'https://randomuser.me/api/portraits/women/51.jpg'),
(4, 'Laurent', 'Naomi', 'naomi.laurent@example.com', '$2y$10$fvn1tFwxa9CaJ/7grqbV7OkEpVurHaOdeWhkCHseWYsbybVwO9mCC', 'https://randomuser.me/api/portraits/women/51.jpg'),
(5, 'Le Gall', 'Mélissa', 'melissa.legall@example.com', '$2y$10$rhuwKO.DUI8mMd7WaTU3vON5LxER.u5yOSHGfYytX1TzKii40vb.i', 'https://randomuser.me/api/portraits/women/48.jpg'),
(6, 'Morin', 'Amélie', 'amelie.morin@example.com', '$2y$10$Mwztzcat313eShZLw2e8GOpqyG.YqwChzLhEWTOhhdPK9LK2z0uNy', 'https://randomuser.me/api/portraits/women/13.jpg'),
(7, 'Garcia', 'Lison', 'lison.garcia@example.com', '$2y$10$kyeZRdxMe4Egcig.HUyjHOp/.CKPvGQeVBHj3Aq..Yem8yTziSkD2', 'https://randomuser.me/api/portraits/women/82.jpg'),
(8, 'Gautier', 'Camille', 'camille.gautier@example.com', '$2y$10$eUpJR/IBfa1Wb0TgTlZMjueRDIyGqEIa2rlbj8HNy2KHEqV90OkhO', 'https://randomuser.me/api/portraits/women/30.jpg'),
(9, 'Lemaire', 'Camille', 'camille.lemaire@example.com', '$2y$10$jpmJ.2bc1CxKQ9NEjwPUeOd4u.sYt9JpFknyv2Dbel1Ds4.N5asoS', 'https://randomuser.me/api/portraits/women/52.jpg'),
(10, 'Lucas', 'Roxane', 'roxane.lucas@example.com', '$2y$10$L.doBrLKBTpbKz3N5sTzieXOIJePGuC9t0fWdNwrcecSMPoARHrOO', 'https://randomuser.me/api/portraits/women/42.jpg'),
(11, 'Vidal', 'Emy', 'emy.vidal@example.com', '$2y$10$phmC6aUotGHGo0SDEP5K1uwzlfL8U8tivjqmXzyl91zzdQrIqcJgW', 'https://randomuser.me/api/portraits/women/78.jpg'),
(12, 'Lefevre', 'Dylan', 'dylan.lefevre@example.com', '$2y$10$GWKGWi8OlzyYkNXDhIsPFeOg9DnEoyT.SE7c9W2sZGTALOYQX3wGu', 'https://randomuser.me/api/portraits/men/99.jpg'),
(13, 'Nicolas', 'Manon', 'manon.nicolas@example.com', '$2y$10$nx1pVQRDToN4bNXljpWCRO.wZ5xmv4DiS4PaOItSuykTXyR7Zh2gC', 'https://randomuser.me/api/portraits/women/96.jpg'),
(14, 'Roche', 'Nicolas', 'nicolas.roche@example.com', '$2y$10$/vZ1FpZDzrwOGRTqjhWGIudgnMZeIKolZiYnqYKbnMaIpWv6roAre', 'https://randomuser.me/api/portraits/men/82.jpg'),
(15, 'Francois', 'Romane', 'romane.francois@example.com', '$2y$10$SYUwdDbAlDWcYpx55xLH7uWPxMtjDbya/cW72P89P4eYcY3IV7e7G', 'https://randomuser.me/api/portraits/women/80.jpg'),
(16, 'Sanchez', 'Maëva', 'maeva.sanchez@example.com', '$2y$10$3WbbMqJmQvlZKWeVF7W/rul8egSIEkOwC4f2eJZve33tUSXlnJRti', 'https://randomuser.me/api/portraits/women/55.jpg'),
(17, 'Giraud', 'Ethan', 'ethan.giraud@example.com', '$2y$10$yBu698LDieVVI9pT1QRU5eXvnJKI4bJ3JEAwlJWSQkm2/uoB0dVJm', 'https://randomuser.me/api/portraits/men/42.jpg'),
(18, 'Martinez', 'Emmy', 'emmy.martinez@example.com', '$2y$10$/lvGM7TCiv4LwTBl17Nu1uR269siW1wK52Qydk0ScxzGRmMS4vwAK', 'https://randomuser.me/api/portraits/women/32.jpg'),
(19, 'Richard', 'Lola', 'lola.richard@example.com', '$2y$10$dd/kNqVNAhdZ2gLHpumr3.ghDmQFrLtEfg9oYn0it/GYzraTWVFiu', 'https://randomuser.me/api/portraits/women/14.jpg'),
(20, 'Leroux', 'Fabien', 'fabien.leroux@example.com', '$2y$10$PXpL.bo1dnwL66A9P.jacuO.JBFcjOz0eRqJykcqMXYrYNqaJ8pBa', 'https://randomuser.me/api/portraits/men/83.jpg'),
(21, 'Fournier', 'Louka', 'louka.fournier@example.com', '$2y$10$rX0PJ3JZVOGPiTu7cJJOxue2CmP6iZhINJ29d1X0hOpidfoRrnHSu', 'https://randomuser.me/api/portraits/men/6.jpg'),
(22, 'Lefevre', 'Diego', 'diego.lefevre@example.com', '$2y$10$yKrBYdyiFAbl/DW.Xh6ib.np/aZybFpevLCAyrlG0Pf50vuXLj9pe', 'https://randomuser.me/api/portraits/men/59.jpg'),
(23, 'Joly', 'Sandro', 'sandro.joly@example.com', '$2y$10$IZKx.gcQNRUq4LwHkf/ADeddolHRzMUvnmEBk14GODS28cawzp75m', 'https://randomuser.me/api/portraits/men/65.jpg'),
(24, 'Adam', 'Margot', 'margot.adam@example.com', '$2y$10$zMR.c5dBWcV61JtqpK8nfu6hGfLB1N7MosckqKoh6euxn0YuAJxPe', 'https://randomuser.me/api/portraits/women/68.jpg'),
(25, 'Guillot', 'Axel', 'axel.guillot@example.com', '$2y$10$4YEoHt5KXivQX98glxjeO.M9f2fx4L0RttRUTB6zkb1JRJ.z4bgL6', 'https://randomuser.me/api/portraits/men/35.jpg'),
(26, 'Robert', 'Mahé', 'mahe.robert@example.com', '$2y$10$vG/CV8Eu6BFf5JvjidSHluPVUplFRG2G64M76ck15ywsmu9O1.zYq', 'https://randomuser.me/api/portraits/men/17.jpg'),
(27, 'Noel', 'Léane', 'leane.noel@example.com', '$2y$10$eBWjkTsBFaWgOYz.NPZOl.cnjAYVco4KXZaBt9ysob3EKUztPvIGy', 'https://randomuser.me/api/portraits/women/62.jpg'),
(28, 'Guillaume', 'Amaury', 'amaury.guillaume@example.com', '$2y$10$iRKb1k7K9HT3qLVl/a/24edKXZSjaiP0OvauPHyKN/vSeb6wokMbe', 'https://randomuser.me/api/portraits/men/28.jpg'),
(29, 'Lefebvre', 'Augustin', 'augustin.lefebvre@example.com', '$2y$10$4PyHuIP48GqAAhKcuXqACOLEpxYZs.VE2QJG/FtFMxZ/k4DjhmLry', 'https://randomuser.me/api/portraits/men/98.jpg'),
(30, 'Morin', 'Laly', 'laly.morin@example.com', '$2y$10$BeyCiVOFt4QksW3XxzMgX.RTttCruzzZKaEptusdPkFRNVL53Exue', 'https://randomuser.me/api/portraits/women/82.jpg'),
(31, 'Simon', 'Constance', 'constance.simon@example.com', '$2y$10$6SBgwXsb0L4P5jcE55Z64ua2Q/ZvIJgSSf6cpc45sKoX93I0r9vSa', 'https://randomuser.me/api/portraits/women/26.jpg'),
(32, 'Roussel', 'Charles', 'charles.roussel@example.com', '$2y$10$UhXJIMH8bUMjIruPhGg2Neh0y9AAACDZnN7wTzLCeEFl//lzebxoa', 'https://randomuser.me/api/portraits/men/97.jpg'),
(33, 'Philippe', 'Hélèna', 'helena.philippe@example.com', '$2y$10$qMxo.UpES6TMKSFM/m8dvuw6cYAJHjqQTMO10Z5ynFdYk6Y2AZzSm', 'https://randomuser.me/api/portraits/women/74.jpg'),
(34, 'Martin', 'Eliott', 'eliott.martin@example.com', '$2y$10$P4OiEdjFLDCilRAPZCApR.CzSjLgQAYoKAfXfA485jjXEAwpPGWZO', 'https://randomuser.me/api/portraits/men/50.jpg'),
(35, 'Dufour', 'Luna', 'luna.dufour@example.com', '$2y$10$67SGXYQ/UFTwLeZCxZ4HGuDrJG/nK4fyPlEejog/xupIixq3vyrHq', 'https://randomuser.me/api/portraits/women/74.jpg'),
(36, 'Le Gall', 'Sélène', 'selene.legall@example.com', '$2y$10$sFJ1RkaK15/03Eqkl0G0n.WyMFsULhZnRL3AkkQKI1JM/ztEQJSmi', 'https://randomuser.me/api/portraits/women/27.jpg'),
(37, 'Garnier', 'Lison', 'lison.garnier@example.com', '$2y$10$x4Sx7XzN40pXnyRWA3zV8e1gLBVIFjMHTWYOV9eB3ObB4jcdo4Rae', 'https://randomuser.me/api/portraits/women/77.jpg'),
(38, 'David', 'Louna', 'louna.david@example.com', '$2y$10$uj3lT/28.WL4TGrukL1SMuR6i5AgprQMRc4A7589UXFpvgyi7Ru/G', 'https://randomuser.me/api/portraits/women/48.jpg'),
(39, 'Adam', 'Margot', 'margot.adam@example.com', '$2y$10$FGW0XpywRRvDWfJo09JnNuqeJngIN7CGkdUg.r0iUEF8/lx.UHYsW', 'https://randomuser.me/api/portraits/women/46.jpg'),
(40, 'Deschamps', 'Lenny', 'lenny.deschamps@example.com', '$2y$10$nE/j0Mjc1OHvJmALNuI5N.ozvbUYTI9xNc8Uz5gj35b51MQhI./du', 'https://randomuser.me/api/portraits/men/47.jpg'),
(41, 'Arnaud', 'Enora', 'enora.arnaud@example.com', '$2y$10$wfGtnU4S1MADlNMVzB6ocudJBj1g3YvWCiFyP6B7BrBBiXIoBtfYm', 'https://randomuser.me/api/portraits/women/92.jpg'),
(42, 'Jean', 'Aaron', 'aaron.jean@example.com', '$2y$10$TpcfU6R16WpRMS3PceSG0.YzKZyjkbafSgzYKaFgd/Z8.mJIgfpTe', 'https://randomuser.me/api/portraits/men/37.jpg'),
(43, 'Muller', 'Cléo', 'cleo.muller@example.com', '$2y$10$pwJz4eilwWEa1d653xoD2OOJQgKsHdQakE9hpbAEo0t8akEvSn/au', 'https://randomuser.me/api/portraits/men/41.jpg'),
(44, 'Jean', 'Thiago', 'thiago.jean@example.com', '$2y$10$IL5Zz9zM5B.qGVBaMtZr2uIXM3XK.gJVDU.7pCK8gszmmKghR7DxS', 'https://randomuser.me/api/portraits/men/74.jpg'),
(45, 'Fernandez', 'Lily', 'lily.fernandez@example.com', '$2y$10$Wsz1bwgQkeuH34dE20gTCuOiXPV.WVXAkirC9q.Vi57Uu6S9/NuPm', 'https://randomuser.me/api/portraits/women/36.jpg'),
(46, 'Colin', 'Mathéo', 'matheo.colin@example.com', '$2y$10$EuVQkNEwOfmmexEsbXtLpuhwGjKjaafsHwhdixUG9CLEW186XaSZO', 'https://randomuser.me/api/portraits/men/14.jpg'),
(47, 'Roche', 'Raphaël', 'raphael.roche@example.com', '$2y$10$S4Nu5CwRbP6d4GxguoHfM.QjCGizWZwspXjIJ15IBT/4MA.NNzCfq', 'https://randomuser.me/api/portraits/men/24.jpg'),
(48, 'Denis', 'Antonin', 'antonin.denis@example.com', '$2y$10$TLx7KlgX7mvvMzwW0EcwLO7qOuN0xv7ftCnPVMVKhdK.ShRZHuwAS', 'https://randomuser.me/api/portraits/men/15.jpg'),
(49, 'Da Silva', 'Eliot', 'eliot.dasilva@example.com', '$2y$10$GXFyXB3K/qu.f3g.SM7mfeNfN.0cF8kJCjbpIBuSYgt/fYoacQepG', 'https://randomuser.me/api/portraits/men/6.jpg'),
(50, 'Vincent', 'Anna', 'anna.vincent@example.com', '$2y$10$op1l4IFKHvEzoBXl00m55OODg74Iwi7tzXrzkpQTWVr4XiKI9B4yS', 'https://randomuser.me/api/portraits/women/70.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user_book`
--

CREATE TABLE `user_book` (
  `USB_Id` int(11) NOT NULL,
  `USB_User_id` int(11) NOT NULL,
  `USB_Book_id` int(11) NOT NULL,
  `USB_Date_borrowed` date NOT NULL,
  `USB_Date_given_back` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_book`
--

INSERT INTO `user_book` (`USB_Id`, `USB_User_id`, `USB_Book_id`, `USB_Date_borrowed`, `USB_Date_given_back`) VALUES
(1, 1, 95, '2023-03-27', '2023-04-03'),
(2, 1, 151, '2023-03-27', NULL),
(3, 1, 112, '2023-03-27', '2023-04-03'),
(4, 1, 46, '2023-03-27', NULL),
(5, 1, 117, '2023-03-27', '2023-04-03'),
(6, 1, 165, '2023-03-27', NULL),
(7, 2, 121, '2023-03-27', '2023-04-03'),
(8, 3, 239, '2023-03-27', '2023-04-03'),
(9, 3, 199, '2023-03-27', NULL),
(10, 3, 124, '2023-03-27', '2023-04-03'),
(11, 3, 90, '2023-03-27', NULL),
(12, 3, 183, '2023-03-27', '2023-04-03'),
(13, 3, 250, '2023-03-27', NULL),
(14, 4, 65, '2023-03-27', '2023-04-03'),
(15, 4, 31, '2023-03-27', NULL),
(16, 5, 202, '2023-03-27', '2023-04-03'),
(17, 5, 22, '2023-03-27', NULL),
(18, 6, 109, '2023-03-27', '2023-04-03'),
(19, 6, 7, '2023-03-27', NULL),
(20, 6, 210, '2023-03-27', '2023-04-03'),
(21, 7, 116, '2023-03-27', '2023-04-03'),
(22, 7, 257, '2023-03-27', NULL),
(23, 7, 116, '2023-03-27', '2023-04-03'),
(24, 7, 133, '2023-03-27', NULL),
(25, 8, 77, '2023-03-27', '2023-04-03'),
(26, 8, 12, '2023-03-27', NULL),
(27, 8, 15, '2023-03-27', '2023-04-03'),
(28, 8, 184, '2023-03-27', NULL),
(29, 9, 155, '2023-03-27', '2023-04-03'),
(30, 9, 227, '2023-03-27', NULL),
(31, 9, 96, '2023-03-27', '2023-04-03'),
(32, 10, 232, '2023-03-27', '2023-04-03'),
(33, 10, 139, '2023-03-27', NULL),
(34, 10, 117, '2023-03-27', '2023-04-03'),
(35, 10, 82, '2023-03-27', NULL),
(36, 10, 88, '2023-03-27', '2023-04-03'),
(37, 11, 63, '2023-03-27', '2023-04-03'),
(38, 11, 40, '2023-03-27', NULL),
(39, 11, 208, '2023-03-27', '2023-04-03'),
(40, 11, 247, '2023-03-27', NULL),
(41, 11, 41, '2023-03-27', '2023-04-03'),
(42, 11, 38, '2023-03-27', NULL),
(43, 11, 150, '2023-03-27', '2023-04-03'),
(44, 12, 87, '2023-03-27', '2023-04-03'),
(45, 12, 227, '2023-03-27', NULL),
(46, 12, 260, '2023-03-27', '2023-04-03'),
(47, 12, 22, '2023-03-27', NULL),
(48, 13, 22, '2023-03-27', '2023-04-03'),
(49, 13, 45, '2023-03-27', NULL),
(50, 13, 159, '2023-03-27', '2023-04-03'),
(51, 13, 37, '2023-03-27', NULL),
(52, 14, 120, '2023-03-27', '2023-04-03'),
(53, 14, 12, '2023-03-27', NULL),
(54, 14, 102, '2023-03-27', '2023-04-03'),
(55, 15, 191, '2023-03-27', '2023-04-03'),
(56, 15, 50, '2023-03-27', NULL),
(57, 16, 50, '2023-03-27', '2023-04-03'),
(58, 16, 228, '2023-03-27', NULL),
(59, 17, 64, '2023-03-27', '2023-04-03'),
(60, 17, 215, '2023-03-27', NULL),
(61, 17, 153, '2023-03-27', '2023-04-03'),
(62, 17, 94, '2023-03-27', NULL),
(63, 19, 84, '2023-03-27', '2023-04-03'),
(64, 19, 258, '2023-03-27', NULL),
(65, 20, 234, '2023-03-27', '2023-04-03'),
(66, 20, 151, '2023-03-27', NULL),
(67, 21, 218, '2023-03-27', '2023-04-03'),
(68, 21, 259, '2023-03-27', NULL),
(69, 22, 192, '2023-03-27', '2023-04-03'),
(70, 22, 226, '2023-03-27', NULL),
(71, 22, 258, '2023-03-27', '2023-04-03'),
(72, 22, 197, '2023-03-27', NULL),
(73, 22, 114, '2023-03-27', '2023-04-03'),
(74, 23, 113, '2023-03-27', '2023-04-03'),
(75, 23, 202, '2023-03-27', NULL),
(76, 24, 177, '2023-03-27', '2023-04-03'),
(77, 24, 168, '2023-03-27', NULL),
(78, 24, 171, '2023-03-27', '2023-04-03'),
(79, 25, 189, '2023-03-27', '2023-04-03'),
(80, 25, 148, '2023-03-27', NULL),
(81, 25, 108, '2023-03-27', '2023-04-03'),
(82, 26, 136, '2023-03-27', '2023-04-03'),
(83, 26, 138, '2023-03-27', NULL),
(84, 27, 15, '2023-03-27', '2023-04-03'),
(85, 27, 136, '2023-03-27', NULL),
(86, 27, 101, '2023-03-27', '2023-04-03'),
(87, 27, 232, '2023-03-27', NULL),
(88, 28, 82, '2023-03-27', '2023-04-03'),
(89, 29, 103, '2023-03-27', '2023-04-03'),
(90, 29, 197, '2023-03-27', NULL),
(91, 30, 112, '2023-03-27', '2023-04-03'),
(92, 30, 216, '2023-03-27', NULL),
(93, 30, 182, '2023-03-27', '2023-04-03'),
(94, 31, 34, '2023-03-27', '2023-04-03'),
(95, 31, 78, '2023-03-27', NULL),
(96, 32, 102, '2023-03-27', '2023-04-03'),
(97, 32, 152, '2023-03-27', NULL),
(98, 32, 193, '2023-03-27', '2023-04-03'),
(99, 32, 75, '2023-03-27', NULL),
(100, 33, 22, '2023-03-27', '2023-04-03'),
(101, 33, 80, '2023-03-27', NULL),
(102, 33, 126, '2023-03-27', '2023-04-03'),
(103, 33, 91, '2023-03-27', NULL),
(104, 34, 171, '2023-03-27', '2023-04-03'),
(105, 35, 148, '2023-03-27', '2023-04-03'),
(106, 35, 215, '2023-03-27', NULL),
(107, 35, 199, '2023-03-27', '2023-04-03'),
(108, 35, 75, '2023-03-27', NULL),
(109, 36, 47, '2023-03-27', '2023-04-03'),
(110, 36, 236, '2023-03-27', NULL),
(111, 36, 161, '2023-03-27', '2023-04-03'),
(112, 36, 101, '2023-03-27', NULL),
(113, 36, 164, '2023-03-27', '2023-04-03'),
(114, 37, 160, '2023-03-27', '2023-04-03'),
(115, 37, 60, '2023-03-27', NULL),
(116, 37, 12, '2023-03-27', '2023-04-03'),
(117, 38, 48, '2023-03-27', '2023-04-03'),
(118, 38, 107, '2023-03-27', NULL),
(119, 38, 221, '2023-03-27', '2023-04-03'),
(120, 38, 219, '2023-03-27', NULL),
(121, 39, 252, '2023-03-27', '2023-04-03'),
(122, 39, 148, '2023-03-27', NULL),
(123, 40, 144, '2023-03-27', '2023-04-03'),
(124, 40, 96, '2023-03-27', NULL),
(125, 41, 14, '2023-03-27', '2023-04-03'),
(126, 41, 110, '2023-03-27', NULL),
(127, 41, 143, '2023-03-27', '2023-04-03'),
(128, 42, 195, '2023-03-27', '2023-04-03'),
(129, 42, 91, '2023-03-27', NULL),
(130, 42, 213, '2023-03-27', '2023-04-03'),
(131, 42, 174, '2023-03-27', NULL),
(132, 42, 27, '2023-03-27', '2023-04-03'),
(133, 42, 80, '2023-03-27', NULL),
(134, 42, 42, '2023-03-27', '2023-04-03'),
(135, 43, 4, '2023-03-27', '2023-04-03'),
(136, 43, 244, '2023-03-27', NULL),
(137, 43, 136, '2023-03-27', '2023-04-03'),
(138, 44, 101, '2023-03-27', '2023-04-03'),
(139, 44, 110, '2023-03-27', NULL),
(140, 44, 238, '2023-03-27', '2023-04-03'),
(141, 44, 60, '2023-03-27', NULL),
(142, 45, 209, '2023-03-27', '2023-04-03'),
(143, 46, 60, '2023-03-27', '2023-04-03'),
(144, 46, 130, '2023-03-27', NULL),
(145, 46, 98, '2023-03-27', '2023-04-03'),
(146, 46, 81, '2023-03-27', NULL),
(147, 47, 98, '2023-03-27', '2023-04-03'),
(148, 47, 10, '2023-03-27', NULL),
(149, 48, 128, '2023-03-27', '2023-04-03'),
(150, 48, 157, '2023-03-27', NULL),
(151, 48, 187, '2023-03-27', '2023-04-03'),
(152, 48, 235, '2023-03-27', NULL),
(153, 48, 125, '2023-03-27', '2023-04-03'),
(154, 49, 196, '2023-03-27', '2023-04-03'),
(155, 49, 51, '2023-03-27', NULL),
(156, 49, 195, '2023-03-27', '2023-04-03'),
(157, 50, 67, '2023-03-27', '2023-04-03'),
(158, 50, 260, '2023-03-27', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_user`
--

CREATE TABLE `user_user` (
  `user_source` int(11) NOT NULL,
  `user_target` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_user`
--

INSERT INTO `user_user` (`user_source`, `user_target`) VALUES
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(5, 4),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 5),
(8, 6),
(8, 7),
(9, 1),
(9, 3),
(10, 6),
(10, 9),
(12, 2),
(12, 4),
(12, 8),
(14, 10),
(14, 11),
(14, 13),
(15, 5),
(15, 9),
(15, 11),
(15, 13),
(16, 3),
(16, 4),
(16, 7),
(16, 12),
(17, 3),
(17, 5),
(17, 13),
(17, 14),
(18, 7),
(18, 14),
(19, 1),
(19, 7),
(19, 15),
(19, 16),
(20, 1),
(20, 2),
(20, 6),
(20, 12),
(20, 13),
(21, 6),
(21, 7),
(21, 10),
(21, 12),
(21, 14),
(22, 2),
(22, 6),
(23, 8),
(23, 11),
(23, 19),
(24, 7),
(24, 10),
(25, 1),
(25, 15),
(25, 22),
(27, 14),
(27, 24),
(28, 4),
(28, 8),
(28, 17),
(28, 25),
(29, 3),
(29, 7),
(29, 11),
(29, 28),
(31, 10),
(31, 14),
(32, 3),
(32, 10),
(32, 11),
(32, 27),
(32, 30),
(33, 8),
(34, 8),
(34, 22),
(34, 30),
(34, 33),
(35, 1),
(35, 18),
(35, 33),
(35, 34),
(36, 9),
(36, 21),
(36, 22),
(37, 1),
(37, 2),
(37, 4),
(37, 19),
(40, 22),
(41, 9),
(41, 40),
(42, 19),
(43, 5),
(43, 15),
(43, 17),
(43, 42),
(45, 7),
(46, 8),
(46, 12),
(46, 36),
(47, 5),
(47, 10),
(47, 19),
(47, 32),
(47, 45),
(48, 25),
(48, 27),
(48, 33),
(50, 21);

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--
CREATE TABLE `grade` (
  `GRD_User_Id` int(11) NOT NULL,
  `GRD_Book_Id` int(11) NOT NULL,
  `GRD_Grade` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_user`
--
INSERT INTO `grade` (`GRD_User_Id`, `GRD_Book_Id`, `GRD_Grade`) VALUES
(1, 95, 0),
(1, 112, 1),
(7, 116, 1),
(8, 15, 1),
(11, 208, 0),
(24, 171, 0),
(33, 22, 1),
(46, 98, 0),
(50, 67, 0);

-- --------------------------------------------------------


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AUT_Id`);

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BOO_Id`),
  ADD KEY `IDX_CBE5A331B68CE25F` (`BOO_Category_id`),
  ADD KEY `IDX_CBE5A331D3E0B119` (`BOO_Editor_id`);

--
-- Index pour la table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `IDX_9478D34516A2B381` (`book_id`),
  ADD KEY `IDX_9478D345F675F31B` (`author_id`);

--
-- Index pour la table `book_language`
--
ALTER TABLE `book_language`
  ADD PRIMARY KEY (`book_id`,`language_id`),
  ADD KEY `IDX_CD2467EC16A2B381` (`book_id`),
  ADD KEY `IDX_CD2467EC82F1BAF4` (`language_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CAT_Id`);

--
-- Index pour la table `editor`
--
ALTER TABLE `editor`
  ADD PRIMARY KEY (`EDI_Id`);

--
-- Index pour la table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`LAN_Id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USR_Id`);

--
-- Index pour la table `user_book`
--
ALTER TABLE `user_book`
  ADD PRIMARY KEY (`USB_Id`),
  ADD KEY `IDX_B164EFF869BAE77B` (`USB_User_id`),
  ADD KEY `IDX_B164EFF823C41283` (`USB_Book_id`);

--
-- Index pour la table `user_user`
--
ALTER TABLE `user_user`
  ADD PRIMARY KEY (`user_source`,`user_target`),
  ADD KEY `IDX_F7129A803AD8644E` (`user_source`),
  ADD KEY `IDX_F7129A80233D34C1` (`user_target`);

--
-- Index pour la table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`GRD_User_Id`, `GRD_Book_Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `AUT_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `BOO_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `CAT_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `editor`
--
ALTER TABLE `editor`
  MODIFY `EDI_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `language`
--
ALTER TABLE `language`
  MODIFY `LAN_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `USR_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `user_book`
--
ALTER TABLE `user_book`
  MODIFY `USB_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_CBE5A331B68CE25F` FOREIGN KEY (`BOO_Category_id`) REFERENCES `categories` (`CAT_Id`),
  ADD CONSTRAINT `FK_CBE5A331D3E0B119` FOREIGN KEY (`BOO_Editor_id`) REFERENCES `editor` (`EDI_Id`);

--
-- Contraintes pour la table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `FK_9478D34516A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`BOO_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9478D345F675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`AUT_Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `book_language`
--
ALTER TABLE `book_language`
  ADD CONSTRAINT `FK_CD2467EC16A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`BOO_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CD2467EC82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`LAN_Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_book`
--
ALTER TABLE `user_book`
  ADD CONSTRAINT `FK_B164EFF823C41283` FOREIGN KEY (`USB_Book_id`) REFERENCES `book` (`BOO_Id`),
  ADD CONSTRAINT `FK_B164EFF869BAE77B` FOREIGN KEY (`USB_User_id`) REFERENCES `user` (`USR_Id`);

--
-- Contraintes pour la table `user_user`
--
ALTER TABLE `user_user`
  ADD CONSTRAINT `FK_F7129A80233D34C1` FOREIGN KEY (`user_target`) REFERENCES `user` (`USR_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F7129A803AD8644E` FOREIGN KEY (`user_source`) REFERENCES `user` (`USR_Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT FOREIGN KEY (`GRD_Book_Id`) REFERENCES `book` (`BOO_Id`),
  ADD CONSTRAINT FOREIGN KEY (`GRD_User_Id`) REFERENCES `user` (`USR_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;