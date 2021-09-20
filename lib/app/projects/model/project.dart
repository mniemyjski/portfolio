import 'package:flutter_markdown/flutter_markdown.dart';

class Project {
  final String name;
  final List<String> images;
  final List<String> libraries;
  final MarkdownBody markdown;
  final String github;
  final String googlePlay;
  final String web;

  Project({
    required this.name,
    required this.images,
    required this.libraries,
    required this.markdown,
    this.github = '',
    this.googlePlay = '',
    this.web = '',
  });
}
