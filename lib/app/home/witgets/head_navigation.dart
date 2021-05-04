import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/common_widgets/icon_button.dart';
import 'package:portfolio/common_widgets/massage_flush_bar.dart';
import 'package:portfolio/common_widgets/open_url.dart';
import 'package:portfolio/common_widgets/text_button.dart';
import 'package:portfolio/constants/constants.dart';

navigationHead(BuildContext context) {
  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
            // color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: AssetImage("resources/images/bg_5.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: textButton(
                        onPressed: () {
                          massageFlushBar(context, 'Kiedyś tu będzie blog :)');
                        },
                        name: Constants.blog()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      iconButton(icon: FaIcon(FontAwesomeIcons.linkedin), color: Colors.blue[800], onPressed: () => openUrl(Constants.linkedIn())),
                      iconButton(icon: FaIcon(FontAwesomeIcons.githubSquare), color: Colors.black87, onPressed: () => openUrl(Constants.github())),
                    ],
                  )
                ],
              ),
              Stack(
                children: [
                  Center(child: Image.asset('resources/images/profile_1.png')),
                ],
              )
            ],
          )),
    ],
  );
}
