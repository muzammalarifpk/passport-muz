import 'package:flutter/material.dart';
import '/common/styles.dart';
import '/common/values.dart';

class PPForm{
  // Input Field Widget
  Widget buildInputField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: PPStyle.labelStyle),
        PPValues.smallSpacing,
        Text(value, style: PPStyle.valueStyle),
        PPValues.smallSpacing,
        Container(
          width: 329,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  // Password Field Widget
  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('PASSWORD', style: PPStyle.labelStyle),
            FlutterLogo(size: 31),
          ],
        ),
        PPValues.smallSpacing,
        const Text('FIVE FIGS', style: PPStyle.valueStyle),
        PPValues.smallSpacing,
        Container(
          width: 329,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

}