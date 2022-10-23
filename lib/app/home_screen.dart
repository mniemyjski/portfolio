import 'package:flutter/material.dart';
import 'package:portfolio/app/projects/projects_sceen.dart';
import 'package:portfolio/app/welcome_screen.dart';
import 'package:portfolio/common_widgets/text_button.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:portfolio/utilities/data.dart';

class HomeScreen extends StatelessWidget {
  final _controller = ScrollController();
  _onPressed(BuildContext context, int i) {
    _controller.animateTo(MediaQuery.of(context).size.height * i,
        duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          CustomTextButton(name: Constants.projects(), onPressed: () => _onPressed(context, 1)),
          // CustomTextButton(name: Constants.aboutMe(), onPressed: () => _onPressed(context, 1)),
          CustomTextButton(name: Constants.home(), onPressed: () => _onPressed(context, 0)),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        controller: _controller,
        children: [
          WelcomeScreen(),
          // AboutMeScreen(tech),
          ProjectsScreen(projects),
        ],
      ),
    );
  }
}
