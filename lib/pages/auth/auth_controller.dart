import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  UserCredential? user;

  @action
  Future signInWithEmailAndPassword() async {
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      //
    }
  }
}
