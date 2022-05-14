import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/footer/footer.dart';
import '../../widgets/widgets.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
        child: const NavigationHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 80),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          UniconsLine.file_lanscape_slash,
                          color: Colors.indigo.shade300,
                          size: 400.0,
                        ),
                        Text(
                          "404",
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 150.0,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "This page does not exist!",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
