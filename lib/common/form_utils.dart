// common/form_utils.dart

import 'package:flutter/material.dart';

class FieldData {
  final GlobalKey<FormFieldState> key;
  final String label;
  final String validationType;

  FieldData(this.key, this.label, this.validationType);
}

class FormUtils {
  static void registerField(List<FieldData> fieldDataList, GlobalKey<FormFieldState> key, String label, String validationType) {
    fieldDataList.add(FieldData(key, label, validationType));
  }

  static bool validateForm(List<FieldData> fieldDataList, Function(String label, dynamic value, String validationType) validatorFunction) {
    bool isValid = true;

    for (var fieldData in fieldDataList) {
      final value = fieldData.key.currentState?.value;

      if (!validatorFunction(fieldData.label, value, fieldData.validationType)) {
        isValid = false;
      }

      if (!isValid) break;
    }

    return isValid;
  }
}