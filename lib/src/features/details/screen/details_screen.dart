import 'package:eshop_app/src/features/cart/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:eshop_app/src/features/cart/controller/cart_controller.dart';
import 'package:eshop_app/src/core/models/products_model.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartContrl>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.title!,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(product.images![0].toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              product.brand!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              product.description!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cartController.decrementQuantity(product);
                      },
                    ),
                    Text(
                      cartController.getQuantity(product).toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cartController.addToCart(product);
                      },
                    ),
                  ],
                ),
                Text(
                  '\$ ${cartController.calcularTotalCarrinho(context.read<CartContrl>().cartItems)}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
