import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NavigationMenuQuickLink extends StatelessWidget {
  const NavigationMenuQuickLink({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => launchUrlString(url),
      iconSize: 32.0,
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      hoverColor: Colors.transparent,
    );
  }
}
