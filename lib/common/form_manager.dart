// common/form_manager.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'form_utils.dart';
import 'validators.dart';

mixin FormManager<T extends StatefulWidget> on State<T> {
  final List<FieldData> _fieldDataList = [];
  bool isFormValid = false;

  void registerField(GlobalKey<FormFieldState> key, String label, String validationType) {
    FormUtils.registerField(_fieldDataList, key, label, validationType);
  }

  bool validatorFunction(String label, dynamic value, String validationType) {
    switch (validationType) {
      case 'email':
        return emailValidator(value) == null;
      case 'password':
        return passwordValidator(value) == null;
      case 'required':
        return requiredValidator(value) == null;
      case 'phoneValidator':
        return phoneValidator(value) == null;
      default:
        return true;
    }
  }

  void validateForm() {
    setState(() {
      isFormValid = FormUtils.validateForm(_fieldDataList, validatorFunction);

      if (kDebugMode) {
        print('* * * * * * * * ');
        print('Form is valid: $isFormValid');
        for (var fieldData in _fieldDataList) {
          print('Field: ${fieldData.label}, Value: ${fieldData.key.currentState?.value}, Validation Type: ${fieldData.validationType}');
        }
      }
    });
  }
}