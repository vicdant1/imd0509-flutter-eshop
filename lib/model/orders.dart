// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f05_eshop/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable()
class Orders {
  int id;
  String data;
  List<Product> itens;
  String total;
  Orders({
    required this.id,
    required this.data,
    required this.itens,
    required this.total,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}
