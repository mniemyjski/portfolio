import 'package:flutter/material.dart';
import 'package:portfolio/app/projects/model/project.dart';
import 'package:portfolio/app/projects/widget/custom_project_deskop.dart';
import 'package:portfolio/app/projects/widget/custom_project_mobile.dart';
import 'package:portfolio/common_widgets/custom_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/utilities/responsive.dart';

class DetailsImageScreen extends StatefulWidget {
  final List<String> images;

  const DetailsImageScreen(this.images, {Key key}) : super(key: key);

  @override
  _DetailsImageScreenState createState() => _DetailsImageScreenState();
}

_onBackPress(BuildContext context) => Navigator.pop(context);

class _DetailsImageScreenState extends State<DetailsImageScreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = widget.images.map((e) => Image.asset(e)).toList();

    List<Widget> _circle() => widget.images
        .map((e) => Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == widget.images.indexOf(e) ? Colors.red[800] : Colors.grey,
              ),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _onBackPress(context),
              child: CarouselSlider(
                items: _items,
                options: CarouselOptions(
                  aspectRatio: 9 / 16,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) => setState(() => current = index),
                ),
              ),
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
    );
  }
}
