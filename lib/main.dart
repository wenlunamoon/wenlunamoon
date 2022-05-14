import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wenlunamoon/services/web3_service.dart';

import 'pages/pages.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initServices(ref);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wen Luna Moon?',
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }

  void initServices(WidgetRef ref) {
    ref.read(Web3Service.instance).initialize();
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return createRoute(const HomePage(), settings);
      case '/presale':
        return createRoute(const PresalePage(), settings);
      case '/donate':
        return createRoute(const DonationPage(), settings);
    }
    return createRoute(const NotFoundPage(), settings);
  }

  Route<dynamic> createRoute(Widget child, RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      settings: settings,
    );
  }
}
