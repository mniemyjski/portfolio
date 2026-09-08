import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/shared/utils/open_url.dart';
import 'package:portfolio/shared/widgets/icon_link_button.dart';

class ProjectSocialButtons extends StatelessWidget {
  final Project project;

  const ProjectSocialButtons(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (project.googlePlay.isNotEmpty)
            TextButton(
              onPressed: () => openUrl(project.googlePlay),
              child: Image.asset(
                'resources/images/google-play-pl.png',
                width: 150,
              ),
            ),
          if (project.github.isNotEmpty)
            IconLinkButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              color: Colors.white,
              onPressed: () => openUrl(project.github),
            ),
          if (project.web.isNotEmpty)
            IconLinkButton(
              icon: const FaIcon(FontAwesomeIcons.link),
              color: Colors.white,
              onPressed: () => openUrl(project.web),
            ),
        ],
      ),
    );
  }
}
