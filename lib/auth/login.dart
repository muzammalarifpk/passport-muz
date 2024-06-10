import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/common/styles.dart';
import '/common/values.dart';
import '/common/screen_util.dart';
import '/common/widgets.dart'; // Import the reusable widgets

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtil.screenWidth(context);
    final screenHeight = ScreenUtil.screenHeight(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth * 0.9,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.08), // Space for the logo
                SizedBox(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.1,
                  child: Image.asset('assets/logo.png'),
                ),
                PPValues.mediumSpacing,
                const Text('SIGN IN', textAlign: TextAlign.center, style: PPStyle.titleStyle),
                PPValues.mediumSpacing,
                const InputField(label: 'EMAIL ADDRESS', value: 'FIVE FIGS'), // Use reusable InputField widget
                PPValues.mediumSpacing,
                const PasswordField(), // Use reusable PasswordField widget
                PPValues.mediumSpacing,
                ContinueButton(
                  onPressed: () {
                    // Add your onPressed code here!
                    if (kDebugMode) {
                      print('Continue Button Pressed');
                    }
                  },
                ), // Use reusable ContinueButton widget
                PPValues.mediumSpacing,
                const Text('forgot password?', style: PPStyle.forgotPasswordStyle),
                PPValues.mediumSpacing, // Extra space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
