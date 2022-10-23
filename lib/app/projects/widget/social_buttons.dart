import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/common_widgets/custom_icon_button.dart';
import 'package:portfolio/common_widgets/open_url.dart';

class SocialButtons extends StatelessWidget {
  final Project project;
  const SocialButtons(this.project, {Key? key}) : super(key: key);

  _onGithubPress() => openUrl(project.github);
  _onGooglePress() => openUrl(project.googlePlay);
  _onWebPress() => openUrl(project.web);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (project.googlePlay.isNotEmpty)
            TextButton(
                onPressed: () => _onGooglePress,
                child: Image.asset(
                  'resources/images/google-play-pl.png',
                  width: 150,
                )),
          if (project.github.isNotEmpty)
            CustomIconButton(
                icon: FaIcon(FontAwesomeIcons.github),
                color: Colors.white,
                onPressed: () => _onGithubPress()),
          if (project.web.isNotEmpty)
            CustomIconButton(
                icon: FaIcon(FontAwesomeIcons.link),
                color: Colors.white,
                onPressed: () => _onWebPress()),
        ],
      ),
    );
  }
}
