import 'package:flutter/material.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/screens/projects/projects_screen.dart';
import 'package:portfolio/screens/welcome/welcome_screen.dart';
import 'package:portfolio/shared/widgets/portfolio_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  void _scrollToSection(int index) {
    if (!_scrollController.hasClients) {
      return;
    }

    _scrollController.animateTo(
      _scrollController.position.viewportDimension * index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PortfolioNavBar(
        onHomePressed: () => _scrollToSection(0),
        onProjectsPressed: () => _scrollToSection(1),
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
