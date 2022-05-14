import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wenlunamoon/services/web3_service.dart';

import '../../widgets/widgets.dart';

class PresalePage extends HookConsumerWidget {
  const PresalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final web3Service = ref.watch(Web3Service.instance);
    final controller = useTextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
        child: const NavigationHeader(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 600.0, minWidth: 600.0),
              child: Text(
                "Buy \$WLM",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 600.0, minWidth: 600.0),
              child: Column(
                children: [
                  const _InfoText(
                    title: "Price",
                    value: "~0.1\$",
                  ),
                  const _InfoText(
                    title: "Remaining",
                    value: "2.987.446/3.000.000",
                  ),
                  const _InfoText(
                    title: "Ends at",
                    value: "01 Jan. 1970 - 00:00 UTC",
                  ),
                  Text(
                    "For a more detailed overview take a look at the Whitepaper",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
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
                text: "Buy",
                onPressed: () {
                  try {
                    final value = double.parse(controller.text);
                    final wei = BigInt.from(value * pow(10, 18));
                    web3Service.buy(wei);
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
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText({required this.value, required this.title});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6?.copyWith(
          color: const Color(0xFF8591B0),
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$title:",
          style: textTheme?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: textTheme,
        ),
      ],
    );
  }
}
