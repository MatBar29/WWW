-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 17, 2024 at 11:10 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moja_strona`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `matka` int(11) DEFAULT 0,
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategoria`
--

INSERT INTO `kategoria` (`id`, `matka`, `nazwa`) VALUES
(1, 0, 'Ogrod'),
(2, 1, 'Narzędzia'),
(3, 1, 'piła'),
(4, 3, 'spalinowa'),
(5, 3, 'elektryczna'),
(6, 0, 'Dom'),
(7, 6, 'Meble'),
(8, 6, 'Elektronika'),
(9, 0, 'Motoryzacja'),
(10, 0, 'Akcesoria'),
(11, 0, 'AGD'),
(12, 11, 'Telewizor'),
(14, 8, 'Telefon'),
(15, 14, 'Iphone');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `page_list`
--

CREATE TABLE `page_list` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_list`
--

INSERT INTO `page_list` (`id`, `page_title`, `page_content`, `status`) VALUES
(2, 'galeria', '	<h1>Galeria</h1>\r\n	<div class=\"gallery\">\r\n		<div class=\"square\">\r\n			<img src=\"img/ISS.jpg\" alt=\"ISS\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/zerograw.jpg\" alt=\"zerograw\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/mars_rover.jpg\" alt=\"mars_rover\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/lot.jpg\" alt=\"lot\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/shuttle.jpg\" alt=\"shuttle\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/Kosmos.png\" alt=\"kosmos\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/apollo.jpg\" alt=\"apollo\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/start.jpg\" alt=\"start\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/hubble.jpg\" alt=\"hubble\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/jurij.jpg\" alt=\"jurij\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/lajka.jpg\" alt=\"łajka\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/spacer.jpg\" alt=\"spacer\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/virgin.jpg\" alt=\"virgin\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/kiezyc.jpg\" alt=\"ksiezyc\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/srodek.jpg\" alt=\"srodek\" width=\"400\">\r\n		</div>\r\n		<div class=\"square\">\r\n			<img src=\"img/proton.jpg\" alt=\"proton\" width=\"400\">\r\n		</div>\r\n	</div>', 1),
(3, 'glowna', '    <table>\r\n        <tr>\r\n            <th colspan=\"2\">Loty kosmiczne</th>\r\n        </tr>\r\n    </table>\r\n    <div class=\"square\">\r\n        <img src=\"img/lot.jpg\" alt=\"lot\" width=\"400\">\r\n    </div>\r\n    <b>	Odkryj Kosmos</b>\r\n    <p>\r\n        Zapraszamy do świata fascynujących odkryć i inspirujących historii związanych z lotami kosmicznymi. Od epickich misji NASA po najnowsze innowacje prywatnych firm kosmicznych - tutaj znajdziesz pełne spektrum informacji na temat najważniejszych wydarzeń w historii eksploracji kosmosu.\r\n    </p>\r\n    <b>Misje Kosmiczne</b>\r\n    <p>\r\n        Dowiedz się o najnowszych i nadchodzących misjach kosmicznych, śledź relacje na żywo z ich przebiegu i odkrywaj tajemnice odległych planet, gwiazd i galaktyk. Jesteśmy tu, aby dostarczyć Ci pełen wgląd w najnowsze dokonania ludzkości w przestrzeni kosmicznej.\r\n    </p>\r\n    <b>Technologia Kosmiczna</b>\r\n    <p>\r\n        Zanurz się w fascynującym świecie zaawansowanej technologii kosmicznej. Poznaj najnowsze osiągnięcia w zakresie napędu rakietowego, technologii życia w przestrzeni kosmicznej, a także odkrywaj innowacyjne projekty rozwijane przez liderów branży kosmicznej na całym świecie.\r\n    </p>\r\n    <b>Edukacja Kosmiczna</b>\r\n    <p>\r\n        Jesteśmy przekonani, że wiedza o kosmosie powinna być dostępna dla wszystkich. Dlatego oferujemy fascynujące artykuły, multimedia i interaktywne lekcje, które pozwalają na zgłębienie tajemnic kosmosu bez względu na poziom wiedzy.\r\n    </p>\r\n    <b>Społeczność Kosmiczna</b>\r\n    <p>\r\n        Dołącz do społeczności pasjonatów kosmosu, gdzie dzielą się swoimi spostrzeżeniami, pytania i fascynującymi spojrzeniami na przyszłość eksploracji kosmicznej. Wspólnie tworzymy przestrzeń dla dialogu i wymiany myśli na temat tego, co kryje się poza granicami naszej planety.\r\n        Razem wyruszamy w nieznane, badamy granice ludzkiej wytrzymałości i podziwiamy piękno kosmosu. Zapraszamy do uczestnictwa w tym niesamowitym szlaku odkrywczym, gdzie każdy krok jest krokiem w stronę nowej, fascynującej przygody kosmicznej!\r\n    </p>\r\n    <p>\r\n        Lot kosmiczny – zastosowanie techniki kosmicznej, w celu wyniesienia statku kosmicznego w i poprzez przestrzeń kosmiczną. Umowna granica pomiędzy atmosferą Ziemi i przestrzenią kosmiczną przebiega na wysokości 100 km n.p.m., tzw linia Kármána. Powyższa definicja została przyjęta przez Międzynarodową Federację Lotniczą (FAI).\r\n        Lot kosmiczny jest stosowany w eksploracji kosmosu, a także w celach komercyjnych, takich jak turystyka kosmiczna czy komunikacja satelitarna. Inne niekomercyjne zastosowania lotów kosmicznych to obserwatoria kosmiczne, satelity wywiadowcze i inne typy satelitów obserwacyjnych.\r\n        Lot typowo zaczyna się odpaleniem rakiety nośnej, która dostarcza wstępnego ciągu do pokonania siły ciężkości i odrywa pojazd od powierzchni Ziemi. Ruch pojazdu w przestrzeni kosmicznej – zarówno bez zastosowania napędu, jak i z nim – jest przedmiotem badań dyscypliny zwanej astrodynamiką. Niektóre pojazdy pozostają w przestrzeni kosmicznej na zawsze, niektóre spalają się w czasie ponownego wejścia w atmosferę, a inne docierają na powierzchnie planetarne lub księżycowe poprzez lądowanie lub zderzenie.\r\n        Witaj na najnowszej przestrzeni odkrywania kosmosu! Nasza strona to epicentrum wiedzy o lotach kosmicznych, miejscem, gdzie pasja do nieba spotyka się z najnowszymi osiągnięciami technologii kosmicznej. Przygotuj się na niezapomnianą podróż przez niekończące się przestrzenie kosmosu, gdzie granice możliwości stale się przesuwają, a nauka staje się rzeczywistością.\r\n    </p>\r\n', 1),
(4, 'historia', '\r\n<h1>Historia lotów kosmicznych</h1>\r\n	<div class=\"square\">\r\n		<img src=\"img/apollo.jpg\" alt=\"Misja Apollo\" width=\"350\">\r\n	</div>\r\n	<p>\r\n		Pierwsze realne propozycje podróży kosmicznych przypisywane są Konstantinowi Ciołkowskiemu. Jego najsłynniejsze dzieło, „Исследование мировых пространств реактивными приборами” (Eksploracja przestrzeni kosmicznej dzięki urządzeniom odrzutowym), zostało opublikowane w roku 1903, ale ta teoretyczna rozprawa nie była szeroko znana poza Rosją.\r\n\r\n		Loty kosmiczne stały się możliwe z inżynierskiego punktu widzenia po publikacji Roberta Goddarda Metoda osiągania ekstremalnych wysokości, w której zaproponował szereg konkretnych rozwiązań pozwalających na zasadnicze ulepszenie rakiet, m.in. przez zastosowanie dyszy de Lavala do silników rakietowych. Dysza pozwala na osiągnięcie naddźwiękowego wypływu gazu. Co najważniejsze, R. Goddard zbudował rakiety na paliwo ciekłe i rozwiązał szereg związanych z nimi problemów (m.in. sterowanie rakietą). Prace jego miały wielki wpływ na Hermanna Obertha i Wernhera von Brauna, później kluczowe postaci z dziedziny lotów kosmicznych.\r\n\r\n		Pierwszą rakietą, która dotarła do przestrzeni kosmicznej była niemiecka rakieta V2 w czasie lotu testowego 3 października 1942. 4 października 1957 Związek Socjalistycznych Republik Radzieckich wystrzelił Sputnika 1, który stał się pierwszym sztucznym satelitą na orbicie Ziemi. Pierwszym lotem załogowym była misja Wostok 1 12 kwietnia 1961 – na pokładzie pojazdu znajdował się kosmonauta Jurij Gagarin, który dokonał jednego okrążenia wokół Ziemi.\r\n\r\n		Rakiety pozostają jedynymi praktycznymi środkami dotarcia do przestrzeni kosmicznej. Inne techniki jak scramjet, w dalszym ciągu nie pozwalają na osiągnięcie prędkości orbitalnej.\r\n	</p>\r\n	<p>\r\n		Najpowszechniejszą definicją granicy przestrzeni kosmicznej jest linii Kármána. W Stanach Zjednoczonych Ameryki czasem stosowana jest alternatywna definicja, określająca granicę przestrzeni kosmicznej na wysokości 50 mil. Jest to lepiej określona granica bowiem powyzej aerodynamiczna siła nośna jest za mała do lotu samolotów.\r\n\r\n		Aby pocisk rakietowy mógł polecieć w kosmos, potrzebuje on minimalnego delta-v. Ta prędkość jest o wiele mniejsza niż prędkość ucieczki, pozwalająca na wyrwanie się z zasięgu działania przyciągania Ziemi.\r\n\r\n		Jest możliwe, aby pojazd kosmiczny opuścił ciało niebieskie bez osiągania prędkości ucieczkowej z powierzchni danego ciała poprzez wytwarzanie ciągu po wyniesieniu. Jest jednak bardziej wydajne paliwowo, aby pojazd spalił swoje paliwo tak blisko powierzchni jak to możliwe, zachowując możliwość osiągnięcia prędkości ucieczki w późniejszym czasie[1].\r\n	</p>\r\n	<b>\r\n		Lot kosmiczny ze startem z Ziemi\r\n	</b>\r\n	<div class=\"square\">\r\n		<img src=\"img/shuttle.jpg\" alt=\"Shuttle\" width=\"350\">\r\n	</div>\r\n	<p>\r\n		Najpowszechniejszą definicją granicy przestrzeni kosmicznej jest linii Kármána. W Stanach Zjednoczonych Ameryki czasem stosowana jest alternatywna definicja, określająca granicę przestrzeni kosmicznej na wysokości 50 mil. Jest to lepiej określona granica bowiem powyzej aerodynamiczna siła nośna jest za mała do lotu samolotów.\r\n\r\n		Aby pocisk rakietowy mógł polecieć w kosmos, potrzebuje on minimalnego delta-v. Ta prędkość jest o wiele mniejsza niż prędkość ucieczki, pozwalająca na wyrwanie się z zasięgu działania przyciągania Ziemi.\r\n\r\n		Jest możliwe, aby pojazd kosmiczny opuścił ciało niebieskie bez osiągania prędkości ucieczkowej z powierzchni danego ciała poprzez wytwarzanie ciągu po wyniesieniu. Jest jednak bardziej wydajne paliwowo, aby pojazd spalił swoje paliwo tak blisko powierzchni jak to możliwe, zachowując możliwość osiągnięcia prędkości ucieczki w późniejszym czasie[1].\r\n		W czasie lotu suborbitalnego pojazd dociera do przestrzeni kosmicznej, ale nie zostaje umieszczony na orbicie. Jego trajektoria prowadzi z powrotem na powierzchnię Ziemi. Loty suborbitalne mogą trwać wiele godzin. Pioneer 1, pierwszy sztuczny satelita NASA, na skutek usterki, zamiast polecieć w kierunku Księżyca, znalazł się na trajektorii suborbitalnej o wysokości 113 854 m, a w atmosferę Ziemi ponownie wszedł 43 godziny po starcie.\r\n\r\n		17 maja 2004 Civilian Space eXploration Team wystrzeliła pojazd GoFast Rocket do lotu suborbitalnego – pierwszego w historii amatorskiego lotu kosmicznego. 21 czerwca 2004 SpaceShipOne został zastosowany do pierwszego finansowanego prywatnie załogowego lotu kosmicznego.\r\n	</p>\r\n	<p>\r\n		Minimalny lot orbitalny wymaga znacznie większych prędkości, niż minimalny lot suborbitalny, a więc jest on technicznie trudniejszy do osiągnięcia. Dla uzyskania lotu orbitalnego, prędkość kątowa wokół Ziemi jest tak samo istotna jak pułap lotu. Aby możliwy był stabilny, długotrwały lot kosmiczny, pojazd musi osiągnąć minimalną prędkość orbitalną wymaganą dla zamkniętej orbity.\r\n		Uzyskanie zamkniętej orbity nie jest konieczne do podróży międzyplanetarnych, dla których pojazd musi osiągnąć prędkość ucieczki. Wczesne radzieckie pojazdy pomyślnie osiągały bardzo wysokie pułapy bez wchodzenia na orbitę. W czasie wstępnego planowania misji Apollo NASA rozważała zastosowanie bezpośredniego wyniesienia na Księżyc, jednak pomysł ten został porzucony ze względu na masę pojazdu. Wiele automatycznych sond kosmicznych badających zewnętrzne planety Układu Słonecznego stosuje metodę bezpośredniego wyniesienia – nie orbitują one wokół Ziemi przed odlotem.\r\n		Zostało zaproponowanych wiele sposobów docierania do przestrzeni kosmicznej, niewykorzystujących rakiet. Pomysł windy kosmicznej, pomimo elegancji rozwiązania, obecnie (2023 r.) nie jest wykonalny. Z kolei nie ma znanych problemów konstrukcyjnych blokujących wykonanie procy elektromagnetycznej takiej jak pętla startowa. Inne pomysły wykorzystują wspomagane rakietowo odrzutowce jak Skylon lub trudniejszy w realizacji silnik scramjet. Dla ładunków towarowych zaproponowano wystrzeliwanie pojazdu ze specjalnego działa.\r\n	</p>\r\n	<b>\r\n		Łazik Perseverance\r\n	</b>\r\n	<div class=\"square\">\r\n		<img src=\"img/mars_rover.jpg\" alt=\"Mars Rover\" width=\"350\">\r\n	</div>\r\n	<p>\r\n		Perseverance (pol. „Wytrwałość”) – planetarny łazik misji NASA Mars 2020, której celem jest zbadanie marsjańskiego krateru Jezero. Łazik ma na pokładzie siedem urządzeń do prowadzenia naukowych i technologicznych badań dotyczących eksploracji Marsa\r\n\r\n		Łazik Perseverance pomoże w poszerzeniu wiedzy o tym, jak przyszli odkrywcy będą wykorzystywać zasoby naturalne dostępne na powierzchni planety. Umiejętność życia na Marsie przekształciłaby przyszłą eksplorację planety. Projektanci przyszłych załogowych wypraw na Marsa będą mogli korzystać z tej misji, aby zrozumieć zagrożenia jakie stwarza pył marsjański i wskazać technologię przetwarzania dwutlenku węgla z atmosfery do produkcji tlenu. Doświadczenia te pomogą inżynierom dowiedzieć się jak korzystać z marsjańskich zasobów do produkcji tlenu do oddychania ludzi i ewentualnie jako utleniacza do paliwa rakietowego[1].\r\n\r\n		W 2018 roku jako miejsce lądowania łazika został wybrany krater Jezero o złożonej historii geologicznej, który w odległej przeszłości mieścił jezioro[2].\r\n\r\n		NASA wykorzystała przy lądowaniu Perseverance największy w historii spadochron użyty na Marsie o średnicy 21,5 m[3]. Jego zadaniem było spowolnienie opadania łazika. Pod koniec opadania został on odczepiony wraz z czymś, co można nazwać latającym dźwigiem. Latający dźwig opuścił łazika na powierzchnię planety, po czym odczepił liny, a sam odleciał na bezpieczną odległość[4][5] (około 700 m[3]).\r\n\r\n		Nagranie z lądowania Perseverance\r\n		z użyciem spadochronu i „latającego dźwigu”.\r\n		Lądowanie zakończyło się sukcesem 18 lutego 2021[6], łazik przesłał także pierwsze zdjęcia z planety[7]. Później przesłał również nagranie video pokazujące procedurę lądowania[3].\r\n\r\n		23 lipca 2021 roku NASA poinformowała, że łazik Perseverance zacznie pobieranie pierwszej próbki marsjańskich skał, będzie na to potrzebował ok. 11 dni. Zebrany materiał ma zostać w przyszłości wysłany na Ziemię w ramach misji Mars Sample Return[8].Perseverance (pol. „Wytrwałość”) – planetarny łazik misji NASA Mars 2020, której celem jest zbadanie marsjańskiego krateru Jezero. Łazik ma na pokładzie siedem urządzeń do prowadzenia naukowych i technologicznych badań dotyczących eksploracji Marsa\r\n\r\n		Łazik Perseverance pomoże w poszerzeniu wiedzy o tym, jak przyszli odkrywcy będą wykorzystywać zasoby naturalne dostępne na powierzchni planety. Umiejętność życia na Marsie przekształciłaby przyszłą eksplorację planety. Projektanci przyszłych załogowych wypraw na Marsa będą mogli korzystać z tej misji, aby zrozumieć zagrożenia jakie stwarza pył marsjański i wskazać technologię przetwarzania dwutlenku węgla z atmosfery do produkcji tlenu. Doświadczenia te pomogą inżynierom dowiedzieć się jak korzystać z marsjańskich zasobów do produkcji tlenu do oddychania ludzi i ewentualnie jako utleniacza do paliwa rakietowego[1].\r\n\r\n		W 2018 roku jako miejsce lądowania łazika został wybrany krater Jezero o złożonej historii geologicznej, który w odległej przeszłości mieścił jezioro[2].\r\n\r\n		NASA wykorzystała przy lądowaniu Perseverance największy w historii spadochron użyty na Marsie o średnicy 21,5 m[3]. Jego zadaniem było spowolnienie opadania łazika. Pod koniec opadania został on odczepiony wraz z czymś, co można nazwać latającym dźwigiem. Latający dźwig opuścił łazika na powierzchnię planety, po czym odczepił liny, a sam odleciał na bezpieczną odległość[4][5] (około 700 m[3]).\r\n\r\n		Nagranie z lądowania Perseverance\r\n		z użyciem spadochronu i „latającego dźwigu”.\r\n		Lądowanie zakończyło się sukcesem 18 lutego 2021[6], łazik przesłał także pierwsze zdjęcia z planety[7]. Później przesłał również nagranie video pokazujące procedurę lądowania[3].\r\n\r\n		23 lipca 2021 roku NASA poinformowała, że łazik Perseverance zacznie pobieranie pierwszej próbki marsjańskich skał, będzie na to potrzebował ok. 11 dni. Zebrany materiał ma zostać w przyszłości wysłany na Ziemię w ramach misji Mars Sample Return[8].\r\n	</p>\r\n', 1),
(5, 'kontakt', '<div id=\"animacjaTestowa1\" class=\"test-block\">kliknij, a się powiększe</div>\r\n\r\n<script>\r\n    $(document).ready(function() {\r\n        $(\"#animacjaTestowa1\").on(\"click\", function() {\r\n            $(this).animate({\r\n                width: \"500px\",\r\n                opacity: 0.4,\r\n                fontSize: \"3em\",\r\n                borderWidth: \"10px\"\r\n            }, 1500);\r\n        });\r\n    });\r\n</script>\r\n\r\n<div id=\"animacjaTestowa2\" class=\"test-block\">najedź kursorem a sie powieksze</div>\r\n\r\n<script>\r\n    $(document).ready(function() {\r\n        $(\"#animacjaTestowa2\").on({\r\n            \"mouseover\": function() {\r\n                $(this).animate({\r\n                    width: 300\r\n                }, 800);\r\n            },\r\n            \"mouseout\": function() {\r\n                $(this).animate({\r\n                    width: 200\r\n                }, 800);\r\n            }\r\n        });\r\n    });\r\n</script>\r\n\r\n<div id=\"animacjaTestowa3\" class=\"test-block\">\r\n    Klikaj abym urósł\r\n</div>\r\n\r\n<script>\r\n    $(document).ready(function() {\r\n        $(\"#animacjaTestowa3\").on(\"click\", function() {\r\n            if (!$(this).is(\":animated\")) {\r\n                $(this).animate({\r\n                    width: \"+=\" + 50,\r\n                    height: \"+=\" + 10,\r\n                    opacity: \"-=\" + 0.1\r\n                }, 3000);\r\n            }\r\n        });\r\n    });\r\n</script>\r\n<div class=\"contact\">\r\n    <h2>Kontakt</h2>\r\n    <p>Aby skontaktować się z nami, wypełnij poniższy formularz:</p>\r\n    <form action=\"barskimateusz222@gmail.com\" method=\"post\" enctype=\"text/plain\">\r\n        Imię: <input type=\"text\" name=\"imie\"><br>\r\n        E-mail: <input type=\"text\" name=\"email\"><br>\r\n        Wiadomość:<br>\r\n        <textarea name=\"wiadomosc\" rows=\"5\" cols=\"40\"></textarea><br>\r\n        <input type=\"submit\" value=\"Wyślij\">\r\n    </form>\r\n</div>\r\n', 1),
(6, 'misje', '	<h1>Misje Kosmiczne</h1>\r\n\r\n	<b>Misje Kosmiczne: Odkrywanie Nieznanych Granic Kosmosu</b>\r\n	<p>\r\n		Przez lata loty kosmiczne i misje eksploracyjne stały się manifestacją ludzkiej ciekawości i determinacji wobec niepoznanych obszarów kosmosu. Poniżej przyjrzymy się szczegółowo kilku misjom, które na stałe wpisały się w historię eksploracji kosmicznej.\r\n	</p>\r\n	<b>Program Apollo - Lądowanie na Księżycu (1969-1972)</b>\r\n	<p>\r\n		Program Apollo, zainicjowany przez NASA w latach 60. XX wieku, był jednym z najbardziej ambitnych przedsięwzięć ludzkości. Apollo 11, którego kulminacyjnym momentem był lądowaniem na Księżycu w 1969 roku, symbolizuje triumf nauki, technologii i ludzkiej odwagi. Neil Armstrong, jako pierwszy człowiek, postawił stopę na powierzchni Księżyca, podczas gdy Buzz Aldrin towarzyszył mu w tej niezwykłej chwili. Dalsze misje Apollo kontynuowały eksplorację Księżyca, dostarczając naukowców bogatą dawkę informacji o geologii i historii naszego naturalnego satelity.\r\n	</p>\r\n	<b>Teleskop Hubble (1990 - obecnie)</b>\r\n	<p>\r\n		Teleskop Hubble, wyniesiony na orbitę wokółziemską w 1990 roku, to jedno z najważniejszych narzędzi w dziedzinie astronomii obserwacyjnej. Jego zdolność do obserwacji w zakresie widzialnym, podczerwieni i ultrafioletu dostarczyła nam niezwykłych obrazów kosmicznych obiektów. Dzięki Hubble\'owi odkrywamy najdalsze galaktyki, analizujemy atmosfery planet pozasłonecznych, a także badamy ewolucję gwiazd. Jego misja nie tylko dostarczyła nam fascynujących zdjęć, ale także zrewolucjonizowała naszą wiedzę na temat struktury wszechświata.\r\n	</p>\r\n	<div class=\"square\">\r\n		<img src=\"img/mars_rover.jpg\" alt=\"mars_rover\" width=\"300\">\r\n	</div>\r\n	<b>Mars Rover - Misje eksploracyjne Marsa (2004 - obecnie)</b>\r\n	<p>\r\n		Misje eksploracyjne Marsa, takie jak Spirit, Opportunity i Perseverance Rover, umożliwiły nam lepsze zrozumienie Czerwonej Planety. Spirit i Opportunity, pracujące znacznie dłużej niż przewidywano, dokonały ważnych odkryć, potwierdzając istnienie wody w przeszłości i dostarczając dowodów na zmienne warunki klimatyczne. Perseverance, najnowszy członek rodziny roverów, przekształca nasze badania nad Marsa, bada tereny potencjalnie sprzyjające życiu i poszukuje śladów mikroorganizmów.\r\n	</p>\r\n	<b>Voyager 1 i 2 - Odkrywanie Granic Układu Słonecznego (1977 - obecnie)</b>\r\n	<p>\r\n		Sondy Voyager, wystrzelone w 1977 roku, to prawdziwe nomady kosmiczne, które przemierzyły setki milionów mil w poszukiwaniu odpowiedzi na pytania o granice Układu Słonecznego. Voyager 1 jest obecnie pierwszym obiektem stworzonym przez człowieka, który przekroczył granicę międzygwiazdową, podczas gdy Voyager 2 zbadał gazowe giganty i skierował się ku rubieżom heliosfery. Obydwa statki ciągle przekazują dane naukowe, dostarczając informacji na temat warunków w przestrzeni międzygwiazdowej.\r\n	</p>\r\n	<div class=\"square\">\r\n		<img src=\"img/ISS.jpg\" alt=\"ISS\" width=\"300\">\r\n	</div>\r\n	<b>Międzynarodowa Stacja Kosmiczna (ISS) (2000 - obecnie)</b>\r\n	<p>\r\n		ISS jest wspólnym projektem wielu krajów, stanowiącym jedno z największych osiągnięć współpracy międzynarodowej w dziedzinie kosmicznej eksploracji. Jak pływające laboratorium kosmiczne, ISS pozwala naukowcom przeprowadzać badania w warunkach mikrograwitacyjnych, eksperymentować w dziedzinie biologii i medycyny kosmicznej oraz testować nowe technologie. Stała obecność ludzi w przestrzeni kosmicznej umożliwia również monitorowanie długotrwałego wpływu mikrograwitacji na ciało ludzkie.\r\n	</p>\r\n	<b>Kepler - Poszukiwanie Egzoplanet (2009 - 2018)</b>\r\n	<p>eleskop Kepler, działający w latach 2009-2018, był pionierskim narzędziem w poszukiwaniach planet pozasłonecznych. Jego precyzyjne pomiary światła gwiazd pozwoliły na odkrycie tysięcy egzoplanet, w tym tych w strefie zamieszkanej. Kepler nie tylko rozszerzył naszą wiedzę na temat liczby planet w naszej galaktyce, ale także zainicjował nowe podejścia do identyfikacji warunków, które sprzyjają życiu.</p>\r\n	<p>\r\n		Te misje są jak rozdziały w fascynującej historii eksploracji kosmosu, każda z nich przyczyniając się do zrozumienia najbardziej skomplikowanych tajemnic wszechświata. Każda podróż w głąb kosmosu to również kolejny krok ku odkryciom, które będą miały wpływ na nasze spojrzenie na istnienie i ewolucję Wszechświata.\r\n	</p>', 1),
(7, 'filmy', '\r\n    <h1>Filmy na temat lotów kosmicznych</h1>\r\n\r\n    <div class=\"film-container\">\r\n        <div class=\"film\">\r\n            <iframe src=\"https://www.youtube.com/embed/Zb0UuCLjQaE?si=98mLymOon29ps0No\" title=\"YouTube video player\"\r\n                    allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\"\r\n                    allowfullscreen></iframe>\r\n            <div class=\"film-description\">\r\n                Bardzo ciekawy film na temat prędkości\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"film\">\r\n            <iframe src=\"https://www.youtube.com/embed/q9OKuh0PRD0?si=P4XL-30JFIMVwBhl\" title=\"YouTube video player\"\r\n                    allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\"\r\n                    allowfullscreen></iframe>\r\n            <div class=\"film-description\">\r\n                Film na temat przyszłości lotów kosmicznych\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"film\">\r\n            <iframe src=\"https://www.youtube.com/embed/rHatdDmiQNw?si=KCUg3bNh4KBPLRPt\" title=\"YouTube video player\"\r\n                    allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\"\r\n                    allowfullscreen></iframe>\r\n            <div class=\"film-description\">\r\n                Film dokumentalny o samolotach kosmicznych\r\n            </div>\r\n        </div>\r\n    </div>', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `data_utworzenia` date NOT NULL,
  `data_modyfikacji` date NOT NULL,
  `data_wygasniecia` date NOT NULL,
  `cena_netto` float NOT NULL,
  `podatek_vat` float NOT NULL,
  `ilosc_sztuk` int(11) NOT NULL,
  `status_dostepnosci` tinyint(1) NOT NULL,
  `kategoria` varchar(255) NOT NULL,
  `gabaryt` varchar(255) NOT NULL,
  `zdjecie` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`id`, `tytul`, `opis`, `data_utworzenia`, `data_modyfikacji`, `data_wygasniecia`, `cena_netto`, `podatek_vat`, `ilosc_sztuk`, `status_dostepnosci`, `kategoria`, `gabaryt`, `zdjecie`) VALUES
(1, '12332', '123', '2024-01-10', '2024-01-14', '2024-02-09', 123, 123, 1120, 0, '123', '123', 0x68747470733a2f2f7777772e676f6f676c652e636f6d2f696d677265733f696d6775726c3d68747470732533412532462532466265737473746f72652e706c253246696d616765732532463435303033335f3633363032395f6170706c652d6970686f6e652d31312d70726f2d35313267622d6d69646e696768742d677265656e2d706f2d7a77726f6369652e6a70672674626e69643d47414a37576e726970563239354d267665743d31326168554b45776a503738656f3174324441785538675f304848563067434d63514d796754656755494152434841672e2e6926696d6772656675726c3d68747470732533412532462532466265737473746f72652e706c2532466170706c652d6970686f6e652d31312d70726f2d35313267622d6d69646e696768742d677265656e2d706f2d7a77726f6369652d703435303033332e68746d6c26646f6369643d4e5175424b42533862736e50564d26773d3138303026683d3133353026713d6970686f6e652532303131267665643d326168554b45776a503738656f3174324441785538675f304848563067434d63514d79675465675549415243484167),
(5, 'IPhoneX', 'dobry', '2024-01-13', '2024-01-13', '2024-02-12', 9999, 0, 89, 1, 'Iphone', 'mały', 0x6368756a),
(6, 'Iphone 11', 'tak bardzo dobry', '2024-01-14', '2024-01-14', '2024-02-13', 12312, 0, 3, 1, 'Iphone', 'mały', 0x68747470733a2f2f7777772e676f6f676c652e636f6d2f696d677265733f696d6775726c3d68747470732533412532462532466265737473746f72652e706c253246696d616765732532463435303033335f3633363032395f6170706c652d6970686f6e652d31312d70726f2d35313267622d6d69646e696768742d677265656e2d706f2d7a77726f6369652e6a70672674626e69643d47414a37576e726970563239354d267665743d31326168554b45776a503738656f3174324441785538675f304848563067434d63514d796754656755494152434841672e2e6926696d6772656675726c3d68747470732533412532462532466265737473746f72652e706c2532466170706c652d6970686f6e652d31312d70726f2d35313267622d6d69646e696768742d677265656e2d706f2d7a77726f6369652d703435303033332e68746d6c26646f6369643d4e5175424b42533862736e50564d26773d3138303026683d3133353026713d6970686f6e652532303131267665643d326168554b45776a503738656f3174324441785538675f304848563067434d63514d79675465675549415243484167),
(7, '123', '123123', '2024-01-14', '2024-01-14', '2024-02-13', 12, 123, 0, 1, '323', '12', 0x33333233),
(8, '123123', '123123', '2024-01-14', '2024-01-14', '2024-02-13', 123, 1, 118, 1, '421', '12', 0x68747470733a2f2f6265737473746f72652e706c2f696d616765732f6d696e69322f3435303033335f3633363032355f6170706c652d6970686f6e652d31312d70726f2d35313267622d6d69646e696768742d677265656e2d706f2d7a77726f6369652e6a7067);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `page_list`
--
ALTER TABLE `page_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `page_list`
--
ALTER TABLE `page_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
