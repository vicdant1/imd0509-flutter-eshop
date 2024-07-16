import 'package:f05_eshop/components/custom_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  CadastroWidget({super.key});

  Future registerWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomForms(
                controller: emailController, hint: 'Email', obscure: false),
            const SizedBox(
              height: 30,
            ),
            CustomForms(
                controller: passwordController,
                hint: 'Password',
                obscure: false),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: registerWithEmailAndPassword,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
