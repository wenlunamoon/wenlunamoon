import 'package:flutter/material.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(colors: [
                      Colors.indigo.shade900,
                      Colors.indigo.shade200,
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                child: const Center(
                  child: Text("WLM",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                onPressed: () {},
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
            ],
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
            children: const <Widget>[
              Text(
                '\$WLM Token:',
              ),
              SizedBox(
                height: 8.0,
              ),
              SelectableText(
                '0x1Cf87CF9e01b4497674570BAA037844A3816B7A9',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Text(
                'MultiSig Treasury:',
              ),
              SizedBox(
                height: 8.0,
              ),
              SelectableText(
                '0xFb08de74D3DC381d2130e8885BdaD4e558b24145',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
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
