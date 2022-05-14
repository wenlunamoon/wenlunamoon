import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/widgets.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 80,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: SvgPicture.asset(
                'assets/svg/hero.svg',
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .4,
            child: Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Wen Luna Moon?",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    "\$WLM: A new hope for \$LUNA holders. Combining Memes, DeFi and Charity.",
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFF8591B0),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SingleColorIconButton(
                        text: 'Buy',
                        onPressed: () {
                          Navigator.of(context).pushNamed('/presale');
                        },
                        icon: Icons.monetization_on_outlined,
                        background: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 32.0,
                      ),
                      SingleColorButton(
                        text: 'Donate',
                        onPressed: () {},
                        color: Colors.black,
                        background: const Color(0xFFedf3f7),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
