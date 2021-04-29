import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/common_widgets/image_slider.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  _openUrl(String url) {
    return launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  }

  _iconButton({@required Widget icon, @required Color color, @required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        color: color,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

  _headMain(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Container(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  _headSecondary(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 8),
      child: Container(
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          )),
    );
  }

  _desc(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Container(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black87),
          )),
    );
  }

  _project(BuildContext context, String name, String desc) {
    if (MediaQuery.of(context).size.width > 800)
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            _headSecondary(name),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: ImageSlider()),
                Expanded(child: _desc(desc)),
              ],
            ),
            Divider()
          ],
        ),
      );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          _headSecondary(name),
          ImageSlider(),
          _desc(desc),
          Divider(),
        ],
      ),
    );
  }

  _navigationHead() {
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
                    _iconButton(icon: FaIcon(FontAwesomeIcons.linkedin), color: Colors.blue[800], onPressed: () => _openUrl(Constants.linkedIn())),
                    _iconButton(icon: FaIcon(FontAwesomeIcons.githubSquare), color: Colors.black87, onPressed: () => _openUrl(Constants.github())),
                  ],
                ),
                Center(child: Image.asset('resources/images/profile.png')),
              ],
            )),
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    if (kIsWeb) {
      return BoxDecoration(
        image: DecorationImage(
          // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage("resources/images/bg_1.jpg"),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("resources/images/bg_1.jpg"),
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: _boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _navigationHead(),
                    _headMain(Constants.aboutMe()),
                    _desc(Constants.about()),
                    _headMain(Constants.projects()),
                    _project(context, 'Fitable:', Constants.about()),
                    _project(context, 'Zprbox:', Constants.about()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
