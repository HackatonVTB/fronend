import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  final TextEditingController _loginController = TextEditingController();

  TextEditingController get loginController => _loginController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final TextEditingController _passwordCompleteController =
      TextEditingController();

  TextEditingController get passwordCompleteController =>
      _passwordCompleteController;

  String _errorNotification = '';

  String get errorNotification => _errorNotification;

  void openRegistrationScreen(BuildContext context) {
    final login = _loginController.text;
    final password = _passwordController.text;
    final passwordComplete = _passwordCompleteController.text;

    if (!password.check) {
      _errorNotification = 'Пароль должен содержать не меньше 8 символов и иметь спец. символы';
      notifyListeners();
      return;
    }

    if (password != passwordComplete) {
      _errorNotification = 'Пароли не совпадают';
      notifyListeners();
      return;
    }

    Navigator.of(context).pop(login);
  }
}

extension NewPasswordValidationExt on String {
  bool get check => length >= 8 && getCheckSpecialSymbols;

  bool get getCheckSpecialSymbols =>
      contains('!') ||
      contains('@') ||
      contains('#') ||
      contains('(') ||
      contains(')') ||
      contains('%') ||
      contains('&') ||
      contains('/') ||
      contains('|') ||
      contains('\\') ||
      contains('{') ||
      contains('}') ||
      contains('[') ||
      contains(']') ||
      contains('-') ||
      contains('_') ||
      contains('+') ||
      contains('=');
}
