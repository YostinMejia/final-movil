import 'package:chiva_exp/features/auth/provider/auth_notifier_provider.dart';
import 'package:chiva_exp/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              validator: notNullOrEmpty,
              decoration: InputDecoration(label: Text("Name")),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(label: Text("Email")),
              validator: (value) {
                String? notEmpty = notNullOrEmpty(value);
                if (notEmpty != null) return notEmpty;
                String? email = emailValidator(value!);
                return email;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(label: Text("Password")),
              validator: (value) {
                String? notEmpty = notNullOrEmpty(value);
                if (notEmpty != null) return notEmpty;
                String? password = passwordValidator(value!);
                return password;
              },
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(label: Text("Confirm the password")),
              validator: (value) {
                String? notEmpty = notNullOrEmpty(value);
                if (notEmpty != null) return notEmpty;
                String? confirmPassword = confirmPasswordValidator(
                  _passwordController.text,
                  value!,
                );
                return confirmPassword;
              },
            ),

            ElevatedButton(
              onPressed: () {
                //Validates and verify all the form fields
                if (_formKey.currentState!.validate()) {
                  ref.read(authNotifierProvider.notifier).register(_emailController.text, _passwordController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}