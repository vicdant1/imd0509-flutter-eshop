import 'package:f05_eshop/model/orders.dart';
import 'package:f05_eshop/model/product.dart';
import 'package:f05_eshop/pages/auth/auth_controller.dart';
import 'package:f05_eshop/repositories/produtos_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final ProductsRepository _productsRepository = ProductsRepository();
  final controller = GetIt.instance.get<AuthController>();

  @observable
  List<Product> produtos = [];

  @observable
  List<Product> carrinho = [];

  @observable
  double total = 0;

  @observable
  List<int> favorites = [];

  @observable
  List<Orders> pedidos = [];

  @action
  Future getAll() async {
    produtos = await _productsRepository.getAll();
  }

  @action
  Future addProduct(Product product) async {
    try {
      await _productsRepository.create(
        product,
      );
      await getShopCart();
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  @action
  Future getShopCart() async {
    try {
      carrinho =
          await _productsRepository.getShoppingCart(controller.user?.user?.uid);
      getTotal();
    } catch (e) {
      carrinho = [];
    }
  }

  @action
  void getTotal() {
    total = carrinho.fold(
        0, (total, product) => (total) + (product.quantidade * product.price));
    total = double.parse(total.toStringAsFixed(2));
  }

  @action
  Future getFavoritesItens() async {
    favorites =
        await _productsRepository.getFavoritesItens(controller.user?.user?.uid);
  }

  @action
  Future removeFavoriteItem(int index) async {
    await _productsRepository.removeFavorites(
        controller.user?.user?.uid, index);
    await getFavoritesItens();
  }

  @action
  Future addProductFavorite(int index) async {
    List<int> newFavorites = List.from(favorites);
    newFavorites.add(index);
    await _productsRepository.addFavorite(
        controller.user?.user?.uid, favorites, newFavorites);
    await getFavoritesItens();
  }

  @action
  Future atualizarProductCarrinho(Product product) async {
    await _productsRepository.atualizaProdutoCarrinho(
        controller.user?.user?.uid, product);
    await getShopCart();
  }

  @action
  Future finalizaCompra() async {
    try {
      await getShopCart();
      await _productsRepository.finalizaCompra(
          controller.user?.user?.uid, carrinho, total.toString());
      await _productsRepository.deleteShopCar(controller.user?.user?.uid);
      await getShopCart();
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  @action
  Future getPedidos() async {
    try {
      pedidos =
          await _productsRepository.getPedidos(controller.user?.user?.uid);
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }

  @action
  Future deleteProduct(String key) async {
    try {
      await _productsRepository.delete(key);
      await getAll();
    } catch (e) {
      throw Exception('Failed to add product to cart: $e');
    }
  }
}
