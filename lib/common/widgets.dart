import 'package:flutter/material.dart';
import '/common/styles.dart';

typedef Validator = String? Function(String?);

class AppLogo extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;

  const AppLogo({
    super.key,
    this.widthFactor = 0.3,
    this.heightFactor = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * widthFactor,
      height: screenHeight * heightFactor,
      child: Image.asset('assets/logo.png'),
    );
  }
}


class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: PPStyle.btnHeight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [PPStyle.primaryDark, PPStyle.primaryLight],
        ),
        borderRadius: BorderRadius.circular(PPStyle.borderRadius),
        boxShadow: const [
          BoxShadow(
            color: PPStyle.shadow,
            blurRadius: PPStyle.blueRadius,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PPStyle.borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: PPStyle.buttonTextStyle),
      ),
    );
  }
}

class TextLink extends StatelessWidget {
  final String textLabel;
  final VoidCallback onTap;

  const TextLink({
    super.key,
    required this.textLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity, // Make it flexible to the parent width
        child: Text(
          textLabel,
          style: PPStyle.forgotPasswordStyle,
        ),
      ),
    );
  }
}
