import 'package:flutter/material.dart';

class SingleColorIconButton extends StatelessWidget {
  const SingleColorIconButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.maxWidth,
      required this.background,
      this.color = Colors.white})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  final Color background;
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
              background,
              background,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: color,
                        fontSize: 14.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    if (icon != null)
                      Icon(
                        icon,
                        color: color,
                        size: 12.0,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
