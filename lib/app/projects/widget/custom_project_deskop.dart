import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/app/details_image_screen.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/common_widgets/custom_icon_button.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/open_url.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/common_widgets/text_card.dart';
import 'package:portfolio/utilities/constants.dart';

class CustomProjectDesktop extends StatelessWidget {
  final Project project;
  const CustomProjectDesktop(this.project, {Key key}) : super(key: key);

  _onGithubPress() => openUrl(project.github);
  _onGooglePress() => openUrl(project.googlePlay);

  _onImagePress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsImageScreen(project.images)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _libraries() => project.libraries.map((e) => TextCard(e)).toList();
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
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      child: Image.asset(project.image),
                                      onTap: () => _onImagePress(context),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () => _onGooglePress,
                                        child: Image.asset(
                                          'resources/images/google-play-pl.png',
                                          width: 150,
                                        )),
                                    CustomIconButton(icon: FaIcon(FontAwesomeIcons.github), color: Colors.white, onPressed: () => _onGithubPress()),
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
                              SelectableText(Constants.useLib()),
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
}
