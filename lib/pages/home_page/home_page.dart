import 'package:flutter/material.dart';
import 'package:wenlunamoon/widgets/footer/footer.dart';

import '../../widgets/widgets.dart';
import 'sections/hero_section.dart';
import 'sections/overview_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1200.0;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: const NavigationHeader(),
            )
          : PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
              child: const NavigationHeader(),
            ),
      drawer: const NavigationHeaderMobile(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            OverviewSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
