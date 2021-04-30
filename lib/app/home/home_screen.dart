import 'package:flutter/material.dart';
import 'package:portfolio/app/home/witgets/head_navigation.dart';
import 'package:portfolio/app/home/witgets/project.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/title_main.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:portfolio/app/home/witgets/lib_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  BoxDecoration _boxDecoration() {
    if (kIsWeb) {
      return BoxDecoration(
        image: DecorationImage(
          // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage("resources/images/bg_1.jpg"),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("resources/images/bg_1.jpg"),
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: _boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    navigationHead(),
                    titleMain(Constants.aboutMe()),
                    description(Constants.about()),
                    titleMain(Constants.projects()),
                    project(
                      context: context,
                      name: 'Fitable:',
                      desc: Constants.about(),
                      widgets: [
                        libCard('Flutter'),
                        libCard('Riverpod'),
                        libCard('Firestore'),
                        libCard('Storage'),
                        libCard('Authentication'),
                        libCard('Functions'),
                        libCard('Algolia'),
                        libCard('Authentication'),
                      ],
                      photos: [
                        'resources/images/fitable/1.jpg',
                        'resources/images/fitable/2.jpg',
                        'resources/images/fitable/3.jpg',
                        'resources/images/fitable/4.jpg',
                      ],
                    ),
                    project(
                      context: context,
                      name: 'ZPR - Reklamacje:',
                      desc: Constants.about(),
                      widgets: [
                        libCard('Userform'),
                        libCard('ODBC'),
                        libCard('SQL'),
                        libCard('PL/SQL'),
                      ],
                      photos: [
                        'resources/images/zpr/1.jpg',
                        'resources/images/zpr/2.jpg',
                        'resources/images/zpr/3.jpg',
                        'resources/images/zpr/4.jpg',
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
