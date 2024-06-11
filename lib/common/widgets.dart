import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/common/styles.dart';
import '/common/values.dart';

typedef Validator = String? Function(String?);

class InputField extends StatefulWidget {
  final String label;
  final TextEditingController textController;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? serverValidationMessage;

  const InputField({
    super.key,
    required this.label,
    required this.textController,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.validator,
    this.serverValidationMessage,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    widget.textController.addListener(_validate);
  }

  @override
  void dispose() {
    widget.textController.removeListener(_validate);
    super.dispose();
  }

  void _validate() {
    if (_showError) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          setState(() {
            _showError = true;
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: PPStyle.labelStyle),
          PPValues.smallSpacing,
          TextFormField(
            controller: widget.textController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              errorText: _showError
                  ? widget.validator?.call(widget.textController.text) ?? widget.serverValidationMessage
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            inputFormatters: widget.inputFormatters,
          ),
          PPValues.smallSpacing,
        ],
      ),
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
        borderRadius: BorderRadius.circular(PPStyle.radius),
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
            borderRadius: BorderRadius.circular(PPStyle.radius),
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
