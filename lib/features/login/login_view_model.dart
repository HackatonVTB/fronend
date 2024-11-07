import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController _loginController = TextEditingController();
  TextEditingController get loginController => _loginController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  String _login = '';
  String get login => _login;

  String _password = '';
  String get password => _password;

  void doLogin() {
    _login = _loginController.text;
    _password = _passwordController.text;
    notifyListeners();
  }
}
