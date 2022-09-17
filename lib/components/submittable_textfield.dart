import 'package:flutter/material.dart';

class SubmittableTextField extends StatelessWidget {
  final String label;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;

  const SubmittableTextField({
    Key? key,
    required this.label,
    required this.onSubmitted,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label
      ),
    );
  }
}