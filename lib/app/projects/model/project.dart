import 'package:flutter/cupertino.dart';

class Project {
  final String name;
  final String desc;
  final String desc2;
  final String github;
  final String googlePlay;
  final String image;
  final List<String> images;
  final List<String> libraries;
  final List<String> benefits;

  Project({
    @required this.name,
    @required this.desc,
    this.desc2 = '',
    @required this.image,
    this.github = '',
    this.googlePlay = '',
    this.images,
    @required this.libraries,
    @required this.benefits,
  });
}
