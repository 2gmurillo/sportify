import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/presentation/screens/king_of_the_court_screen.dart';
import 'package:sportify/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: const KingOfTheCourtScreen(),
    );
  }
}
