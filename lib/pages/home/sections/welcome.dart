import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../shared/shared.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height - AppBar().preferredSize.height,
      child: ScreenTypeLayout(
        mobile: const Center(
          child: _WelcomeTextContent(),
        ),
        desktop: Row(
          children: const [
            Flexible(
              flex: 1,
              child: _WelcomeTextContent(),
            ),
            Flexible(
              flex: 1,
              child: _WelcomeImageContent(),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeTextContent extends StatelessWidget {
  const _WelcomeTextContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Language.title,
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Text(
            "[TEXT GOES HERE]",
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF8591B0),
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 40,
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleColorIconButton(
                  text: 'Buy',
                  onPressed: () {
                    //TODO: navigate to presale
                  },
                  icon: Icons.monetization_on_outlined,
                  background: Design.mainColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleColorButton(
                  text: 'Donate',
                  onPressed: () {
                    //TODO: naviate to Donate
                  },
                  color: Colors.black,
                  background: const Color(0xFFedf3f7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WelcomeImageContent extends StatelessWidget {
  const _WelcomeImageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: SvgPicture.asset(
        'assets/svg/welcome.svg',
      ),
    );
  }
}
