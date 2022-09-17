import 'package:flutter/material.dart';

extension NavigationExt on BuildContext {
  void open(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => widget
      )
    );
  }
}