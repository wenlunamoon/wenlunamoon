import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import '../../shared.dart';

class DoubleTextField extends StatelessWidget {
  const DoubleTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.label})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Design.mainColorDark,
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
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Design.mainColorDark),
        ),
        focusColor: Design.mainColorDark,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
