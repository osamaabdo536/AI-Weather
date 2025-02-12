import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final bool isObscure;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.icon,
    this.isObscure = false,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.transparent,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 19,
        ),
        errorStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white, // Error border color
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white, // Focused error border color
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(fontSize: 24),
      keyboardType: keyBoardType,
      obscureText: isObscure,
      validator: validator,
      controller: controller,
      autofocus: false,
    );
  }
}
