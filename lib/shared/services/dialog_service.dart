import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../shared.dart';

showContractInfoDialog(BuildContext context) {
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
                  child: Text("Show on DeBank",
                      style: TextStyle(color: Design.mainColor))),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Close',
              style: TextStyle(
                color: Design.mainColor,
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
