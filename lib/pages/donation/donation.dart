import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:routemaster/routemaster.dart';
import 'package:unicons/unicons.dart';

import '../../shared/services/dialog_service.dart';
import '../../shared/shared.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Design.mainColor,
        title: Text(
          Routemaster.of(context).currentRoute.path.substring(1).toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => showContractInfoDialog(context),
            iconSize: 32.0,
            icon: const Icon(
              UniconsLine.info_circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      drawer: const NavigationMenu(),
      body: Center(
        child: ScreenTypeLayout(
          mobile: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10,
            ),
            child: const _DonationContent(),
          ),
          desktop: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600.0,
            ),
            child: const _DonationContent(),
          ),
        ),
      ),
    );
  }
}

class _DonationContent extends HookWidget {
  const _DonationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 600.0),
          child: Text(
            "Donate \$BNB",
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600.0, minWidth: 600.0),
          child: Text(
            "If you want to support the mission, but are not interested in holding \$RJV you can donate something directly to the Treasury & the Team.",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: const Color(0xFF8591B0)),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DoubleTextField(
              controller: controller,
              hint: "1.0",
              label: "BNB Amount",
            ),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600.0),
          child: SingleColorButton(
            text: "Donate",
            onPressed: () {
              //TODO: Donate
            },
            background: Design.mainColor,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
