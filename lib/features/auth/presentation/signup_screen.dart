import 'package:chiva_exp/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("SignUp"),
          SignUpForm(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ya tienes una cuenta? Inicia sesión"),
          ),
        ],
      ),
    );
  }
}
