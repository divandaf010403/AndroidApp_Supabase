import 'package:flutter/material.dart';
import 'package:random_app_supabase/Controller/DbController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            Text('${getDataEmail}'),
            ElevatedButton(
              onPressed: () {
                DbController().signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
