import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.maxWidth,
      required this.backgroundOne,
      required this.backgroundTwo,
      this.color = Colors.white})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;

  final Color backgroundOne;
  final Color backgroundTwo;
  final Color color;

  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth ?? 200.0),
      child: InkWell(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              backgroundOne,
              backgroundTwo,
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 8.0),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: onPressed,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
