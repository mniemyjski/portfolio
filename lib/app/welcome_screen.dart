import 'package:flutter/material.dart';
import 'package:portfolio/common_widgets/custom_screen.dart';
import 'package:portfolio/common_widgets/icon_button.dart';
import 'package:portfolio/common_widgets/main_image.dart';
import 'package:portfolio/common_widgets/open_url.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio/constants/responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  _desktop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AutoSizeText(
                      'WITAJ NA MOIM PORTFOLIO 🔥',
                      style: TextStyle(fontSize: 46),
                      // textAlign: TextAlign.center,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 46.0, color: Colors.white),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Niemyjski Marcel',
                            textStyle: TextStyle(fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily)),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconButton(icon: FaIcon(FontAwesomeIcons.linkedin), color: Colors.blue[800], onPressed: () => openUrl(Constants.linkedIn())),
                iconButton(icon: FaIcon(FontAwesomeIcons.github), color: Colors.white, onPressed: () => openUrl(Constants.github())),
              ],
            )
          ],
        )),
        Expanded(
            child: Center(
          child: MainImage(),
        )),
      ],
    );
  }

  _mobile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: AutoSizeText(
              'WITAJ NA MOIM PORTFOLIO 🔥',
              style: TextStyle(fontSize: 36),
              textAlign: TextAlign.center,
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 36.0, color: Colors.white),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText('Niemyjski Marcel', textStyle: TextStyle(fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily)),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconButton(icon: FaIcon(FontAwesomeIcons.linkedin), color: Colors.blue[800], onPressed: () => openUrl(Constants.linkedIn())),
            iconButton(icon: FaIcon(FontAwesomeIcons.github), color: Colors.white, onPressed: () => openUrl(Constants.github())),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      child: Center(
        child: Responsive(
          desktop: _desktop(context),
          mobile: _mobile(context),
        ),
      ),
    );
  }
}
