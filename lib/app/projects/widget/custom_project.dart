import 'package:flutter/material.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/common_widgets/text_card.dart';

class CustomProject extends StatelessWidget {
  final Project project;

  const CustomProject(this.project, {Key key}) : super(key: key);

  List<Widget> _libraries() => project.libraries.map((e) => TextCard(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.black12,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              width: double.infinity,
              child: Text(
                project.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: project.image.isNotEmpty ? Image.asset(project.image) : Container(),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Constants.useLib()),
                            Wrap(children: _libraries()),
                            Description(project.desc),
                          ],
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
