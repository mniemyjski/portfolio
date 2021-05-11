import 'package:flutter/cupertino.dart';

class Project {
  final String name;
  final String desc;
  final String github;
  final String googlePlay;
  final String image;
  final List<String> libraries;

  Project({
    @required this.name,
    @required this.desc,
    @required this.image,
    this.github = '',
    this.googlePlay = '',
    @required this.libraries,
  });
}
