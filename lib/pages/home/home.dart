import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:unicons/unicons.dart';
import '../../shared/services/dialog_service.dart';
import 'sections/roadmap.dart';
import 'sections/welcome.dart';
import '../../../../shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: const [
            WelcomeSection(),
            RoadmapSection(),
          ],
        ),
      ),
    );
  }
}
