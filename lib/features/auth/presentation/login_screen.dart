import 'package:chiva_exp/features/auth/presentation/signup_screen.dart';
import 'package:chiva_exp/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: maxWidth,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: topSpacing),
                  
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
                      Icons.location_on_rounded,
                      size: logoSize * 0.5,
                      color: Colors.white,
                    ),
                  ),
                  
                  SizedBox(height: isLandscape ? 20.0 : 32.0),
                  
                  // App name
                  Text(
                    "Chiva Exp",
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
                    "Descubre lugares increíbles",
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      color: const Color(0xFF6B6B6B),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: isLandscape ? 40.0 : 60.0),
                  
                  // Login form container
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
                    child: const LoginForm(),
                  ),
                  
                  SizedBox(height: isLandscape ? 24.0 : 32.0),
                  
                  // Login button
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
                        // Login logic here
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
                        "Iniciar Sesión",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 18.0 : 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: isLandscape ? 16.0 : 24.0),
                  
                  // Sign up button
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const SignUpScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOutCubic;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                        ),
                      );
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
                          const TextSpan(text: "¿No tienes cuenta? "),
                          TextSpan(
                            text: "Regístrate",
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