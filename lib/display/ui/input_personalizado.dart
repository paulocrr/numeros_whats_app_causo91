import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPersonalizado extends StatelessWidget {
  const InputPersonalizado({
    super.key,
    required this.label,
    this.autocorrect = true,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.validator,
  });

  final String label;
  final bool autocorrect;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autocorrect: autocorrect,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        label: Text(label),
      ),
    );
  }
}
