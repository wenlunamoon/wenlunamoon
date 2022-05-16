import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wenlunamoon/pages/not_found/not_found.dart';

import '../../pages/pages.dart';

// Base

// App
const _app = '/';
const _home = '/home';
const _presale = '/presale';
const _donation = '/donation';
const _notFound = '/not-found';

abstract class BaseRoutes {}

abstract class AppRoutes {
  static String get base => _app;
  static String get home => _home;
  static String get presale => _presale;
  static String get donation => _donation;
  static String get notFound => _notFound;
}

final Map<String, RouteSettings Function(RouteData)> _appRoutes = {
  AppRoutes.base: (route) => Redirect(AppRoutes.home),
  AppRoutes.home: (route) => const TransitionPage(child: HomePage()),
  AppRoutes.presale: (route) => const TransitionPage(child: PresalePage()),
  AppRoutes.donation: (route) => const TransitionPage(child: DonationPage()),
  AppRoutes.notFound: (route) => const TransitionPage(child: NotFoundPage()),
};

final routes = RouteMap(
  onUnknownRoute: (path) => const Redirect(_notFound),
  routes: {
    ..._appRoutes,
  },
);
