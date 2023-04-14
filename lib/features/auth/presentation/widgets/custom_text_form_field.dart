import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function()? onEditingComplete;

  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.keyboardType,
    required this.textInputAction,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SizedBox(
        width: 500,
        child: TextFormField(
          controller: textEditingController,
          key: key,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            floatingLabelStyle: TextStyle(
              color: Theme.of(context).textTheme.displayLarge!.color,
            ),
            labelText: labelText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
        ),
      ),
    );
  }
}
