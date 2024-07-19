import 'package:e_commerce/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class NoBorderFormFiled extends StatefulWidget {
  const NoBorderFormFiled({
    super.key,
    required this.controller,
    required this.inputType,
    required this.fieldLabel,
    required this.icon,
    required this.validate,
    this.isEnabled = true,
    this.obSecure = false,
    this.suffixIcon,
    this.initialValue,
    this.maxLines,
    this.labelColor = AppColors.lightGrey,
    this.iconColor = AppColors.lightGrey,
    this.textFieldTextColor = Colors.black,
    this.onChanged,
    this.cursorColor = Colors.deepPurple,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final String? fieldLabel;
  final Icon? icon;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final bool obSecure;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool isEnabled;
  final String? initialValue;
  final Color labelColor;
  final Color iconColor;
  final Color textFieldTextColor;
  final Color cursorColor;

  @override
  State<NoBorderFormFiled> createState() => _NoBorderFormFiledState();
}

class _NoBorderFormFiledState extends State<NoBorderFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      style: TextStyle(color: widget.textFieldTextColor),
      decoration: InputDecoration(
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(color: widget.labelColor),
        prefixIcon: widget.icon,
        suffixIcon: widget.suffixIcon,
        iconColor: widget.iconColor,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      maxLines: widget.maxLines,
      cursorColor: Colors.black,
      initialValue: widget.initialValue,
      enabled: widget.isEnabled,
      obscureText: widget.obSecure,
      onChanged: widget.onChanged,
      validator: widget.validate,
    );
  }
}
