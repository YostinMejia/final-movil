import 'package:chiva_exp/features/auth/provider/auth_notifier_provider.dart';
import 'package:chiva_exp/features/auth/provider/auth_provider.dart';
import 'package:chiva_exp/features/profile/presentation/user_not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.read(userAuthProvider);

    return userAsyncValue.when(
      data: (user) {
        return user == null
            ? UserNotFound()
            : Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.grey[700],
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        user.email!,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),

                      SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: () {
                          ref.read(authNotifierProvider.notifier).logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Sign out"),
                      ),
                    ],
                  ),
                ),
              ),
            );
      },
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
