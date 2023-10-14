import 'package:flutter/material.dart';
import 'package:test_cobyzero/presentation/screen/home_screen.dart';
import 'package:test_cobyzero/presentation/screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
