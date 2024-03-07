import 'dart:developer';

import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:eshop_app/src/core/repositories/repository.dart';
import 'package:eshop_app/src/core/services/api_service/service_api.dart';
import 'package:eshop_app/src/core/ultils/api_ultil.dart';

class IProductRepository extends ProductRepository {


  final ClientService _client;
  IProductRepository(ClientService client) :_client = client;

  @override
  Future<Products> getResponse() async {
    try {
      final result =
          await _client.getService().get(API_URL.REQUEST_API_PRODUCTS);
      return Products.fromMap(result.data);
    } catch (error, stackTrace) {
      log('Erro na em buscar lista de produtos',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
