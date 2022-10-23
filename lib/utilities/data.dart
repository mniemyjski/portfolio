import 'package:portfolio/app/projects/model/project.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

final List<Project> projects = [
  Project(
    name: 'Deskable',
    github: 'https://github.com/mniemyjski/deskable',
    googlePlay: '',
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
      'Localization'
    ],
    markdown: MarkdownBody(
        data:
            'Aplikacja do rezerowania biurek wraz z ekranem do zarządzania organizacją i pokajami.\n\n'
            '**Główne funkcje i zadania:**\n'
            '* Mozliwośc zarezerwowania biurka na daną godzine\n'
            '* Podział na organizacje i pokoje\n'
            '* Przyjazny kreator pokojów oparty o drag&drop\n'),
  ),
  // Project(
  //   name: 'Languendly',
  //   github: 'https://github.com/Clanhouse/languendly',
  //   googlePlay: '',
  //   images: [
  //     'resources/images/languendly/1.jpg',
  //   ],
  //   libraries: ['Flutter', 'Dart', 'Bloc', 'Localization', 'Python', 'Django'],
  //   markdown: MarkdownBody(data: 'Aplikacja do nauki języków realizowana w ramach społeczności ClanHouse.\n\n'),
  // ),
  Project(
    name: 'Fitable',
    github: '',
    googlePlay: '',
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
      'Localization'
    ],
    markdown: MarkdownBody(
      data:
          'Jest to mój prywatny plac zabaw od którego zaczęła się moja przygoda z programowaniem obiektowym. Aktualnie rozpocząłem przepisywanie aplikacji od podstaw wykorzystując Bloc/Cubit do zarzadzania stanem i Appwrite jako backend.\n\n'
          '**Główne funkcje i zadania:**\n'
          '* Dodawanie produktów.\n'
          '* Tworzenie i publikowania własnych przepisów z wideo oraz zdjęciami.\n'
          '* Obserwowanie i wyszukiwanie innych użytkowników lub trenerów.\n'
          '* Wyszukiwarka i skaner kodów kreskowych.\n'
          '* Dodawania pomiarów (waga, tkanka tłuszczowa, obwody ciała).\n'
          '* Synchronizacja z Google Fit (waga, kroki, spalone kalorie).\n'
          '* Wyliczenia BMR wraz z personalizacją.\n',
    ),
  ),
  Project(
    name: 'Authentication BloC',
    github: 'https://github.com/mniemyjski/authentication_bloc',
    googlePlay: '',
    web: 'https://authentication-16d99.firebaseapp.com/sign-in',
    images: [
      'resources/images/authentication/authentication.png',
      'resources/images/authentication/1.jpg',
      'resources/images/authentication/2.jpg',
      'resources/images/authentication/3.jpg',
      'resources/images/authentication/4.jpg',
      'resources/images/authentication/5.jpg',
    ],
    libraries: [
      'Flutter',
      'Dart',
      'BLoc',
      'Firestore',
      'Storage',
      'Authentication',
      'Localization',
      'Null Safety'
    ],
    markdown: MarkdownBody(
      data:
          'Projekt "startowy" wykorzystujący BloC napisany głównie w celach edukacyjnych.\n\n'
          '**Główne funkcje i zadania:**\n'
          '* Autoryzacja email oraz google\n'
          '* Edycja profilu i zdjęcia\n'
          '* Lokalizacja\n'
          '* Tryb Ciemny\n',
    ),
  ),
  // Project(
  //   name: 'Authentication Riverpod',
  //   github: 'https://github.com/mniemyjski/authentication_riverpod',
  //   googlePlay: '',
  //   web: '',
  //   images: [
  //     'resources/images/authentication/authentication.png',
  //     'resources/images/authentication/1.jpg',
  //     'resources/images/authentication/2.jpg',
  //     'resources/images/authentication/3.jpg',
  //     'resources/images/authentication/4.jpg',
  //     'resources/images/authentication/5.jpg',
  //   ],
  //   libraries: ['Flutter', 'Dart', 'Riverpod', 'Firestore', 'Storage', 'Authentication', 'Localization', 'Null Safety'],
  //   markdown: MarkdownBody(
  //     data: 'Projekt "startowy" wykorzystujący Riverpod napisany głównie w celach edukacyjnych.\n\n'
  //         '**Główne funkcje i zadania:**\n'
  //         '* Autoryzacja email oraz google\n'
  //         '* Edycja profilu i zdjęcia\n'
  //         '* Lokalizacja\n'
  //         '* Tryb Ciemny\n',
  //   ),
  // ),
  Project(
    name: 'ZPRBOX',
    images: [
      'resources/images/zpr/1.jpg',
    ],
    libraries: ['USERFORM', 'VBA', 'ODBC', 'SQL', 'PL/SQL'],
    markdown: MarkdownBody(
      data:
          'Projekt wykorzystywany w firmie, napisany przeze mnie od podstaw. Aplikacja łączy się z bazą danych Oracle wykorzystując sterowniki ODBC. Poza samą aplikacją do poprawnego jej funkcjonowania przygotowałem odpowiednie zapytania, tabele, procedury oraz triggery.\n\n'
          '**Główne funkcje i zadania:**\n'
          '* Pobranie najstarszej wolnej reklamacji.\n'
          '* Dodawanie komentarzy.\n'
          '* Przepięcie na inna osobę lub skill.\n'
          '* Zamawianie rozmów.\n'
          '* Dostęp do potrzebnych raportów.\n'
          '* Dostęp do indywidualnego systemu motywacyjnego.\n'
          '* Panel administracyjny dla kadry z raportami i możliwością dodawania nowych użytkowników, zarządzania reklamacjami oraz uprawnieniami.\n',
    ),
  ),
];
final List<String> tech = [
  'Flutter 🔥',
  'Dart',
  'Firebase',
  'SQL',
  'PL/SQL',
  'VBA'
];
