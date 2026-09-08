import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) {
  return launchUrl(Uri.parse(url));
}
