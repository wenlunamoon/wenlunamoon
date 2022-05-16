import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../shared/shared.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Design.mainColorDark.withOpacity(0.1),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
        ),
        child: ScreenTypeLayout(
          mobile: const Center(
            child: _RoadmapTextContent(),
          ),
          desktop: Row(
            children: const [
              Flexible(
                flex: 1,
                child: _RoadmapImageContent(),
              ),
              Flexible(
                flex: 1,
                child: _RoadmapTextContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoadmapTextContent extends StatelessWidget {
  const _RoadmapTextContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
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
          const Text(
            "[TEXT GOES HERE]",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SingleColorButton(
            text: 'Whitepaper',
            onPressed: () {
              launchUrlString("https://gitbook.com");
            },
            color: Colors.black,
            background: const Color(0xFFedf3f7),
          ),
        ],
      ),
    );
  }
}

class _RoadmapImageContent extends StatelessWidget {
  const _RoadmapImageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: SvgPicture.asset(
        'assets/svg/roadmap.svg',
      ),
    );
  }
}
