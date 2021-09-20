import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/app/projects/widget/custom_project.dart';
import 'package:portfolio/common_widgets/custom_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectsScreen extends StatefulWidget {
  final List<Project> projects;

  const ProjectsScreen(this.projects, {Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    List<Widget> _project() => widget.projects.map((e) => CustomProject(e)).toList();

    return CustomScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 585),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (_, index) {
                    return _project()[index % _project().length];
                  },
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: _project().length,
              effect: JumpingDotEffect(
                dotHeight: 16,
                dotWidth: 16,
                jumpScale: .7,
                verticalOffset: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
