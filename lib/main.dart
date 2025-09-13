import 'package:flutter/material.dart';
import 'screens/blind_mixer_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/subscription_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mixer App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SF Pro Display', // Hypothetical font from iOS design
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BlindMixerScreen(),
        EditProfileScreen.routeName: (context) => const EditProfileScreen(),
        SubscriptionScreen.routeName: (context) => const SubscriptionScreen(),
      },
    );
  }
}