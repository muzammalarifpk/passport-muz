import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../common/base_scaffold.dart';
import '../common/custom_form.dart';
import '../common/form_manager.dart';
import '../common/input_field.dart';
import '../common/styles.dart';
import '../common/validators.dart';
import '../common/values.dart';
import '../common/widgets.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with FormManager<RegisterScreen> {
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referredByController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? instagramServerError;
  String? firstNameServerError;
  String? lastNameServerError;
  String? emailServerError;
  String? passwordServerError;
  String? confirmPasswordServerError;
  String? phoneServerError;
  String? referredByServerError;

  void _submit() {
    if (isFormValid) {
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
      body: CustomForm(
        formKey: _formKey,
        onChanged: validateForm,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLogo(),
              PPValues.largeSpacing,
              Text(
                'REGISTER',
                textAlign: TextAlign.center,
                style: PPStyle.titleStyle,
              ),
              PPValues.largeSpacing,
              InputField(
                label: 'INSTAGRAM',
                textController: instagramController,
                hintText: 'Enter your Instagram handle',
                validator: requiredValidator,
                serverValidationMessage: instagramServerError,
                registerField: (key) => registerField(key, 'INSTAGRAM', 'required'),
              ),
              InputField(
                label: 'FIRST NAME',
                textController: firstNameController,
                hintText: 'Enter your first name',
                validator: requiredValidator,
                serverValidationMessage: firstNameServerError,
                registerField: (key) => registerField(key, 'FIRST NAME', 'required'),
              ),
              InputField(
                label: 'LAST NAME',
                textController: lastNameController,
                hintText: 'Enter your last name',
                validator: requiredValidator,
                serverValidationMessage: lastNameServerError,
                registerField: (key) => registerField(key, 'LAST NAME', 'required'),
              ),
              InputField(
                label: 'EMAIL',
                textController: emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
                serverValidationMessage: emailServerError,
                registerField: (key) => registerField(key, 'EMAIL', 'email'),
              ),
              InputField(
                label: 'PASSWORD',
                textController: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
                validator: passwordValidator,
                serverValidationMessage: passwordServerError,
                registerField: (key) => registerField(key, 'PASSWORD', 'password'),
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
                registerField: (key) => registerField(key, 'CONFIRM PASSWORD', 'password'),
              ),
              InputField(
                label: 'PHONE NUMBER',
                textController: phoneController,
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                validator: phoneValidator,
                serverValidationMessage: phoneServerError,
                registerField: (key) => registerField(key, 'PHONE NUMBER', 'phoneValidator'),
              ),
              InputField(
                label: 'Referred By',
                textController: referredByController,
                hintText: 'Email Address of who refer you.',
                keyboardType: TextInputType.emailAddress,
                validator: optionalField,
                serverValidationMessage: referredByServerError,
                registerField: (key) => registerField(key, 'Referred By', 'optionalField'),
              ),
              PrimaryButton(
                text: 'CONTINUE',
                onPressed: _submit,
                isActive: isFormValid,
              ),
              PPValues.mediumSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ', style: PPStyle.forgotPasswordStyle),
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
