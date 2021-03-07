import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback onPressed;

  const CustomCloseButton({
    Key key,
    this.color,
    this.size,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        'assets/images/ic_menu_close.png',
        width: size ?? 20,
        color: color ?? Theme.of(context).appBarTheme?.actionsIconTheme?.color,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
          return;
        }
        Navigator.maybePop(context);
      },
    );
  }
}
