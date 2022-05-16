import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'navigation_menu_quick_link.dart';

class NavigationMenuQuickLinkList extends StatelessWidget {
  const NavigationMenuQuickLinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const [
        NavigationMenuQuickLink(
          icon: UniconsLine.document_info,
          url: 'https://www.gitbook.com/',
        ),
        NavigationMenuQuickLink(
          icon: UniconsLine.discord,
          url: 'https://discord.gg/4XHn47Jw',
        ),
        NavigationMenuQuickLink(
          icon: UniconsLine.github,
          url: 'https://github.com/wenlunamoon',
        ),
      ],
    );
  }
}
