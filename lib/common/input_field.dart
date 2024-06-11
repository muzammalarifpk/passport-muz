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
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  late bool _obscureText; // Changed from non-nullable to late initialization
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText; // Initialize _obscureText here
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

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
              border: const UnderlineInputBorder(),
              suffixIcon: widget.obscureText
                  ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )
                  : null,
            ),
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            inputFormatters: widget.inputFormatters,
          ),
          PPValues.mediumSpacing,

        ],
      ),
    );
  }
}
