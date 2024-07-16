import 'dart:math';

import 'package:f05_eshop/components/custom_form.dart';
import 'package:f05_eshop/controllers/products_controller.dart';
import 'package:f05_eshop/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final controller = GetIt.instance.get<ProductsController>();
  final controllerNome = TextEditingController();
  final controllerDescricao = TextEditingController();
  final controllerPreco = TextEditingController();
  final controllerImagem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            CustomForms(
                controller: controllerNome, hint: 'Nome', obscure: false),
            const SizedBox(height: 20),
            CustomForms(
                controller: controllerDescricao,
                hint: 'Descrição',
                obscure: false),
            const SizedBox(height: 20),
            CustomForms(
                controller: controllerPreco, hint: 'Preço', obscure: false),
            const SizedBox(height: 20),
            CustomForms(
                controller: controllerImagem,
                hint: 'Url da Imagem',
                obscure: false),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await controller.addProduct(
                    Product(
                      id: Random().nextInt(10000),
                      title: controllerNome.text,
                      description: controllerDescricao.text,
                      price: double.parse(controllerPreco.text),
                      imageUrl: controllerImagem.text,
                      quantidade: 1,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
