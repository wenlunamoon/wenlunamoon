import 'package:flutter/material.dart';

import '../../shared.dart';
import 'navigation_menu_connect_button.dart';
import 'navigation_menu_header.dart';
import 'navigation_menu_item_list.dart';
import 'navigation_menu_quick_link_list.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Design.mainColorDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const NavigationMenuHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    NavigationMenuConnectButton(),
                    Divider(),
                    NavigationMenuItemList(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Divider(),
                NavigationMenuQuickLinkList(),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
