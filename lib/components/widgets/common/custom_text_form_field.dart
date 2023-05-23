import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textFieldController;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.textFieldController,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      // child: Expanded(
      child: TextFormField(
        keyboardType: keyboardType,
        controller: textFieldController,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 20, 0, 20),
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context).textTheme.subtitle1,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }
}
