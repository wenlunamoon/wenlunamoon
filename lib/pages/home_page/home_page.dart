import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'sections/hero_section.dart';
import 'sections/overview_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
        child: const NavigationHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            OverviewSection(),
          ],
        ),
      ),
    );
  }
}
