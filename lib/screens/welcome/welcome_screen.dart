import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/config/app_links.dart';
import 'package:portfolio/shared/layout/page_section.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/utils/open_url.dart';
import 'package:portfolio/shared/widgets/icon_link_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Widget _desktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _welcomeContent(context, titleFontSize: 46)),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _welcomeContent(context, titleFontSize: 36, centerTitle: true),
      ],
    );
  }

  Widget _welcomeContent(
    BuildContext context, {
    required double titleFontSize,
    bool centerTitle = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AutoSizeText(
            AppLabels.welcomeTitle,
            style: TextStyle(fontSize: titleFontSize),
            textAlign: centerTitle ? TextAlign.center : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: titleFontSize, color: Colors.white),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(AppLabels.ownerName),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconLinkButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              color: Colors.blue[800],
              onPressed: () => openUrl(AppLinks.linkedIn),
            ),
            IconLinkButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              color: Colors.white,
              onPressed: () => openUrl(AppLinks.github),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageSection(
      child: Center(
        child: ResponsiveLayout(
          desktop: _desktopLayout(context),
          mobile: _mobileLayout(context),
        ),
      ),
    );
  }
}
