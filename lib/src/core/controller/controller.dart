import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:eshop_app/src/core/repositories/repository.dart';

class Controller with ChangeNotifier {
  final ProductRepository _productRepository;
  Controller(this._productRepository) {
    loadingItens();
  }

  ValueNotifier<Products?> products = ValueNotifier<Products?>(null);

  bool isLoading = false;
  Future<void> loadingItens() async {
    isLoading = true;
    notifyListeners();

    try {
      products.value = await _productRepository.getResponse();
      notifyListeners();
    } catch (error, stackTrace) {
      log('Erro ao carregar produtos', error: error, stackTrace: stackTrace);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
