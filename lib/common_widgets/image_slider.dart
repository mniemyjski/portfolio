import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:portfolio/app/home/details_screen.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imgList;
  const ImageSlider({this.imgList});

  @override
  _ImageSliderState createState() => _ImageSliderState(imgList);
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imgList;
  _ImageSliderState(this.imgList);

  int _current = 0;
  List<Widget> imageSliders;

  @override
  void initState() {
    imageSliders = imgList
        .map((item) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(item),
                  ),
                );
              },
              child: Container(
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(8),
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
