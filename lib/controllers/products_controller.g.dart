// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsController on _ProductsControllerBase, Store {
  late final _$produtosAtom =
      Atom(name: '_ProductsControllerBase.produtos', context: context);

  @override
  List<Product> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<Product> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  late final _$carrinhoAtom =
      Atom(name: '_ProductsControllerBase.carrinho', context: context);

  @override
  List<Product> get carrinho {
    _$carrinhoAtom.reportRead();
    return super.carrinho;
  }

  @override
  set carrinho(List<Product> value) {
    _$carrinhoAtom.reportWrite(value, super.carrinho, () {
      super.carrinho = value;
    });
  }

  late final _$totalAtom =
      Atom(name: '_ProductsControllerBase.total', context: context);

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: '_ProductsControllerBase.favorites', context: context);

  @override
  List<int> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<int> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$pedidosAtom =
      Atom(name: '_ProductsControllerBase.pedidos', context: context);

  @override
  List<Orders> get pedidos {
    _$pedidosAtom.reportRead();
    return super.pedidos;
  }

  @override
  set pedidos(List<Orders> value) {
    _$pedidosAtom.reportWrite(value, super.pedidos, () {
      super.pedidos = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('_ProductsControllerBase.getAll', context: context);

  @override
  Future<dynamic> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$addProductAsyncAction =
      AsyncAction('_ProductsControllerBase.addProduct', context: context);

  @override
  Future<dynamic> addProduct(Product product) {
    return _$addProductAsyncAction.run(() => super.addProduct(product));
  }

  late final _$getShopCartAsyncAction =
      AsyncAction('_ProductsControllerBase.getShopCart', context: context);

  @override
  Future<dynamic> getShopCart() {
    return _$getShopCartAsyncAction.run(() => super.getShopCart());
  }

  late final _$getFavoritesItensAsyncAction = AsyncAction(
      '_ProductsControllerBase.getFavoritesItens',
      context: context);

  @override
  Future<dynamic> getFavoritesItens() {
    return _$getFavoritesItensAsyncAction.run(() => super.getFavoritesItens());
  }

  late final _$removeFavoriteItemAsyncAction = AsyncAction(
      '_ProductsControllerBase.removeFavoriteItem',
      context: context);

  @override
  Future<dynamic> removeFavoriteItem(int index) {
    return _$removeFavoriteItemAsyncAction
        .run(() => super.removeFavoriteItem(index));
  }

  late final _$addProductFavoriteAsyncAction = AsyncAction(
      '_ProductsControllerBase.addProductFavorite',
      context: context);

  @override
  Future<dynamic> addProductFavorite(int index) {
    return _$addProductFavoriteAsyncAction
        .run(() => super.addProductFavorite(index));
  }

  late final _$atualizarProductCarrinhoAsyncAction = AsyncAction(
      '_ProductsControllerBase.atualizarProductCarrinho',
      context: context);

  @override
  Future<dynamic> atualizarProductCarrinho(Product product) {
    return _$atualizarProductCarrinhoAsyncAction
        .run(() => super.atualizarProductCarrinho(product));
  }

  late final _$finalizaCompraAsyncAction =
      AsyncAction('_ProductsControllerBase.finalizaCompra', context: context);

  @override
  Future<dynamic> finalizaCompra() {
    return _$finalizaCompraAsyncAction.run(() => super.finalizaCompra());
  }

  late final _$getPedidosAsyncAction =
      AsyncAction('_ProductsControllerBase.getPedidos', context: context);

  @override
  Future<dynamic> getPedidos() {
    return _$getPedidosAsyncAction.run(() => super.getPedidos());
  }

  late final _$deleteProductAsyncAction =
      AsyncAction('_ProductsControllerBase.deleteProduct', context: context);

  @override
  Future<dynamic> deleteProduct(String key) {
    return _$deleteProductAsyncAction.run(() => super.deleteProduct(key));
  }

  late final _$_ProductsControllerBaseActionController =
      ActionController(name: '_ProductsControllerBase', context: context);

  @override
  void getTotal() {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.getTotal');
    try {
      return super.getTotal();
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produtos: ${produtos},
carrinho: ${carrinho},
total: ${total},
favorites: ${favorites},
pedidos: ${pedidos}
    ''';
  }
}
