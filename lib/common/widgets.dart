import 'package:flutter/material.dart';
import '/common/styles.dart';
import '/common/values.dart';

// Reusable Input Field Widget
class InputField extends StatelessWidget {
  final String label;
  final String value;
  const InputField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: PPStyle.labelStyle),
        PPValues.smallSpacing,
        Text(value, style: PPStyle.valueStyle),
        PPValues.smallSpacing,
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}

// Reusable Password Field Widget
class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
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
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}

// Reusable Continue Button Widget
class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF9747FF), Color(0xFF5A2A99)],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: const Text('CONTINUE', style: PPStyle.buttonTextStyle),
      ),
    );
  }
}
