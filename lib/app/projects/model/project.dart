import 'package:flutter/cupertino.dart';

class Project {
  final String name;
  final String desc;
  final String image;
  final List<String> libraries;

  Project({
    @required this.name,
    @required this.desc,
    @required this.image,
    @required this.libraries,
  });
}
