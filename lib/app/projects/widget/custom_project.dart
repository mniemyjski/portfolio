import 'package:flutter/material.dart';
import 'package:portfolio/app/image_screen.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/app/projects/widget/social_buttons.dart';
import 'package:portfolio/common_widgets/text_card.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:portfolio/utilities/responsive.dart';

class CustomProject extends StatelessWidget {
  final Project project;
  const CustomProject(this.project, {Key? key}) : super(key: key);

  _onImagePress(BuildContext context) {
    if (project.images.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImageScreen(project.images)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _libraries() => project.libraries.map((e) => TextCard(e)).toList();

    Padding _buildMobile() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: project.images.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: GestureDetector(
                                  child: Image.asset(project.images.first),
                                  onTap: () => _onImagePress(context),
                                )),
                            SocialButtons(project),
                          ],
                        ),
                      )
                    : Container(),
              ),
            ),
            SelectableText(
              Constants.useLib(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Wrap(children: _libraries()),
            ),
            project.markdown,
            SizedBox(height: 8),
          ],
        ),
      );
    }

    Row _buildDesktop() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: project.images.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.70,
                            height: 415,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: Image.asset(project.images.first),
                                onTap: () => _onImagePress(context),
                              ),
                            )),
                        SocialButtons(project),
                      ],
                    ),
                  )
                : Container(),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        Constants.useLib(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Wrap(children: _libraries()),
                      ),
                      project.markdown,
                      SizedBox(height: 8),
                    ],
                  ))),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 8, left: 8),
                width: double.infinity,
                child: Text(
                  project.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            Responsive(
              mobile: _buildMobile(),
              desktop: _buildDesktop(),
            ),
          ],
        ),
      ),
    );
  }
}
