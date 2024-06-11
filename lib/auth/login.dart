import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/styles.dart';
import '../common/validators.dart';
import '../common/values.dart';
import '../common/widgets.dart';
import '../common/base_scaffold.dart';
import '../common/input_field.dart';

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
      if (kDebugMode) {
        print('Form is valid, proceed with submission');
      }
    } else {
      setState(() {
        // Update state to show errors
      });
      if (kDebugMode) {
        print('Form is not valid, show errors');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLogo(),
            PPValues.largeSpacing,
            Text(
              'SIGN IN',
              textAlign: TextAlign.center,
              style: PPStyle.titleStyle,
            ),
            PPValues.largeSpacing,
            InputField(
              label: 'EMAIL ADDRESS',
              textController: emailController,
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              serverValidationMessage: emailServerError,
            ),
            InputField(
              label: 'PASSWORD',
              textController: passwordController,
              hintText: 'Enter your password',
              obscureText: true,
              validator: passwordValidator,
              serverValidationMessage: passwordServerError,
            ),
            PrimaryButton(
              text: 'CONTINUE',
              onPressed: _submit,
            ),
            PPValues.smallSpacing,
            TextLink(
              textLabel: 'forgot password?',
              onTap: () {
                if (kDebugMode) {
                  print('Hello forget password.');
                }
              },
              style: PPStyle.textLinkStyle,
            ),
          ],
        ),
      ),
    );
  }
}
