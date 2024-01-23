class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    // Email format validation
    // You can replace the regex pattern with a more sophisticated email validation
    // based on your specific requirements
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password strength validation
    // You can replace the condition with your own criteria for a strong password
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  static String? validateAccNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password strength validation
    // You can replace the condition with your own criteria for a strong password
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  static String? validateConAccNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password strength validation
    // You can replace the condition with your own criteria for a strong password
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password strength validation
    // You can replace the condition with your own criteria for a strong password
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  static String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password strength validation
    // You can replace the condition with your own criteria for a strong password
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  static String? validateCnic(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password strength validation
    // You can replace the condition with your own criteria for a strong password

    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }
}
