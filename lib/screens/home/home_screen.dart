import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/screens/projects/projects_screen.dart';
import 'package:portfolio/screens/welcome/welcome_screen.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/widgets/nav_text_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _scrollController = ScrollController();

  void _scrollToSection(BuildContext context, int index) {
    _scrollController.animateTo(
      MediaQuery.of(context).size.height * index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          NavTextButton(
            label: AppLabels.projects,
            onPressed: () => _scrollToSection(context, 1),
          ),
          NavTextButton(
            label: AppLabels.home,
            onPressed: () => _scrollToSection(context, 0),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          const WelcomeScreen(),
          ProjectsScreen(projects),
        ],
      ),
    );
  }
}
