import 'package:flutter/material.dart';
import 'package:portfolio/common_widgets/custom_screen.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/main_image.dart';
import 'package:portfolio/common_widgets/text_card.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AboutMeScreen extends StatelessWidget {
  final List<String> tech;
  const AboutMeScreen(this.tech, {Key key}) : super(key: key);

  List<Widget> _tech() => tech.map((e) => TextCard(e)).toList();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }
}
