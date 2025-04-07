import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String _isLoggedInKey = "isLoggedIn";
  static const String _userIdKey = "user_id";
  static const String _fullNameKey = "full_name";
  static const String _emailKey = "email";
  static const String _phoneKey = "phone_number";
  static const String _roleKey = "role";

  // Save user login details
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setInt(_userIdKey, userData["user_id"]);
    await prefs.setString(_fullNameKey, userData["full_name"]);
    await prefs.setString(_emailKey, userData["email"]);
    //await prefs.setString(_phoneKey, userData["phone_number"]);
    await prefs.setString(_roleKey, userData["role"]);
    print("user Data is store into SharePreference , Successfully!! ");
    log("user Data is store into SharePreference , Successfully!! ");
  }

  // Check if the user is logged in
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Get user details
  static Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Store user data is Get , Successfully!! ");
    log("Store user data is Get , Successfully!! ");
    return {
      "user_id": prefs.getInt(_userIdKey),
      "full_name": prefs.getString(_fullNameKey),
      "email": prefs.getString(_emailKey),
      // "phone_number": prefs.getString(_phoneKey),
      "role": prefs.getString(_roleKey),
    };
  }

  // Logout function
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(" User store data is clear , Successfully!! ");
    log(" User store data is clear , Successfully!! ");
    await prefs.clear(); // Clears all saved data
  }
}
