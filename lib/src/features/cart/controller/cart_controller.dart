import 'package:eshop_app/src/features/cart/data/model/card_model.dart';
import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:eshop_app/src/core/services/storage_service/secure_storage.dart';
import 'package:flutter/material.dart';

class CartContrl with ChangeNotifier {
  final String cartKey = 'cartKey';

  List<Cart> cartItems = [];
  bool isBuy(Product product) {
    return cartItems.any((cartItems) => cartItems.product.id == product.id);
  }

  void addToCart(Product product) {
    final existingCartItemIndex =
        cartItems.indexWhere((cartItems) => cartItems.product.id == product.id);
    notifyListeners();

    if (existingCartItemIndex != -1) {
      cartItems[existingCartItemIndex].quantity++;
      notifyListeners();
    } else {
      cartItems.add(Cart(product: product));
      notifyListeners();
    }
    notifyListeners();
  }

  void removeToQuant(Product product) {
    final existingCartItemIndex =
        cartItems.indexWhere((cartItems) => cartItems.product.id == product.id);
    if (existingCartItemIndex >= 1) {
      cartItems[existingCartItemIndex].quantity--;
    } else {
      cartItems.remove(Cart(product: product));
    }
    notifyListeners();
  }

  void removeToCard(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  double calcularTotalCarrinho(List<Cart> cartItems) {
    double total = 0;
    for (final cartItem in cartItems) {
      total += cartItem.product.price! * cartItem.quantity;
    }
    return total;
  }

  // Método para salvar o carrinho de compras
  Future<void> saveCart() async {
    String cartItemsJson = cartItemsToJson(cartItems);
    await ISecureStorageUtil().saveSecureData('cart_items', cartItemsJson);
  }

  // Método para carregar o carrinho de compras
  Future<void> loadCart() async {
    String? cartItemsJson = await ISecureStorageUtil().getSecureData(cartKey);

    if (cartItemsJson != null) {
      List<Cart> loadedCartItems = cartItemsFromJson(cartItemsJson);
      cartItems = loadedCartItems;
      notifyListeners();
    }
  }

  void decrementQuantity(Product product) {
    final cartItem = cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => Cart(product: product, quantity: 0),
    );

    if (cartItem.quantity > 0) {
      cartItem.quantity--;
      notifyListeners();
    }
  }

  int getQuantity(Product product) {
    final cartItem = cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => Cart(product: product, quantity: 0),
    );

    return cartItem.quantity;
  }
}
