import 'package:flutter/material.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/constants.dart';

class Padi4LifeTextFormField extends StatelessWidget {
  const Padi4LifeTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.enable = true,
    this.keyboardType,
    this.obscureText = false,
    this.onEditingComplete,
    this.suffixIcon,
    this.prefixIcon,
    this.onChange,
    this.icon,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool enable, obscureText;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final Widget? suffixIcon, prefixIcon;
  final Function(String)? onChange;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: kPRYCOLOUR),
      borderRadius: BorderRadius.circular(10),
    );
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      validator: validator,
      obscureText: obscureText,
      enabled: enable,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.black.withOpacity(0.05000000074505806),
        hintStyle: kTextStyleCustom(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF818181),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        disabledBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }
}
