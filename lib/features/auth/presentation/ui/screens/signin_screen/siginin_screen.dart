import 'package:findjobs/features/auth/domain/helpers/helpers.dart';
import 'package:findjobs/features/auth/presentation/providers/authentication_provider.dart';
import 'package:findjobs/features/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/components/custom_text_form_field.dart';
import '../../helpers/helpers.dart';

class SigininScreen extends ConsumerStatefulWidget {
  const SigininScreen({super.key});

  @override
  ConsumerState<SigininScreen> createState() => _SigininScreenState();
}

class _SigininScreenState extends ConsumerState<SigininScreen> {
  final _formKey = GlobalKey<FormState>();

  final loginParams = AuthenticationParams(email: "", secret: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText("te.", fontSize: 120),
                CustomTextFormField(
                  label: "E-mail",
                  prefixIcon: Icon(Icons.attach_email_outlined),
                  onSaved: (email) => loginParams.email = email!,
                  validator: validateEmail,
                ),

                CustomTextFormField(
                  label: "Password",
                  prefixIcon: Icon(Icons.security_rounded),
                  onSaved: (password) => loginParams.secret = password!,
                  validator: validatePassword,
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomText("Forgot Password?"),
                ),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref
                          .read(authenticationProvider.notifier)
                          .login(loginParams);
                    }
                  },
                  child:
                      ref.watch(authenticationProvider).value!.isLoading
                          ? CircularProgressIndicator()
                          : CustomText('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
