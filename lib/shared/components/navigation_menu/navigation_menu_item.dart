import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class NavigationMenuItem extends StatelessWidget {
  const NavigationMenuItem({
    Key? key,
    required this.icon,
    required this.route,
    this.title,
  }) : super(key: key);

  final IconData icon;
  final String route;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onPrimary;
    final isSelected = Routemaster.of(context).currentRoute.fullPath == route;
    final routeTitle =
        '${route.substring(1).characters.first.toUpperCase()}${route.substring(2)}';

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
        color: isSelected ? color.withOpacity(0.24) : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title ?? routeTitle,
          style: TextStyle(
            color: color,
          ),
        ),
        onTap: () => Routemaster.of(context).push(route),
      ),
    );
  }
}
