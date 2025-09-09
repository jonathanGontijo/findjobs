import 'package:findjobs/features/shared/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.onSaved,
    this.validator,
  });
  final String? label;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        label: CustomText(label!),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
