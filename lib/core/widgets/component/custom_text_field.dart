import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPasswordField;

  CustomTextField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPasswordField = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.white),
        prefixIcon: Icon(widget.prefixIcon, color: AppColors.white),
        filled: true,
        fillColor: AppColors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.white),
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: AppColors.white,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
      style: TextStyle(color: AppColors.white),
    );
  }
}