import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const RoundedIconButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(icon, size: 20),
    );
  }
}
