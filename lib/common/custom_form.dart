import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final Widget child;
  final GlobalKey<FormState> formKey;
  final VoidCallback? onChanged;

  const CustomForm({
    super.key,
    required this.child,
    required this.formKey,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
          formKey.currentState?.validate(); // Validate the form on tap outside
          if (onChanged != null) {
            onChanged!();
          }
        }
      },
      child: Form(
        key: formKey,
        onChanged: onChanged,
        child: child,
      ),
    );
  }
}
