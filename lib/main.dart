import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'shared/shared.dart';
import 'package:flutter/material.dart';

import 'core/core.dart';

void main() {
  setupLogger();
  runApp(const ProviderScope(child: DeFiPool()));
}

class DeFiPool extends StatelessWidget {
  const DeFiPool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: Language.title,
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: const RoutemasterParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
