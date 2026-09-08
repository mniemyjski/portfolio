String projectDescriptionPreview(String markdown) {
  final plainText = markdown
      .replaceAll(RegExp(r'\*\*([^*]+)\*\*'), r'$1')
      .replaceAll(RegExp(r'^\* ', multiLine: true), '')
      .trim();

  final firstParagraph = plainText.split('\n\n').first;
  return firstParagraph.replaceAll('\n', ' ').trim();
}
