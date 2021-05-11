import 'package:flutter/material.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/icon_button.dart';
import 'package:portfolio/common_widgets/open_url.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/common_widgets/text_card.dart';
import 'package:portfolio/constants/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomProject extends StatelessWidget {
  final Project project;

  const CustomProject(this.project, {Key key}) : super(key: key);

  List<Widget> _libraries() => project.libraries.map((e) => TextCard(e)).toList();

  _mobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 8, left: 8, top: 8),
                width: double.infinity,
                child: Text(
                  project.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.75,
                child: project.image.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: MediaQuery.of(context).size.width * 0.75, child: Image.asset(project.image)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () => openUrl(project.googlePlay),
                                      child: Image.asset(
                                        'resources/images/google-play-pl.png',
                                        width: 150,
                                      )),
                                  iconButton(icon: FaIcon(FontAwesomeIcons.github), color: Colors.white, onPressed: () => openUrl(project.github)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: Text(Constants.useLib()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Wrap(children: _libraries()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Description(project.desc),
            ),
          ],
        ),
      ),
    );
  }

  _desktop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 8, left: 16),
                width: double.infinity,
                child: Text(
                  project.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: project.image.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(width: MediaQuery.of(context).size.width * 0.75, child: Image.asset(project.image)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () => openUrl(project.googlePlay),
                                        child: Image.asset(
                                          'resources/images/google-play-pl.png',
                                          width: 150,
                                        )),
                                    iconButton(icon: FaIcon(FontAwesomeIcons.github), color: Colors.white, onPressed: () => openUrl(project.github)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Constants.useLib()),
                              Wrap(children: _libraries()),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Description(project.desc),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: _mobile(context), desktop: _desktop(context));
  }
}
