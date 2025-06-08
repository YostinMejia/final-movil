import 'package:chiva_exp/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isDesktop = screenSize.width > 1200;
    final isLandscape = screenSize.width > screenSize.height;
    
    // Responsive dimensions
    final horizontalPadding = isDesktop ? 80.0 : (isTablet ? 40.0 : 24.0);
    final maxWidth = isDesktop ? 400.0 : (isTablet ? 500.0 : double.infinity);
    final logoSize = isTablet ? 100.0 : 80.0;
    final titleFontSize = isTablet ? 36.0 : 32.0;
    final subtitleFontSize = isTablet ? 18.0 : 16.0;
    final formPadding = isTablet ? 32.0 : 24.0;
    final topSpacing = isLandscape ? 40.0 : (isTablet ? 80.0 : 60.0);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2ED),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: maxWidth,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: topSpacing * 0.5),
                  
                  // Logo section
                  Container(
                    width: logoSize,
                    height: logoSize,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4915D),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person_add_rounded,
                      size: logoSize * 0.5,
                      color: Colors.white,
                    ),
                  ),
                  
                  SizedBox(height: isLandscape ? 20.0 : 32.0),
                  
                  // Welcome text
                  Text(
                    "Únete a Chiva Exp",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2B2B2B),
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: isLandscape ? 8.0 : 12.0),
                  
                  Text(
                    "Crea tu cuenta y explora el mundo",
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      color: const Color(0xFF6B6B6B),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: isLandscape ? 40.0 : 60.0),
                  
                  // SignUp form container
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 400.0 : double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(formPadding),
                    child: const SignUpForm(),
                  ),
                  
                  SizedBox(height: isLandscape ? 24.0 : 32.0),
                  
                  // Sign up button
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 400.0 : double.infinity,
                    ),
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
                        // Sign up logic here
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
                  
                  SizedBox(height: isLandscape ? 16.0 : 24.0),
                  
                  // Login button
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 24.0 : 16.0,
                        vertical: isTablet ? 16.0 : 12.0,
                      ),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: isTablet ? 16.0 : 15.0,
                          color: const Color(0xFF6B6B6B),
                        ),
                        children: [
                          const TextSpan(text: "¿Ya tienes cuenta? "),
                          TextSpan(
                            text: "Inicia sesión",
                            style: TextStyle(
                              color: const Color(0xFFD4915D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: isLandscape ? 20.0 : 40.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}