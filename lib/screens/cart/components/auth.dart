import 'package:ecommerceapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> register(String email, String password, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('name', name);
    await prefs.setBool('is_logged_in', true);
    Get.to(() => HomeScreen());
  }

  Future<bool> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');
    if (storedEmail == email && storedPassword == password) {
      await prefs.setBool('is_logged_in', true);

      return true;
    } else {
      return false;
    }
  }
}