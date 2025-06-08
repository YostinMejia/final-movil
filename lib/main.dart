import 'package:chiva_exp/features/auth/presentation/login_screen.dart';
import 'package:chiva_exp/features/auth/provider/auth_provider.dart';
import 'package:chiva_exp/features/home/home.dart';
import 'package:chiva_exp/features/places/presentation/place_screen.dart';
import 'package:chiva_exp/firebase_options.dart';
import 'package:chiva_exp/features/profile/presentation/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userAuthProvider);

    return MaterialApp(
      home: userAsyncValue.when(
        data: (user) {
          return user == null
              ? LoginScreen()
              : HomeScreen(
                pages: [
                  Placeholder(),
                  Placeholder(),
                  PlaceScreen(),
                  ProfileScreen(),
                ],
              );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
