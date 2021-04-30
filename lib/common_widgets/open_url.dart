import 'package:url_launcher/url_launcher.dart';

openUrl(String url) {
  return launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
  );
}
