import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String name;
  final Color color;
  final double size;
  final VoidCallback onPressed;

  const CustomImageButton({
    Key key,
    this.name,
    this.color,
    this.size,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        name,
        width: size ?? 20,
        color: color ?? Theme.of(context).appBarTheme?.actionsIconTheme?.color,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }
}
