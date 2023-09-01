import 'package:flutter/material.dart';
import 'package:random_app_supabase/Controller/DbController.dart';
import 'package:random_app_supabase/Screen/ErrorScreen.dart';
import 'package:random_app_supabase/Screen/HomeScreen.dart';
import 'package:random_app_supabase/Screen/LoginScreen.dart';
import 'package:random_app_supabase/Screen/RegisterScreen.dart';
import 'package:random_app_supabase/SplashScreen/SplashScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://ercshfsqjnkvhnpeefre.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVyY3NoZnNxam5rdmhucGVlZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI3MDY2MzMsImV4cCI6MjAwODI4MjYzM30.FV_A8arckeRqnHX7GuGc2QGAQBvvJKlhIj1xpABcbNs'
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/error' : (context) => ErrorScreen(),
        '/login' : (context) => const LoginScreen(),
        '/register' : (context) => const RegisterScreen(),
        '/home' : (context) => const HomeScreen(),
      },
    );
  }
}
