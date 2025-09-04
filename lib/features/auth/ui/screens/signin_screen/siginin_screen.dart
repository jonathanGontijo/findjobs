import 'package:findjobs/features/shared/components/components.dart';
import 'package:flutter/material.dart';

class SigininScreen extends StatelessWidget {
  const SigininScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText("te.", fontSize: 120),
              CustomTextFormField(
                label: "E-mail",
                prefixIcon: Icon(Icons.attach_email_outlined),
              ),

              CustomTextFormField(
                label: "Password",
                prefixIcon: Icon(Icons.security_rounded),
              ),
              TextButton(
                onPressed: () {},
                child: CustomText("Forgot Password?"),
              ),
              FilledButton(onPressed: () {}, child: CustomText('Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.label, this.prefixIcon});
  final String label;
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
