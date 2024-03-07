import 'package:eshop_app/src/features/favorite/data/model/favorite_model.dart';
import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:eshop_app/src/core/services/storage_service/secure_storage.dart';
import 'package:flutter/material.dart';



class FavContrl with ChangeNotifier {
  final String favoriteKey = 'favoritesKey';

  List<Favorite> favoriteItems = [];

  void addToFavorite(Product product) {
    final existingFavoriteItemIndex = favoriteItems
        .indexWhere((favoriteItems) => favoriteItems.product.id == product.id);

    if (existingFavoriteItemIndex != -1) {
      favoriteItems[existingFavoriteItemIndex].isFavorite = true;
    } else {
      favoriteItems.add(Favorite(product: product));
    }
    notifyListeners();
  }

  void removeToFavorite(int index) {
    favoriteItems.removeAt(index);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return favoriteItems
        .any((favoriteItem) => favoriteItem.product.id == product.id);
  }



  // Método para salvar o carrinho de compras
  Future<void> saveFavorite() async {
    String fariteItemsJson = favoriteItemsToJson(favoriteItems);
    await ISecureStorageUtil().saveSecureData(favoriteKey, fariteItemsJson);
  }

  // Método para carregar o carrinho de compras
  Future<void> loadFavorite() async {
    String? favoriteItemsJson =
        await ISecureStorageUtil().getSecureData(favoriteKey);

    if (favoriteItemsJson != null) {
      List<Favorite> loadedFavoriteItems =
          favoriteItemsFromJson(favoriteItemsJson);
      favoriteItems = loadedFavoriteItems;
      notifyListeners();
    }
  }
}
