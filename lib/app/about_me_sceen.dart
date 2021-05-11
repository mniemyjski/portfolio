import 'package:flutter/material.dart';
import 'package:portfolio/common_widgets/custom_screen.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/main_image.dart';
import 'package:portfolio/common_widgets/text_card.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio/utilities/responsive.dart';

class AboutMeScreen extends StatelessWidget {
  final List<String> tech;
  const AboutMeScreen(this.tech, {Key key}) : super(key: key);

  List<Widget> _tech() => tech.map((e) => TextCard(e)).toList();

  _desktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Center(
          child: MainImage(),
        )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AutoSizeText(
                  'O MNIE',
                  style: TextStyle(fontSize: 36),
                )),
            Description(Constants.about()),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(Constants.tech()),
            ),
            Wrap(children: _tech())
          ],
        ))
      ],
    );
  }

  _mobile() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: MainImage(),
          ),
          AutoSizeText(
            'O MNIE',
            style: TextStyle(fontSize: 36),
          ),
          Description(Constants.about()),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(Constants.tech()),
          ),
          Wrap(children: _tech())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      child: Responsive(
        desktop: _desktop(),
        mobile: _mobile(),
      ),
    );
  }
}
