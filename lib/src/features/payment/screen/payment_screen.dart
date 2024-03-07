import 'package:eshop_app/src/features/cart/controller/cart_controller.dart';
import 'package:eshop_app/src/features/payment/screen/payment_conformation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contrl = context.watch<CartContrl>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Pagamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Resumo do Pedido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: contrl.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = contrl.cartItems[index];

                  return ListTile(
                    title: Text(cartItem.product.title!),
                    subtitle: Text('Quantidade: ${cartItem.quantity}'),
                    trailing: Text(
                      '\$ ${(cartItem.product.price! * cartItem.quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Total a Pagar:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$ ${contrl.calcularTotalCarrinho(contrl.cartItems).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              focusNode:
                  FocusNode(canRequestFocus: contrl.cartItems.isNotEmpty),
              onPressed: contrl.cartItems.isEmpty
                  ? () {}
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          maintainState: true,
                          fullscreenDialog: true,
                          builder: (_) => const PaymentConfirmationScreen(),
                        ),
                      );
                    },
              child: const Text('Finalizar Pagamento'),
            ),
          ],
        ),
      ),
    );
  }
}
