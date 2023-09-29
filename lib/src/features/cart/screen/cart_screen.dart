import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eshop_app/src/core/controller/cart_controller.dart';
import 'package:eshop_app/src/features/payment/screen/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartContrl>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartController.cartItems[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          cartItem.product.images![0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        cartItem.product.title!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preço: \$${cartItem.product.price!.toStringAsFixed(2)}',
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    cartController.decrementQuantity(cartItem.product);
                                  });
                                },
                              ),
                              Text(
                                cartController.getQuantity(cartItem.product).toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    cartController.addToCart(cartItem.product);
                                  });
                                },
                              ),
                            ],
                          ),
                          Text(
                            'Total: \$${(cartItem.product.price! * cartItem.quantity).toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            cartController.removeToCard(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${cartController.calcularTotalCarrinho(cartController.cartItems).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  focusNode: FocusNode(
                    canRequestFocus: cartController.cartItems.isNotEmpty,
                  ),
                  onPressed: cartController.cartItems.isEmpty
                      ? () {}
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PaymentScreen(),
                            ),
                          );
                        },
                  child: const Text('Finalizar Compra'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
