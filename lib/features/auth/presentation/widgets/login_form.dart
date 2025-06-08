import 'package:chiva_exp/features/auth/provider/auth_notifier_provider.dart';
import 'package:chiva_exp/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(),
                label: Text("Email", style: TextStyle(fontSize: 30)),
              ),
              controller: _emailController,
              validator: (value) {
                String? notEmpty = notNullOrEmpty(value);
                if (notEmpty != null) return notEmpty;
                String? email = emailValidator(value!);
                return email;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(),
                label: Text("Password", style: TextStyle(fontSize: 30)),
              ),
              controller: _passwordController,
              validator: notNullOrEmpty,
            ),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(authNotifierProvider.notifier).login(_emailController.text, _passwordController.text);
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}