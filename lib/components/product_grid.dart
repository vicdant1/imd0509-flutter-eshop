// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:f05_eshop/model/product.dart';
import 'package:f05_eshop/pages/auth/auth_controller.dart';
import 'package:f05_eshop/repositories/produtos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProductGrid extends StatefulWidget {
  final List<Product> products;
  final List<int> favorites;
  final void Function(int) onFavorite;

  const ProductGrid({
    Key? key,
    required this.products,
    required this.favorites,
    required this.onFavorite,
  }) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final controller = GetIt.instance.get<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: widget.products.length, // Added itemCount parameter
      itemBuilder: (ctx, index) {
        // Added itemBuilder parameter
        final product = widget.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/product-detail',
              arguments: product,
            );
          },
          child: GridTile(
            header: GridTileBar(
              backgroundColor: Colors.black.withOpacity(0.5),
              leading: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () async {
                  if (product.quantidade > 0) {
                    product.quantidade--;
                    setState(() {});
                  }
                },
              ),
              title: Center(child: Text(product.quantidade.toString())),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  product.quantidade++;
                  setState(() {});
                },
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(product.title),
              leading: Observer(builder: (_) {
                return IconButton(
                  icon: widget.favorites.contains(widget.products[index].id)
                      ? const Icon(Icons.favorite, color: Colors.yellow)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    widget.onFavorite(index);
                  },
                );
              }),
              trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () async {
                  GetIt getIt = GetIt.instance;
                  final controller = getIt.get<AuthController>();

                  final repository = ProductsRepository();
                  await repository.addProductToCart(
                      product, controller.user?.user?.uid);
                  Navigator.of(context).pushNamed(
                    '/shopping-cart',
                    arguments: product,
                  );
                },
              ),
            ),
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
