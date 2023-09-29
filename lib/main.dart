import 'package:eshop_app/src/app.dart';
import 'package:eshop_app/src/core/controller/cart_controller.dart';
import 'package:eshop_app/src/core/controller/controller.dart';
import 'package:eshop_app/src/core/controller/favorite_controller.dart';
import 'package:eshop_app/src/core/repositories/i_reprository.dart';
import 'package:eshop_app/src/core/services/api_service/i_service_api_.dart';
import 'package:eshop_app/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartContrl>(
          create: (context) => CartContrl(),
        ),
        ChangeNotifierProvider<FavContrl>(
          create: (context) => FavContrl(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Controller(
            IProductRepository(
              IClientService(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
