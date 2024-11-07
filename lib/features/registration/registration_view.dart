import 'package:flutter/material.dart';
import 'package:fronend/features/registration/registration_view_model.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegistrationViewModel>(
      create: (context) => RegistrationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Регистрация'),
        ),
        body: Consumer<RegistrationViewModel>(
          builder: (context, viewModel, child) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  viewModel.errorNotification,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 16),
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
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: viewModel.passwordCompleteController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'подтвердить пароль',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () => viewModel.openRegistrationScreen(context),
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
