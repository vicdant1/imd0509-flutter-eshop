import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:f05_eshop/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.imageUrl),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Descrição',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(product.description,
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  const Text(
                    'Preço',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('R\$ ${product.price.toString()}',
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Alterar Item'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                  child: GestureDetector(
                onTap: () async {
                  final controller = GetIt.instance.get<ProductsController>();
                  await controller.deleteProduct(product.key ?? '');
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.PRODUCTS_VIEW);
                },
                child: const Text(
                  'Remover item',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
