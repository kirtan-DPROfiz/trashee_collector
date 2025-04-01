/* import 'package:flutter/material.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            Image.asset("android/assets/Trashee collecter .png"),
            const SizedBox(height: 32),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email or Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Get the email and password from your text fields
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Call the login function
                  final result = await RestClient.login(email, password);

                  // Handle the result
                  if (result['success']) {
                    // Navigate to home screen or show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result['message'])),
                    );
                    // Navigator.push(...);
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result['message'])),
                    );
                  }

                  // Navigator.pushReplacementNamed(context, '/dashboard');
                },
                child: const Text('LOGIN'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle OTP login
              },
              child: const Text('Login with OTP'),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
 */

// new
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashee_collecter/API/network%20manager/rest_client.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool obscurePassword = true;

  void initState() {
    super.initState();
    getAndPrintFCMToken();
  }

  Future<void> getAndPrintFCMToken() async {
    try {
      // Request notification permissions (required for Android 13+)
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');

        // Get token with retry logic
        String? token = await _getFCMToken();

        if (token != null) {
          print('FCM Token: $token');
          // Store or use your token here
        } else {
          print('Failed to get FCM token after retries');
        }
      } else {
        print('User declined or has not granted permission');
      }
    } catch (e) {
      print('Error getting FCM token: $e');
    }
  }

  Future<String?> _getFCMToken() async {
    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        print("FCM Token: $fcmToken");
        return fcmToken;
        // TODO: Send this token to your server for later use.
      } else {
        print("Failed to retrieve FCM token.");
      }
    } catch (e) {
      print("Error retrieving FCM token: $e");
      // Add retry logic
      await Future.delayed(Duration(seconds: 2));
      return _getFCMToken(); // Recursive retry
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FCM Token Example')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo image
              //Image.asset("android/assets/images/trashee_collecter.jpg"),
              Container(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                child: Text(
                  "TRASHEE",
                  style: TextStyle(color: Colors.black, fontSize: 55),
                ),
              ),

              // Collector with dividers
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "collector",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Email/Phone Field
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: ' Email ',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => isLoading = true);

                            try {
                              final result = await RestClient.login(
                                emailController.text,
                                passwordController.text,
                              );

                              if (result['success']) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result['message'])),
                                );
                                // Navigate to home screen after successful login
                                Get.offNamed('/dashboard');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result['message'])),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'An error occurred. Please try again.')),
                              );
                            } finally {
                              setState(() => isLoading = false);
                            }
                          }
                        },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('LOGIN'),
                ),
              ),
              const SizedBox(height: 8),
              Center(child: Text('Check your console for the FCM token.')),
              const SizedBox(height: 8),

              // OTP Login Option
              /*    TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        // Implement OTP login navigation
                        Navigator.pushNamed(context, '/otp-login');
                      },
                child: const Text('Login with OTP'),
              ), */
              const Spacer(),

              // Signup Option
              TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        Get.toNamed("/SignUp");
                      },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
