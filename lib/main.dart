import 'package:anima/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'HomePage.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://bhnfenqicpqhukoauywp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJobmZlbnFpY3BxaHVrb2F1eXdwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc0MDk0ODUsImV4cCI6MjAyMjk4NTQ4NX0.yThs2cLamEvQmUYWWuQVyIiPUp0KdZJLSUj196N_xgs',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      home: const LoginPage(),
    );
  }
}
