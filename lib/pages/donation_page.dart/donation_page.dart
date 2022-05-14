import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wenlunamoon/widgets/footer/footer.dart';

import '../../services/web3_service.dart';
import '../../widgets/widgets.dart';

class DonationPage extends HookConsumerWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final web3Service = ref.watch(Web3Service.instance);
    final controller = useTextEditingController();

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxWidth: 600.0, minWidth: 600.0),
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
                      constraints: const BoxConstraints(
                          maxWidth: 600.0, minWidth: 600.0),
                      child: Text(
                        "If you want to support the Mission, but are not interested in holding \$WLM you can donate something directly to the treasury.",
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
                        child: TextField(
                          controller: controller,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          inputFormatters: [
                            TextInputFormatter.withFunction(
                              (oldValue, newValue) {
                                try {
                                  if (newValue.text.isNotEmpty) {
                                    double.parse(newValue.text);
                                  }
                                  return newValue;
                                } catch (_) {
                                  return oldValue;
                                }
                              },
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: "1.0",
                            labelText: "BNB Amount:",
                            border: OutlineInputBorder(),
                          ),
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
                          try {
                            final value = double.parse(controller.text);
                            final wei = BigInt.from(value * pow(10, 18));
                            web3Service.donate(wei);
                          } catch (exception) {
                            return;
                          }
                        },
                        background: Theme.of(context).primaryColor,
                        color: Colors.white,
                      ),
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
