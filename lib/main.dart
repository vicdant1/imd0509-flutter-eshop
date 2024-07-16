import 'package:f05_eshop/app_widget.dart';
import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:f05_eshop/firebase_options.dart';
import 'package:f05_eshop/pages/auth/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  final getIt = GetIt.instance;
  getIt.registerSingleton<AuthController>(AuthController());
  getIt.registerSingleton<ProductsController>(ProductsController());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppWidget());
}
