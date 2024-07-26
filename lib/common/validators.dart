String? requiredValidator(String? value) {

  if (value == null || value.isEmpty) {
    return 'This field is required';
  }

  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  final phoneRegex = RegExp(r'^\d{10}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Enter a valid phone number';
  }
  return null;
}

String? optionalField(String? value) {
  return null;
}