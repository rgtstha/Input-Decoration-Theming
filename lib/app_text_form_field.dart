import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool isPasswordField;

  const AppTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    this.isPasswordField = false,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obsecured = true;

  @override
  Widget build(BuildContext context) {
    IconData? suffixIcon = Icons.visibility;
    if (obsecured) {
      suffixIcon = Icons.visibility_off;
    }
    return TextFormField(
      obscureText: obsecured,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
    );
  }

  void onSuffixIconPressed() {
    setState(() {
      obsecured = !obsecured;
    });
  }
}
