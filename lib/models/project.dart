class Project {
  final String name;
  final List<String> images;
  final List<String> libraries;
  final String description;
  final String github;
  final String googlePlay;
  final String web;

  const Project({
    required this.name,
    required this.images,
    required this.libraries,
    required this.description,
    this.github = '',
    this.googlePlay = '',
    this.web = '',
  });
}
