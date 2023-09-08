import 'package:flutter/cupertino.dart';

class HomeViewModel {
  TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = true;
  TextEditingController _passwordController = TextEditingController();
  bool _isValidPassword = true;


  TextEditingController getEmailController() => _emailController;
  TextEditingController getPasswordController() => _passwordController;
  bool getIsValidEmail() => _isValidEmail;
  bool getIsValidPassword() => _isValidPassword;

  validateEmail() {
    final email = _emailController.text;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}');
    _isValidEmail = emailRegex.hasMatch(email);
  }


  validatePassword() {
      RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      _isValidPassword = regex.hasMatch(_passwordController.text);
    }

}