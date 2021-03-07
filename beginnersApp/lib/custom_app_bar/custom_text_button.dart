import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomTextButton({
    Key key,
    this.text,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color:
              color ?? Theme.of(context).appBarTheme?.actionsIconTheme?.color,
        ),
        maxLines: 1,
      ),
      iconSize: 40,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }
}
