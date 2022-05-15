import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wenlunamoon/utils/download_whitepaper.dart';

import '../../../widgets/widgets.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height - 80,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: SvgPicture.asset(
                'assets/svg/overview.svg',
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .4,
            child: Padding(
              padding: const EdgeInsets.only(right: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Whats the Plan?",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                    ),
                    child: const Text(
                      "Tokenholders will be able to sumbit applications to recover their funds lost on \$LUNA and \$UST, all investors then get to vote about the size and form of the given support. The treasury of the protocol will be used to generate the money used for this.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SingleColorButton(
                    text: 'Whitepaper',
                    onPressed: () {
                      downloadWhitepaper();
                    },
                    color: Colors.black,
                    background: const Color(0xFFedf3f7),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
