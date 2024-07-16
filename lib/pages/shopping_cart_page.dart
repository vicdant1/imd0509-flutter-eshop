import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({
    super.key,
  });

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final controller = GetIt.instance.get<ProductsController>();

  @override
  void initState() {
    controller.getShopCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
      ),
      body: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...controller.carrinho.map((product) {
              return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text('R\$ ${product.price.toString()}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            if (product.quantidade >= 1) {
                              product.quantidade--;
                            } else {
                              controller.carrinho.remove(product);
                            }
                            controller.getTotal();
                            await controller.atualizarProductCarrinho(product);
                          },
                          icon: const Icon(Icons.remove)),
                      Text(
                        product.quantidade.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () async {
                            product.quantidade++;
                            controller.getTotal();
                            await controller.atualizarProductCarrinho(product);
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ));
            }).toList(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Total: R\$ ${controller.total}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await controller.finalizaCompra();
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blue,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Finalizar Compra',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
