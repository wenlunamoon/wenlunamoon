import 'package:flutter/material.dart';

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
      body: Center(
        child: Text(ModalRoute.of(context)!.settings.name ?? ""),
      ),
    );
  }
}
