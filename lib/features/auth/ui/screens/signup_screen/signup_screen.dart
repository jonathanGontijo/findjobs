import 'package:findjobs/features/shared/components/components.dart';
import 'package:findjobs/features/shared/helpers/helpers.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText("te.", fontSize: 90),
              CustomTextFormField(
                label: "Full Name",
                prefixIcon: Icon(Icons.person_2_outlined),
              ),
              CustomTextFormField(
                label: "E-mail",
                prefixIcon: Icon(Icons.attach_email_outlined),
              ),
              CustomTextFormField(
                label: "Phone",
                prefixIcon: Icon(Icons.phone),
              ),
              CustomTextFormField(
                label: "Password",
                prefixIcon: Icon(Icons.security_rounded),
              ),
              CustomTextFormField(
                label: "Confirm Password",
                prefixIcon: Icon(Icons.security_rounded),
              ),

              15.height,
              FilledButton(onPressed: () {}, child: CustomText('Sign Up')),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.label, this.prefixIcon});
  final String? label;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: CustomText(label!),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
