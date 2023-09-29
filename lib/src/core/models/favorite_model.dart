// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eshop_app/src/core/models/products_model.dart';

class Favorite {
  final Product product;
  bool isFavorite;
  Favorite({
    required this.product,
    this.isFavorite = false,
  });

  Favorite copyWith({
    Product? product,
    bool? isFavorite,
  }) {
    return Favorite(
      product: product ?? this.product,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'isFavorite': isFavorite,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) => Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Favorite(product: $product, isFavorite: $isFavorite)';

  @override
  bool operator ==(covariant Favorite other) {
    if (identical(this, other)) return true;
  
    return 
      other.product == product &&
      other.isFavorite == isFavorite;
  }

  @override
  int get hashCode => product.hashCode ^ isFavorite.hashCode;
}
List<Favorite> favoriteItemsFromJson(String json) {
  final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
  return parsed.map<Favorite>((json) => Favorite.fromJson(json)).toList();
}

String favoriteItemsToJson(List<Favorite> favoriteItems) {
  final List<Map<String, dynamic>> data = favoriteItems
      .map((item) => item.toJson())
      .cast<Map<String, dynamic>>()
      .toList();
  return jsonEncode(data);
}
