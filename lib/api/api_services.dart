import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user.dart';
import 'local_storeage_shared_preference.dart';

class ApiServices {
  final _sharedPreferencesService = SharedPreferencesService();

  Future<User> login(String email, String password, bool rememberMe) async {
    // Simulate a network call delay
    await Future.delayed(Duration(seconds: 2));

    // Load mock data from a local JSON file
    final String response = await rootBundle.loadString('assets/user.json');
    final Map<String, dynamic> data = json.decode(response);

    debugPrint(data.toString());

    // Validate credentials
    if (email == 'user@speedforce.com' && password == 'password') {
      await _sharedPreferencesService.setRememberMe(rememberMe);
      return User.fromJson(data['data']);
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<User> fetchUser() async {
    // Simulate a network call delay
    await Future.delayed(Duration(seconds: 2));

    // Load mock data from a local JSON file
    final String response = await rootBundle.loadString('assets/user.json');
    final Map<String, dynamic> data = json.decode(response);

    debugPrint(data.toString());

    return User.fromJson(data['data']);
  }

  Future<void> signup(String name, String email, String password) async {
    // Simulate a network call delay
    await Future.delayed(Duration(seconds: 2));

    // Validate input (mock validation)
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('All fields are required');
    }

    // Simulate successful signup
    return;
  }
}
