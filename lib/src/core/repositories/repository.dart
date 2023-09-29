import 'package:eshop_app/src/core/models/products_model.dart';

// ===== inversão da Abistração de classes ==== \\

abstract class ProductRepository {
  Future<Products> getResponse();
}
