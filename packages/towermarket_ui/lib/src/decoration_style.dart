import 'package:flutter/material.dart';

abstract class DecorationStyle {
  static const borderLine = BoxDecoration(
    border: Border(
      right: BorderSide(
        color: Colors.black12,
        width: 0.5,
      ),
      bottom: BorderSide(
        color: Colors.black12,
        width: 0.5,
      ),
    ),
  );
}
