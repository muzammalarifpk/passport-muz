import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../common/base_scaffold.dart';
import '../common/styles.dart';
import '../common/validators.dart';
import '../common/input_field.dart';
import '../common/widgets.dart';
import '../common/values.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? instagramServerError;
  String? firstNameServerError;
  String? lastNameServerError;
  String? emailServerError;
  String? passwordServerError;
  String? confirmPasswordServerError;
  String? phoneServerError;

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PPValues.largeSpacing,
              PPValues.largeSpacing,
              const AppLogo(),
              PPValues.mediumSpacing,
              const Text('CREATE YOUR ACCOUNT', textAlign: TextAlign.center,),
              PPValues.largeSpacing,
              PPValues.largeSpacing,
              InputField(
                label: 'INSTAGRAM',
                textController: instagramController,
                hintText: 'Enter your Instagram handle',
                validator: requiredValidator,
                serverValidationMessage: instagramServerError,
              ),
              InputField(
                label: 'FIRST NAME',
                textController: firstNameController,
                hintText: 'Enter your first name',
                validator: requiredValidator,
                serverValidationMessage: firstNameServerError,
              ),
              InputField(
                label: 'LAST NAME',
                textController: lastNameController,
                hintText: 'Enter your last name',
                validator: requiredValidator,
                serverValidationMessage: lastNameServerError,
              ),
              InputField(
                label: 'EMAIL',
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
              InputField(
                label: 'CONFIRM PASSWORD',
                textController: confirmPasswordController,
                hintText: 'Re-enter your password',
                obscureText: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                serverValidationMessage: confirmPasswordServerError,
              ),
              InputField(
                label: 'PHONE NUMBER',
                textController: phoneController,
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                validator: phoneValidator,
                serverValidationMessage: phoneServerError,
              ),
              PrimaryButton(
                text: 'CONTINUE',
                onPressed: _submit,
              ),
              PPValues.mediumSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ',),
                  TextLink(
                    textLabel: 'Log in',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    style: PPStyle.textLinkStyle, // Use the new text link style
                  ),
                ],
              ),
              PPValues.mediumSpacing, // Extra space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
