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
  final void Function(GlobalKey<FormFieldState>) registerField;

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
    required this.registerField,
  });

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();
  late bool _obscureText;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.textController.addListener(_validate);
    widget.registerField(_fieldKey);
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
          TextFormField(
            key: _fieldKey,
            controller: widget.textController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: const UnderlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 0, top: 5, bottom: 0, right: 5),
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _showError ? 20.0 : 20.0,
            child: _showError
                ? Text(
              widget.validator?.call(widget.textController.text) ?? widget.serverValidationMessage ?? '',
              style: const TextStyle(color: Colors.red),
            )
                : const SizedBox.shrink(),
          ),
          PPValues.mediumSpacing,
        ],
      ),
    );
  }
}
