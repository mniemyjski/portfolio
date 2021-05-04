import 'package:flutter/material.dart';
import 'package:portfolio/common_widgets/description.dart';
import 'package:portfolio/common_widgets/image_slider.dart';
import 'package:portfolio/common_widgets/title_secondary.dart';
import 'package:portfolio/constants/constants.dart';

project({
  @required BuildContext context,
  @required String name,
  @required String desc,
  @required List<Widget> widgets,
  @required List<String> photos,
}) {
  if (MediaQuery.of(context).size.width > 800)
    return Column(
      children: [
        titleSecondary(name),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ImageSlider(
                imgList: photos,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(Constants.useLib()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Wrap(children: widgets),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: description(desc),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider()
      ],
    );

  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSecondary(name),
        ImageSlider(
          imgList: photos,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Text(Constants.useLib()),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Wrap(children: widgets),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: description(desc),
        ),
        Divider(),
      ],
    ),
  );
}
