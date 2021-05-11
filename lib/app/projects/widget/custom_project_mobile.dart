import 'package:flutter/material.dart';
import 'package:portfolio/app/details_image_screen.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/common_widgets/custom_icon_button.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/open_url.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/common_widgets/text_card.dart';
import 'package:portfolio/utilities/constants.dart';

class CustomProjectMobile extends StatelessWidget {
  final Project project;
  const CustomProjectMobile(this.project, {Key key}) : super(key: key);

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
                child: SelectableText(
                  project.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.75,
                child: project.image.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: GestureDetector(
                                  child: Image.asset(project.image),
                                  onTap: () => _onImagePress(context),
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
                        ),
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SelectableText(Constants.useLib()),
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
}
