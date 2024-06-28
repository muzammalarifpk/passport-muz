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

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = true,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: PPStyle.btnHeight,
      decoration: BoxDecoration(
        gradient: widget.isActive
            ? const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [PPStyle.primaryLight, PPStyle.primaryDark],
        )
            : const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.grey, Colors.grey],
        ),
        borderRadius: BorderRadius.circular(PPStyle.borderRadius),
        boxShadow: widget.isActive
            ? const [
          BoxShadow(
            color: PPStyle.shadow,
            blurRadius: PPStyle.blueRadius,
            offset: Offset(0, 4),
          ),
        ]
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PPStyle.borderRadius),
          ),
        ),
        onPressed: widget.isActive ? widget.onPressed : null,
        child: Text(widget.text.toUpperCase(), style: PPStyle.buttonTextStyle),
      ),
    );
  }
}

class TextLink extends StatelessWidget {
  final String textLabel;
  final VoidCallback onTap;
  final TextStyle? style;

  const TextLink({
    super.key,
    required this.textLabel,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textLabel,
        style: style ?? PPStyle.forgotPasswordStyle,
      ),
    );
  }
}
