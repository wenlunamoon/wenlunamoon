import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wenlunamoon/services/web3_service.dart';

import 'buttons.dart';

class Web3Button extends ConsumerWidget {
  const Web3Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final web3Service = ref.watch(Web3Service.instance);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Builder(
        builder: (context) {
          if (!web3Service.isEnabled) {
            return SingleColorButton(
              text: "No Wallet Provider Found!",
              color: Colors.white,
              background: Theme.of(context).errorColor,
              onPressed: () {},
              maxWidth: 300.0,
            );
          }

          if (!web3Service.isInOperatingChain) {
            return SingleColorButton(
              text: "Wrong Network!",
              color: Colors.white,
              background: Theme.of(context).errorColor,
              onPressed: () {},
              maxWidth: 300.0,
            );
          }

          if (web3Service.isConnected) {
            return SingleColorIconButton(
              text: "Disconnect",
              color: Colors.white,
              background: Colors.indigo.shade400,
              icon: Icons.logout,
              onPressed: () => web3Service.clear(),
              maxWidth: 300.0,
            );
          }

          return SingleColorIconButton(
            text: "Connect",
            color: Colors.white,
            background: Colors.indigo.shade800,
            icon: Icons.account_balance_wallet_outlined,
            onPressed: () => web3Service.connect(),
            maxWidth: 300.0,
          );
        },
      ),
    );
  }
}
