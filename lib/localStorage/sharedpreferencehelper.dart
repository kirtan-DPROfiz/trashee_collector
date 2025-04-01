/*
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SharedPreferencesHelper {
  static const String _emailKey = 'email';

  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _tokenKey = 'token';

  // Save user credentials
  static Future<void> saveCredentials(String email, String password) async {
    print('Saving Credentials...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.setString(_emailKey, email);
    print('Email Saved: $email');



    await prefs.setBool(_isLoggedInKey, true);
    print('isLoggedIn Flag Set to True');
  }

  // Save token
  static Future<void> saveToken(String token) async {
    print('Saving Token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.setString(_tokenKey, token);
    print('Token Saved: $token');
  }

  // Get saved token
  static Future<String?> getToken() async {
    print('Fetching Token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    String? token = prefs.getString(_tokenKey);
    print(token != null ? 'Token Retrieved: $token' : 'No Token Found');
    return token;
  }

  // Clear credentials and token on logout
  static Future<void> clearCredentials() async {
    print('Clearing Credentials...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.remove(_emailKey);
    print('Email Removed');



    await prefs.setBool(_isLoggedInKey, false);
    print('isLoggedIn Flag Set to False');
  }

  static Future<void> clearToken() async {
    print('Clearing Token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.remove(_tokenKey);
    print('Token Removed');
  }


  Future<String> getOrCreateUuid() async {
    final prefs = await SharedPreferences.getInstance();
    String? uuid = prefs.getString('uuid'); // Check if UUID already exists

    if (uuid == null) {
      // Generate a new UUID
      uuid = Uuid().v4();
      await prefs.setString('uuid', uuid); // Store the UUID
      print('Generated and stored new UUID: $uuid');
    } else {
      print('Retrieved stored UUID: $uuid');
    }

    return uuid;
  }
}
*/

//------------------previous----------------//

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;

class SharedPreferencesAuth {
  static const String _emailKey = 'email';
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _tokenKey = 'token';
  static const String _userDetailsKey = 'userDetails';

  // Save user credentials
  static Future<void> saveCredentials(String email, String password) async {
    print('Saving Credentials...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.setString(_emailKey, email);
    print('Email Saved: $email');

    await prefs.setBool(_isLoggedInKey, true);
    print('isLoggedIn Flag Set to True');
  }

  // Save token
  static Future<void> saveToken(String token) async {
    print('Saving Token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.setString(_tokenKey, token);
    print('Token Saved: $token');
  }

  // Get saved token
  static Future<String?> getToken() async {
    print('Fetching Token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    String? token = prefs.getString(_tokenKey);
    print(token != null ? 'Token Retrieved: $token' : 'No Token Found');
    return token;
  }

  // Clear credentials and token on logout (but NOT the UUID)
  static Future<void> clearCredentials() async {
    print('Clearing Credentials...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.remove(_emailKey);
    print('Email Removed');
  }

  static Future<void> clearToken() async {
    print('Clearing Token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    final storage = html.window.localStorage;
    String? isloggin = storage[_isLoggedInKey];
    print("Stored isLoggIn value is : $isloggin");

    await prefs.setBool(_isLoggedInKey, false);
    print('isLoggedIn Flag Set to False');

    // Remove the stored token
    await prefs.remove(_tokenKey);
    print('Token Removed');
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    // Remove any stored login status flag
    /* await prefs.remove(_isLoggedInKey);
    print('Login status cleared.');*/

    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Get saved credentials
  static Future<Map<String, String>> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_emailKey) ?? '';
    //final password = prefs.getString(_passwordKey) ?? '';
    return {
      'email': email,
    };
  }

  //--------------save Api response of verify token --------------//

  // Save user details
  static Future<void> saveUserDetails(Map<String, dynamic> userDetails) async {
    print('Saving user details...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.setString(_userDetailsKey, json.encode(userDetails));
    print('User details saved: $userDetails');
  }

  // Get user details
  static Future<Map<String, dynamic>> getUserDetails() async {
    print('Fetching user details...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    String? userDetailsJson = prefs.getString(_userDetailsKey);
    if (userDetailsJson != null) {
      final userDetails = json.decode(userDetailsJson);
      print('User details retrieved: $userDetails');
      return userDetails;
    } else {
      print('No user details found');
      return {};
    }
  }

/*

  static Future<void> storeUuid(String uuid) async {
    if (kIsWeb) {
      // Store in localStorage
      html.window.localStorage[_uuidKey] = uuid;

      // Store in cookies as a fallback
      final expires = DateTime.now().add(Duration(days: 365)).toUtc().toIso8601String();
      html.document.cookie = 'uuid=$uuid; expires=$expires; path=/';
    } else {
      // Use SharedPreferences for mobile
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_uuidKey, uuid);
    }
  }

  static Future<String?> getUuid() async {
    if (kIsWeb) {
      // Try to retrieve from localStorage
      String? uuid = html.window.localStorage[_uuidKey];

      // If not found in localStorage, try to retrieve from cookies
      if (uuid == null) {
        final cookies = html.document.cookie?.split(';');
        for (final cookie in cookies!) {
          final parts = cookie.trim().split('=');
          if (parts[0] == 'uuid') {
            uuid = parts[1];
            break;
          }
        }
      }

      return uuid;
    } else {
      // Use SharedPreferences for mobile
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_uuidKey);
    }
  }
*/

// Optional: Clear UUID (only if needed)
  /*static Future<void> cleartokenlocally() async {
    print('Clearing token...');
    final prefs = await SharedPreferences.getInstance();
    print('SharedPreferences instance obtained');

    await prefs.remove(_tokenKey);
    print('Token Removed...!!');
  }*/
}
