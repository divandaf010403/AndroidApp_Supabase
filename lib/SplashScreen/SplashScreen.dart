import 'package:flutter/material.dart';
import 'package:random_app_supabase/Controller/DbController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      supabase.auth.currentSession != null ? Navigator.pushReplacementNamed(context, '/home') : Navigator.pushReplacementNamed(context, '/login');
    } catch (error) {
      Navigator.pushReplacementNamed(context, '/error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'Images/mylogo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
