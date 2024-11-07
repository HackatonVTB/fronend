import 'package:flutter/material.dart';
import 'package:fronend/features/login/login_view_model.dart';
import 'package:fronend/features/registration/registration_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Авторизация'),
        ),
        body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.login),
                Text(viewModel.password),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: viewModel.loginController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'логин',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: viewModel.passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'пароль',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () => viewModel.doLogin(),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegistrationView(),
                    ),
                  ),
                  child: const Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
