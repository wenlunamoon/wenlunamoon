import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wenlunamoon/services/web3_service.dart';
import 'package:wenlunamoon/utils/download_whitepaper.dart';
import 'package:wenlunamoon/widgets/widgets.dart';

class NavigationHeader extends ConsumerWidget {
  const NavigationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 65.0),
                child: Image.asset(
                  'assets/png/logo.png',
                  scale: 0.125,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Wen Luna Moon?",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              )
            ],
          ),
          if (MediaQuery.of(context).size.width >= 1200.0)
            Row(
              children: [
                _NavigationItem(
                  text: 'Home',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                ),
                _NavigationItem(
                  text: 'Presale',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/presale');
                  },
                ),
                _NavigationItem(
                  text: 'Donate',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/donate');
                  },
                ),
                _NavigationItem(
                  text: 'Whitepaper',
                  onPressed: () {
                    downloadWhitepaper();
                  },
                ),
                const SizedBox(
                  width: 16.0,
                ),
                IconButton(
                  onPressed: () => _showInfoDialog(context),
                  icon: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  iconSize: 32.0,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                const Web3Button(),
              ],
            ),
        ],
      ),
    );
  }
}

class NavigationHeaderMobile extends StatelessWidget {
  const NavigationHeaderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _showInfoDialog(context),
                icon: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                ),
                iconSize: 32.0,
              ),
              const Web3Button(),
            ],
          ),
          _NavigationItem(
            text: 'Home',
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          _NavigationItem(
            text: 'Presale',
            onPressed: () {
              Navigator.of(context).pushNamed('/presale');
            },
          ),
          _NavigationItem(
            text: 'Donate',
            onPressed: () {
              Navigator.of(context).pushNamed('/donate');
            },
          ),
          _NavigationItem(
            text: 'Whitepaper',
            onPressed: () {
              downloadWhitepaper();
            },
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Future<void> _showInfoDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Important Addresses'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text(
                '\$WLM Token:',
              ),
              const SizedBox(
                height: 8.0,
              ),
              const SelectableText(
                '0x1Cf87CF9e01b4497674570BAA037844A3816B7A9',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                'MultiSig Treasury:',
              ),
              const SizedBox(
                height: 8.0,
              ),
              const SelectableText(
                '0xFb08de74D3DC381d2130e8885BdaD4e558b24145',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextButton(
                  onPressed: () {
                    launchUrlString(
                        "https://debank.com/profile/0xfb08de74d3dc381d2130e8885bdad4e558b24145");
                  },
                  child: const Text("Show on DeBank",
                      style: TextStyle(color: Colors.indigo))),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Close',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
