import 'dart:math';

import 'package:dio/dio.dart';
import 'package:f05_eshop/model/orders.dart';
import 'package:f05_eshop/model/product.dart';
import 'package:f05_eshop/repositories/custom_repository.dart';
import 'package:f05_eshop/utils/constants.dart';

class ProductsRepository extends CustomRepository {
  final Dio _dio = Dio();

  @override
  Future create(model) async {
    try {
      await _dio.post('$BASE_URL/produtos/.json', data: model.toJson());
    } catch (e) {
      throw Exception('Failed to create produto: $e');
    }
  }

  @override
  Future delete(String id) async {
    try {
      await _dio.delete('$BASE_URL/produtos/$id/.json');
    } catch (e) {
      throw Exception('Failed to delete produto: $e');
    }
  }

  @override
  Future<List<Product>> getAll() async {
    try {
      final response = await _dio.get('$BASE_URL/produtos/.json');
      final data = response.data as Map<String, dynamic>;
      final List<Product> produtos = [];
      data.forEach((key, value) {
        produtos.add(Product.fromJson(value));
        produtos.last.key = key;
      });
      return produtos;
    } catch (e) {
      throw Exception('Failed to create produto: $e');
    }
  }

  @override
  Future getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  Future addProductToCart(Product product, String? id) async {
    try {
      await _dio.post('$BASE_URL/users/$id/carrinho/.json',
          data: product.toJson());
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future<List<Product>> getShoppingCart(String? id) async {
    try {
      final response = await _dio.get('$BASE_URL/users/$id/carrinho/.json');
      final data = response.data as Map<String, dynamic>;
      final List<Product> produtos = [];
      data.forEach((key, value) {
        produtos.add(Product.fromJson(value));
        produtos.last.key = key;
      });
      return produtos;
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future<List<int>> getFavoritesItens(String? id) async {
    try {
      final response = await _dio.get('$BASE_URL/users/$id/favoritos/.json');
      if (response.data == null) {
        return [];
      } else {
        return (response.data as Map<String, dynamic>)
            .values
            .first
            .cast<int>()
            .toList();
      }
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future addFavorite(
      String? id, List<int> oldFavorites, List<int> newFavorite) async {
    try {
      if (oldFavorites.isEmpty) {
        await _dio.post(
          '$BASE_URL/users/$id/favoritos/.json',
          data: {"itens": newFavorite},
        );
        await _dio.put(
          '$BASE_URL/users/$id/favoritos/.json',
          data: {"itens": newFavorite},
        );
      } else {
        await _dio.put(
          '$BASE_URL/users/$id/favoritos/.json',
          data: {"itens": newFavorite},
        );
      }
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future removeFavorites(String? id, int index) async {
    try {
      await _dio.delete('$BASE_URL/users/$id/favoritos/itens/$index/.json');
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future atualizaProdutoCarrinho(String? id, Product produto) async {
    try {
      await _dio.put('$BASE_URL/users/$id/carrinho/${produto.key}/.json',
          data: produto.toJson());
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future finalizaCompra(
      String? id, List<Product> products, String total) async {
    try {
      await _dio.post('$BASE_URL/users/$id/pedidos/.json', data: {
        "id": Random().nextInt(1000),
        "itens": products.map((e) => e.toJson()).toList(),
        "total": total,
        "data": DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future deleteShopCar(String? id) async {
    try {
      await _dio.delete(
        '$BASE_URL/users/$id/carrinho/.json',
      );
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  Future<List<Orders>> getPedidos(String? id) async {
    try {
      final response = await _dio.get('$BASE_URL/users/$id/pedidos/.json');
      final data = response.data as Map<String, dynamic>;
      final List<Orders> pedidos = [];
      data.forEach((key, value) {
        pedidos.add(Orders.fromJson(value));
      });
      return pedidos;
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }
}
