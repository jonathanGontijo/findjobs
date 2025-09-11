import 'package:findjobs/configs/configs.dart';
import 'package:findjobs/features/auth/domain/helpers/helpers.dart';
import 'package:findjobs/features/auth/presentation/providers/authentication_provider.dart';
import 'package:findjobs/features/auth/presentation/ui/helpers/helpers.dart';
import 'package:findjobs/features/shared/components/components.dart';
import 'package:findjobs/features/shared/components/custom_text_form_field.dart';
import 'package:findjobs/features/shared/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final RegisterParams registerParams = RegisterParams(
    name: '',
    email: '',
    phone: '',
    password: '',
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText("te.", fontSize: 90),
                CustomTextFormField(
                  label: "Full Name",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  onSaved: (name) => registerParams.name = name!,
                  validator: validatorGeneral,
                ),
                CustomTextFormField(
                  label: "E-mail",
                  prefixIcon: Icon(Icons.attach_email_outlined),
                  onSaved: (email) => registerParams.email = email!,
                  validator: validateEmail,
                ),
                CustomTextFormField(
                  label: "Phone",
                  prefixIcon: Icon(Icons.phone),
                  onSaved: (phone) => registerParams.phone = phone!,
                  validator: validatorGeneral,
                ),
                CustomTextFormField(
                  label: "Password",
                  prefixIcon: Icon(Icons.security_rounded),
                  onSaved: (password) => registerParams.password = password!,
                  validator: validatePassword,
                ),
                CustomTextFormField(
                  label: "Confirm Password",
                  prefixIcon: Icon(Icons.security_rounded),
                  validator: (confirmPassword) {
                    _formKey.currentState!.save();
                    if (registerParams.password != confirmPassword)
                      return "Passwords do not match";
                    return null;
                  },
                ),

                15.height,
                FilledButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState!.save();

                    ref
                        .read(authenticationProvider.notifier)
                        .register(registerParams);
                  },
                  child:
                      ref.watch(authenticationProvider).value!.isLoading
                          ? CircularProgressIndicator()
                          : CustomText('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
