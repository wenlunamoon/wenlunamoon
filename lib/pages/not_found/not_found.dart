import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:unicons/unicons.dart';

import '../../shared/services/dialog_service.dart';
import '../../shared/shared.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Design.mainColor,
        title: Text(
          Routemaster.of(context).currentRoute.path.substring(1).toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => showContractInfoDialog(context),
            iconSize: 32.0,
            icon: const Icon(
              UniconsLine.info_circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      drawer: const NavigationMenu(),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  UniconsLine.file_lanscape_slash,
                  color: Colors.indigo.shade300,
                  size: 400.0,
                ),
                Text(
                  "404",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 150.0,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            Text(
              "This page does not exist!",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
