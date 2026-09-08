import 'package:portfolio/models/project.dart';

const richAbleDescription =
    'Turowa gra edukacyjna w której Twoim zdanie jest stać się bogatym poprzez prace, inwestowanie na giełdzie lub w nieruchomości, czy zakładanie własnych biznesów.\n\n'
    '**Główne funkcje i zadania:**\n'
    '* Dostęp do różnych prac oraz możliwość awansowania uzależniona od Twoich umiejętności\n'
    '* Możliwość inwestowania na giełdzie\n'
    '* Możliwość inwestowania w nieruchomości\n'
    '* Możliwość podjęcia pracy freelancera jako youtuber, programista itd.\n'
    '* Możliwość zakładania własnych firm i zatrudniania pracowników.\n'
    '* Losowe eventy urozmaicające rozgrywkę.\n'
    '* Moduł umiejętności umożlwiający awans w pracy i tworzenie lepszych rzeczy jako freelancer.\n'
    '* Moduł banku umożlwiający wzięcie pożyczki lub założenie lokaty.\n'
    '* Moduł rozdysponowywania czasu na różne czynności.\n';

const deskableDescription =
    'Aplikacja do rezerowania biurek wraz z ekranem do zarządzania organizacją i pokajami.\n\n'
    '**Główne funkcje i zadania:**\n'
    '* Mozliwośc zarezerwowania biurka na daną godzine\n'
    '* Podział na organizacje i pokoje\n'
    '* Przyjazny kreator pokojów oparty o drag&drop\n';

const fitableDescription =
    'Jest to mój prywatny plac zabaw od którego zaczęła się moja przygoda z programowaniem obiektowym. Projekt początkowo zaczynałem pisać na czystym androidzie, lecz szybko przeniosłem się na fluttera. Aplikacje kilkukrotnie przepisywałem od podstaw, testując nowo zdobytą wiedzę, sprawdzając inne rozwiązania i starając się pisać lepszy kod.\n\n'
    '**Główne funkcje i zadania:**\n'
    '* Dodawanie produktów.\n'
    '* Tworzenie i publikowania własnych przepisów z wideo oraz zdjęciami.\n'
    '* Obserwowanie i wyszukiwanie innych użytkowników lub trenerów.\n'
    '* Wyszukiwarka i skaner kodów kreskowych.\n'
    '* Dodawania pomiarów (waga, tkanka tłuszczowa, obwody ciała).\n'
    '* Synchronizacja z Google Fit (waga, kroki, spalone kalorie).\n'
    '* Wyliczenia BMR wraz z personalizacją.\n';

const zprboxDescription =
    'Projekt wykorzystywany w firmie, napisany przeze mnie od podstaw. Aplikacja łączy się z bazą danych Oracle wykorzystując sterowniki ODBC. Poza samą aplikacją do poprawnego jej funkcjonowania przygotowałem odpowiednie zapytania, tabele, procedury oraz triggery.\n\n'
    '**Główne funkcje i zadania:**\n'
    '* Pobranie najstarszej wolnej reklamacji.\n'
    '* Dodawanie komentarzy.\n'
    '* Przepięcie na inna osobę lub skill.\n'
    '* Zamawianie rozmów.\n'
    '* Dostęp do potrzebnych raportów.\n'
    '* Dostęp do indywidualnego systemu motywacyjnego.\n'
    '* Panel administracyjny dla kadry z raportami i możliwością dodawania nowych użytkowników, zarządzania reklamacjami oraz uprawnieniami.\n';

final List<Project> projects = [
  Project(
    name: 'RichAble',
    github: 'https://github.com/mniemyjski/life_simulator',
    images: [
      'resources/images/richable/richable.png',
      'resources/images/richable/1.jpg',
      'resources/images/richable/2.jpg',
      'resources/images/richable/3.jpg',
      'resources/images/richable/4.jpg',
      'resources/images/richable/5.jpg',
      'resources/images/richable/6.jpg',
      'resources/images/richable/7.jpg',
      'resources/images/richable/8.jpg',
      'resources/images/richable/9.jpg',
      'resources/images/richable/10.jpg',
      'resources/images/richable/11.jpg',
      'resources/images/richable/12.jpg',
    ],
    libraries: [
      'Flutter',
      'Dart',
      'Bloc',
      'HydratedBloc',
      'Freezed',
      'Isar',
      'GetIt',
      'Injectable',
      'Auto_route',
      'Localization',
    ],
    description: richAbleDescription,
  ),
  Project(
    name: 'Deskable',
    github: 'https://github.com/mniemyjski/deskable',
    web: 'https://deskable.pl/',
    images: [
      'resources/images/deskable/1.jpg',
      'resources/images/deskable/2.jpg',
      'resources/images/deskable/3.jpg',
    ],
    libraries: [
      'Flutter',
      'Dart',
      'Bloc',
      'Firestore',
      'Storage',
      'Authentication',
      'Localization',
    ],
    description: deskableDescription,
  ),
  Project(
    name: 'Fitable',
    images: [
      'resources/images/fitable/fitable.png',
      'resources/images/fitable/1.jpg',
      'resources/images/fitable/2.jpg',
      'resources/images/fitable/3.jpg',
      'resources/images/fitable/4.jpg',
      'resources/images/fitable/5.jpg',
      'resources/images/fitable/6.jpg',
    ],
    libraries: [
      'Flutter',
      'Dart',
      'Riverpod',
      'Firestore',
      'Storage',
      'Authentication',
      'Functions',
      'Algolia',
      'Localization',
    ],
    description: fitableDescription,
  ),
  Project(
    name: 'ZPRBOX',
    images: [
      'resources/images/zpr/1.jpg',
    ],
    libraries: ['USERFORM', 'VBA', 'ODBC', 'SQL', 'PL/SQL'],
    description: zprboxDescription,
  ),
];
