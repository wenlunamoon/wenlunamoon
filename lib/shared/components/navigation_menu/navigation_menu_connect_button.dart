import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wenlunamoon/shared/services/web3/web3_modal.dart';

import '../../services/web3/web3_wallet.dart';
import '../../shared.dart';

class NavigationMenuConnectButton extends ConsumerWidget {
  const NavigationMenuConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final web3Service = ref.watch(Web3Wallet.instance);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Builder(
        builder: (context) {
          if (!web3Service.isEnabled()) {
            return SingleColorButton(
              text: "No Wallet Provider Found!",
              color: Colors.white,
              background: Design.erroColor,
              onPressed: () {},
              maxWidth: 300.0,
            );
          }

          //TODO: Future builder
          // if (!web3Service.isInOperatingChain()) {
          //   return SingleColorButton(
          //     text: "Wrong Network!",
          //     color: Colors.white,
          //     background: Design.erroColor,
          //     onPressed: () {},
          //     maxWidth: 300.0,
          //   );
          // }

          if (web3Service.isConnected()) {
            return SingleColorIconButton(
              text: "Disconnect",
              color: Colors.white,
              background: Design.erroColor,
              icon: Icons.logout,
              onPressed: () => web3Service.disconnect(),
              maxWidth: 300.0,
            );
          }

          return SingleColorIconButton(
            text: "Connect",
            color: Design.mainColorDark,
            background: Colors.white,
            icon: Icons.account_balance_wallet_outlined,
            onPressed: () => showWeb3Modal(context),
            maxWidth: 300.0,
          );
        },
      ),
    );
  }
}
