import 'package:f05_eshop/pages/auth/auth_page.dart';
import 'package:f05_eshop/pages/auth/register_page.dart';
import 'package:f05_eshop/pages/orders_page.dart';
import 'package:f05_eshop/pages/product_detail_page.dart';
import 'package:f05_eshop/pages/product_form_page.dart';
import 'package:f05_eshop/pages/products_overview_page.dart';
import 'package:f05_eshop/pages/shopping_cart_page.dart';
import 'package:f05_eshop/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        fontFamily: 'Lato',
        useMaterial3: false,
      ),
      home: const AuthPage(),
      routes: {
        AppRoutes.REGISTER: (context) => CadastroWidget(),
        AppRoutes.ORDER_PAGES: (context) => const OrdersPage(),
        AppRoutes.PRODUCTS_VIEW: (context) => const ProductsOverviewPage(),
        AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
        AppRoutes.SHOPPING_CART: (ctx) => const ShoppingCartPage(),
        AppRoutes.PRODUCT_FORM: (context) => const NewProduct(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
