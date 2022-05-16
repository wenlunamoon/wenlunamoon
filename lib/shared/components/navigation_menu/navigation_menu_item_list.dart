import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/navigation/routes.dart';
import 'navigation_menu_item.dart';

class NavigationMenuItemList extends StatelessWidget {
  const NavigationMenuItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationMenuItem(
          icon: UniconsLine.home,
          route: AppRoutes.home,
          title: 'Home',
        ),
        NavigationMenuItem(
          icon: UniconsLine.hourglass,
          route: AppRoutes.presale,
          title: 'Presale',
        ),
        NavigationMenuItem(
          icon: UniconsLine.usd_circle,
          route: AppRoutes.donation,
          title: 'Donate',
        ),
      ],
    );
  }
}
