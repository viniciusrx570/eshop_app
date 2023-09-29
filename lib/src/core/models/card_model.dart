// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eshop_app/src/core/models/products_model.dart';
class Cart {
  final Product product;
  int quantity;
  Cart({
    required this.product,
    this.quantity = 1,
  });

  Cart copyWith({
    Product? product,
    int? quantity,
  }) {
    return Cart(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(product: $product, quantity: $quantity)';

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}

List<Cart> cartItemsFromJson(String json) {
  final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
  return parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
}

String cartItemsToJson(List<Cart> cartItems) {
  final List<String> data = cartItems.map((item) => item.toJson()).toList();
  return jsonEncode(data);
}