import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/common_widgets/icon_button.dart';
import 'package:portfolio/common_widgets/open_url.dart';
import 'package:portfolio/constants/constants.dart';

navigationHead() {
  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage("resources/images/bg_2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  iconButton(icon: FaIcon(FontAwesomeIcons.linkedin), color: Colors.blue[800], onPressed: () => openUrl(Constants.linkedIn())),
                  iconButton(icon: FaIcon(FontAwesomeIcons.githubSquare), color: Colors.black87, onPressed: () => openUrl(Constants.github())),
                  // _textButton(onPressed: () {}, name: Constants.blog()),
                ],
              ),
              Center(child: Image.asset('resources/images/profile.png')),
            ],
          )),
    ],
  );
}
