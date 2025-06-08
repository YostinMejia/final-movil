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
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              validator: notNullOrEmpty,
              decoration: InputDecoration(
                label: Text(
                  "Nombre",
                  style: TextStyle(color: const Color(0xFF6B6B6B)),
                ),
                hintText: "Ingresa tu nombre completo",
                hintStyle: TextStyle(color: const Color(0xFF9B9B9B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFD4915D), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isTablet ? 20 : 16,
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Text(
                  "Email",
                  style: TextStyle(color: const Color(0xFF6B6B6B)),
                ),
                hintText: "Ingresa tu correo electrónico",
                hintStyle: TextStyle(color: const Color(0xFF9B9B9B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFD4915D), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isTablet ? 20 : 16,
                ),
              ),
              validator: (value) {
                String? notEmpty = notNullOrEmpty(value);
                if (notEmpty != null) return notEmpty;
                String? email = emailValidator(value!);
                return email;
              },
            ),
            
            SizedBox(height: 20),
            
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "Contraseña",
                  style: TextStyle(color: const Color(0xFF6B6B6B)),
                ),
                hintText: "Crea una contraseña segura",
                hintStyle: TextStyle(color: const Color(0xFF9B9B9B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFD4915D), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isTablet ? 20 : 16,
                ),
              ),
              validator: (value) {
                String? notEmpty = notNullOrEmpty(value);
                if (notEmpty != null) return notEmpty;
                String? password = passwordValidator(value!);
                return password;
              },
            ),
            
            SizedBox(height: 20),
            
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "Confirmar Contraseña",
                  style: TextStyle(color: const Color(0xFF6B6B6B)),
                ),
                hintText: "Confirma tu contraseña",
                hintStyle: TextStyle(color: const Color(0xFF9B9B9B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFE5E5E5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color(0xFFD4915D), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isTablet ? 20 : 16,
                ),
              ),
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

            SizedBox(height: 32),

            // Styled Submit Button matching the design
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFD4915D),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD4915D).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  //Validates and verify all the form fields
                  if (_formKey.currentState!.validate()) {
                    ref.read(authNotifierProvider.notifier).register(
                      _emailController.text, 
                      _passwordController.text
                    );
                    Navigator.pop(context);
                  }
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isTablet ? 20.0 : 18.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Crear Cuenta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet ? 18.0 : 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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