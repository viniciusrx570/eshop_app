import 'package:eshop_app/src/features/cart/controller/cart_controller.dart';
import 'package:eshop_app/src/core/controller/controller.dart';
import 'package:eshop_app/src/features/favorite/controller/favorite_controller.dart';
import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:eshop_app/src/core/theme/theme.dart';
import 'package:eshop_app/src/features/details/screen/details_screen.dart';
import 'package:eshop_app/src/features/home/widget/card_item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/card_badge_button.dart';
import '../widget/favorite_badge_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final contrl = context.watch<Controller>();
    final favContrl = context.watch<FavContrl>();
    final cartContrl = context.watch<CartContrl>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          CardBadgeButton(cartContrl: cartContrl),
          FavoriteBadgeButton(favContrl: favContrl),
          Switch(

            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          )
        ],
      ),
      body: contrl.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ValueListenableBuilder<Products?>(
              valueListenable: contrl.products,
              builder: (context, item, __) {
                return item == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.products!.length,
                        itemBuilder: (context, index) {
                          final product = item.products![index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(product: product),
                                ),
                              );
                            },
                            child: CardItemListWidget(
                              product: product,
                              carrinho: cartContrl,
                              favorite: favContrl,
                              index: index,
                            ),
                          );
                        },
                      );
              },
            ),
    );
  }
}
