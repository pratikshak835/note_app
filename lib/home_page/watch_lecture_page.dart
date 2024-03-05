import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchLecturesPage extends StatefulWidget {
  const WatchLecturesPage({Key? key}) : super(key: key);
  @override
  _WatchLecturesPage createState() => _WatchLecturesPage();
}

class _WatchLecturesPage extends State<WatchLecturesPage> {
  Future<void>? _launched;
  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://youtu.be/l1OZFl45p3c?si=hOF3XJw7KyfPkbS3';
    return Scaffold(
      appBar: AppBar(title: const Text('Watch Lectures')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => setState(() {
            _launched = _launchInBrowser(toLaunch);
          }),
          child: const Text('Launch in browser'),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
}
