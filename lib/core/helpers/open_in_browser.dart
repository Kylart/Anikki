import 'package:url_launcher/url_launcher.dart';

void openInBrowser(String? url) {
  if (url == null || url.isEmpty) return;

  launchUrl(Uri.parse(url));
}
