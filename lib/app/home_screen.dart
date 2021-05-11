import 'package:flutter/material.dart';
import 'package:portfolio/app/about_me_sceen.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/app/projects/projects_sceen.dart';
import 'package:portfolio/app/welcome_screen.dart';
import 'package:portfolio/common_widgets/text_button.dart';
import 'package:portfolio/utilities/constants.dart';

class HomeScreen extends StatelessWidget {
  final _controller = ScrollController();
  final List<Project> _projects = [
    Project(
      name: 'Fitable',
      desc: Constants.fitableDesc(),
      desc2: Constants.fitableDesc2(),
      github: Constants.github(),
      googlePlay: ' ',
      image: 'resources/images/fitable/fitable.png',
      images: [
        'resources/images/fitable/1.jpg',
        'resources/images/fitable/2.jpg',
        'resources/images/fitable/3.jpg',
        'resources/images/fitable/4.jpg',
        'resources/images/fitable/5.jpg',
        'resources/images/fitable/6.jpg',
      ],
      benefits: [
        'Dodawanie produktów.',
        'Tworzenie i publikowania własnych przepisów z wideo oraz zdjęciami.',
        'System oceniania i dodawania do ulubionych.',
        'Obserwowanie i wyszukiwanie innych użytkowników lub trenerów.',
        'Wyszukiwarka i skaner kodów kreskowych.',
        'Dodawania pomiarów (waga, tkanka tłuszczowa, obwody ciała).',
        'Synchronizacja z Google Fit (waga, kroki, spalone kalorie).',
        'Wyliczenia BMR wraz z personalizacją.',
      ],
      libraries: ['Flutter', 'Dart', 'Riverpod', 'Firestore', 'Storage', 'Authentication', 'Functions', 'Algolia', 'Localization'],
    ),
    Project(
      name: 'ZPRBOX',
      desc: Constants.zprDesc(),
      image: 'resources/images/zpr/zpr.jpg',
      images: [
        'resources/images/zpr/zpr.jpg',
      ],
      benefits: [
        'Pobranie najstarszej wolnej reklamacji.',
        'Dodawanie komentarzy.',
        'Przepięcie na inna osobę lub skill.',
        'Zamawianie rozmów.',
        'Dostęp do potrzebnych raportów.',
        'Dostęp do indywidualnego systemy motywacyjnego.',
        'Panel administracyjny dla kadry z raportami i możliwością dodawania nowych użytkowników, zarządzania reklamacjami oraz uprawnieniami.',
      ],
      libraries: ['USERFORM', 'VBA', 'ODBC', 'SQL', 'PL/SQL'],
    ),
  ];
  final List<String> _tech = ['Flutter 🔥', 'Dart', 'Firebase', 'SQL', 'PL/SQL', 'VBA'];

  _onPressed(BuildContext context, int i) {
    _controller.animateTo(MediaQuery.of(context).size.height * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          CustomTextButton(name: Constants.projects(), onPressed: () => _onPressed(context, 2)),
          CustomTextButton(name: Constants.aboutMe(), onPressed: () => _onPressed(context, 1)),
          CustomTextButton(name: Constants.home(), onPressed: () => _onPressed(context, 0)),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        controller: _controller,
        children: [
          WelcomeScreen(),
          AboutMeScreen(_tech),
          ProjectsScreen(_projects),
        ],
      ),
    );
  }
}
