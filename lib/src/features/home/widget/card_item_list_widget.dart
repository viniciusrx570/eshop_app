import 'package:eshop_app/src/features/cart/controller/cart_controller.dart';
import 'package:eshop_app/src/features/favorite/controller/favorite_controller.dart';
import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:flutter/material.dart';

class CardItemListWidget extends StatelessWidget {
  const CardItemListWidget({
    super.key,
    required this.product,
    required this.carrinho,
    required this.favorite,
    required this.index,
  });
  final int index;
  final Product product;
  final CartContrl carrinho;
  final FavContrl favorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 130,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(product.images![0]), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      product.title!,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ),
            
                  Text(
                    '\$ ${product.price!.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            IconButton(
              isSelected: carrinho.isBuy(product),
              selectedIcon: const Icon(Icons.shopping_cart_checkout),
              onPressed: () {
                carrinho.addToCart(product);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            IconButton(
              isSelected: favorite.isFavorite(product),
              selectedIcon: const Icon(Icons.favorite),
              onPressed: () {
                if (favorite.isFavorite(product)) {
                  favorite.removeToFavorite(index);
                } else {
                  favorite.addToFavorite(product);
                }
              },
              icon: const Icon(
                Icons.favorite_outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
