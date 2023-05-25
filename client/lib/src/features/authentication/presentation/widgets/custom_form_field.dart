import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.obscureText,
  });

  final TextEditingController? controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
