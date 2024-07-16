import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../components/product_grid.dart';
import '../utils/app_routes.dart';

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  final ProductsController controller =
      GetIt.instance.get<ProductsController>();

  @override
  void initState() {
    controller.getAll();
    controller.getFavoritesItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.ORDER_PAGES,
              );
            },
            child: const Icon(Icons.person)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.SHOPPING_CART,
                );
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Observer(builder: (_) {
        return ProductGrid(
          products: controller.produtos,
          favorites: controller.favorites,
          onFavorite: (index) async {
            controller.favorites.contains(controller.produtos[index].id)
                ? await controller
                    .removeFavoriteItem(controller.favorites.indexOf(index))
                : await controller
                    .addProductFavorite(controller.produtos[index].id);
          },
        );
      }),
    );
  }
}
