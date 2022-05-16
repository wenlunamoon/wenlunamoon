import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';
import 'package:wenlunamoon/shared/components/buttons/buttons.dart';
import 'package:wenlunamoon/shared/services/web3/web3_wallet.dart';

void showWeb3Modal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        content: _Web3ModalContent(),
      );
    },
  );
}

class _Web3ModalContent extends ConsumerWidget {
  const _Web3ModalContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleColorIconButton(
            icon: UniconsLine.wallet,
            text: "MetaMask",
            onPressed: () {
              Web3Wallet.useWalletConnect = false;
              ref.read(Web3Wallet.instance).connect();
              Navigator.of(context).pop();
            },
            color: Colors.white,
            background: Colors.orange.shade500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleColorIconButton(
            icon: UniconsLine.wallet,
            text: "WalletConnect",
            onPressed: () {
              Web3Wallet.useWalletConnect = true;
              ref.read(Web3Wallet.instance).connect();
              Navigator.of(context).pop();
            },
            color: Colors.white,
            background: Colors.blue.shade800,
          ),
        ),
      ],
    );
  }
}
