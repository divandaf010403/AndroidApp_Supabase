import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final getDataEmail = supabase.auth.currentUser?.email;

extension ShowSnackBar on BuildContext {
  void ShowErrorMessage(String msg) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text (
          msg,
          style: TextStyle(color: Colors.redAccent),
        ),
        backgroundColor: Colors.grey,
      )
    );
  }
}

class DbController {
  Future<String?> login({
      required final String email,
      required final String password
  }) async{
    final AuthResponse response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = response.session;
    final User? user = response.user;
    return user?.id;
  }

  Future<bool> register({
    required final String username,
    required final String email,
    required final String password,
  }) async{
    final AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password
    );
    final userData = supabase.from('user').upsert({
      'created_at' : DateTime.now().toString(),
      'username' : username,
      'email' : email,
      'uid' : supabase.auth.currentUser?.id,
    });
    await userData.execute();
    final Session? session = response.session;
    final User? user = response.user;
    return true;
  }

  Future<void> saveUserProfile({required String username, required String? email}) async {
    final userData = supabase.from('user').insert({
      'id': supabase.auth.currentUser?.id,
      'created_at' : DateTime.now().toString(),
      'username' : username,
      'email' : email,
    });
    await userData.execute();
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}