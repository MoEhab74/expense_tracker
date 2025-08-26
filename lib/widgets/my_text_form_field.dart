import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.onSaved,
    this.obscureText = false,
    this.maxLines = 1,
    this.textAlign,
    this.validator,
    this.keyboardType,
  });

  final IconData? prefixIcon;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final bool obscureText;
  final int maxLines;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: maxLines,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        prefixIcon: Icon(prefixIcon, size: 22),
        prefixIconConstraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        prefixIconColor: Theme.of(context).colorScheme.primary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontStyle: FontStyle.italic,
          fontSize: 14,
        ),
      ),
    );
  }

  
}


