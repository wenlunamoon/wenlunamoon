import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo.shade900,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: 200.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                launchUrlString("https://twitter.com/wenlunamoon");
              },
              icon: const Icon(UniconsLine.twitter, color: Colors.white),
              iconSize: 42.0,
            ),
            const SizedBox(
              width: 32.0,
            ),
            IconButton(
              onPressed: () {
                launchUrlString('https://github.com/wenlunamoon');
              },
              icon: const Icon(UniconsLine.github, color: Colors.white),
              iconSize: 42.0,
            ),
          ],
        ),
      ),
    );
  }
}
