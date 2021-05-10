import 'package:flutter/material.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/app/projects/widget/custom_project.dart';
import 'package:portfolio/common_widgets/custom_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectsScreen extends StatefulWidget {
  final List<Project> projects;

  const ProjectsScreen(this.projects, {Key key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _project() => widget.projects.map((e) => CustomProject(e)).toList();
    List<Widget> _circle() => widget.projects
        .map((e) => Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == widget.projects.indexOf(e) ? Colors.red[800] : Colors.grey,
              ),
            ))
        .toList();

    return CustomScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              items: _project(),
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) => setState(() => current = index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _circle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
