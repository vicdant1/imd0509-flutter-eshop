import 'package:f05_eshop/components/custom_form.dart';
import 'package:f05_eshop/pages/auth/auth_controller.dart';
import 'package:f05_eshop/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _controller = GetIt.instance.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 180, 20, 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildHead(),
                const SizedBox(
                  height: 45,
                ),
                CustomForms(
                  controller: _controller.emailController,
                  hint: 'Email',
                  obscure: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomForms(
                  controller: _controller.passwordController,
                  hint: 'Senha',
                  obscure: true,
                ),
                const SizedBox(height: 25),
                botaoAcessar(),
                const SizedBox(height: 30),
                buildRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHead() {
    return const Column(
      children: [
        Text(
          'Acessar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        )
      ],
    );
  }

  Widget botaoAcessar() {
    return GestureDetector(
        onTap: () async {
          await _controller.signInWithEmailAndPassword();
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCTS_VIEW,
          );
        },
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 61, 61, 61),
            ),
            child: const Center(
              child: Text(
                'Acessar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
            )));
  }

  Widget buildRegister() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.REGISTER);
      },
      child: const Text.rich(
        TextSpan(
          text: 'Não tem uma conta? ',
          style: TextStyle(
            color: Color.fromARGB(255, 58, 58, 58),
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: 'Cadastre-se',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
