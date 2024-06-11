import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/screen_util.dart';
import '../common/styles.dart';
import '../common/validators.dart';
import '../common/values.dart';
import '../common/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emailServerError;
  String? passwordServerError;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform the form submission logic here
      print('Form is valid, proceed with submission');
    } else {
      setState(() {
        // Update state to show errors
      });
      print('Form is not valid, show errors');
    }
  }

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
            child: Form(
              key: _formKey,
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
                  InputField(
                    label: 'EMAIL ADDRESS',
                    textController: emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                    serverValidationMessage: emailServerError,
                  ),
                  PPValues.mediumSpacing,
                  InputField(
                    label: 'PASSWORD',
                    textController: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    validator: passwordValidator,
                    serverValidationMessage: passwordServerError,
                  ),
                  PPValues.mediumSpacing,
                  PrimaryButton(
                    text: 'CONTINUE',
                    onPressed: _submit,
                  ),
                  PPValues.mediumSpacing,
                  TextLink(
                    textLabel: 'forgot password?',
                    onTap: () {
                      if (kDebugMode) {
                        print('Hello forget password.');
                      }
                    },
                  ),
                  PPValues.mediumSpacing, // Extra space at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
