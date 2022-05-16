import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

import '../../services/web3/web3_wallet.dart';
import '../../shared.dart';

class NavigationMenuHeader extends ConsumerWidget {
  const NavigationMenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final web3Service = ref.watch(Web3Wallet.instance);
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Design.mainColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000.0),
                child: Material(
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: web3Service.isConnected()
                      ? FutureBuilder<String>(
                          future: web3Service.currentAddress(),
                          builder: (context, snapshot) => SvgPicture.string(
                            Jdenticon.toSvg(snapshot.data ?? ""),
                            fit: BoxFit.cover,
                            width: 64.0,
                            height: 64.0,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: 64.0,
                          color: Design.mainColorDark,
                        ),
                ),
              ),
            ],
          ),
          Center(
            child: FutureBuilder<String>(
              future: web3Service.currentAddress(),
              builder: (context, snapshot) {
                String text = "Not Connected!";
                if (web3Service.isConnected() && snapshot.hasData) {
                  text = snapshot.data ?? text;
                }
                return Text(
                  text,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
