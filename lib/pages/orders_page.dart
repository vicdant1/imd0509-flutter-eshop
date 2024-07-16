import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final controller = GetIt.instance.get<ProductsController>();

  @override
  void initState() {
    controller.getPedidos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ...controller.pedidos.map((e) => ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd/MM').format(DateTime.parse(e.data)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          DateFormat('HH:mm').format(
                            DateTime.parse(e.data),
                          ),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    title: Text('Número do pedido ${e.id.toString()}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        ...e.itens.map((e) => Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                '${e.quantidade}x ${e.title} R\$ ${e.price}'))),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider()
                      ],
                    ),
                    trailing: Text('R\$ ${e.total}'),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
