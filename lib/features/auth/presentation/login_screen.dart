import 'package:chiva_exp/features/auth/presentation/signup_screen.dart';
import 'package:chiva_exp/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Login"),
          LoginForm(),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text("¿No tienes una cuenta? Crea una"),
          ),
        ],
      ),
    );
  }
}
