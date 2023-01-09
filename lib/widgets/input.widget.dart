import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.controller,
      this.placeHolder,
      this.suffixIcon,
      this.oscureText,
      this.validate});

  final TextEditingController controller;
  final String? placeHolder;
  final Widget? suffixIcon;
  final bool? oscureText;
  final String? Function(String?)? validate;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
