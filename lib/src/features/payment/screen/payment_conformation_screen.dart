import 'package:eshop_app/src/features/cart/controller/cart_controller.dart';
import 'package:eshop_app/src/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contrl = context.watch<CartContrl>();

    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        title: const Text('Confirmação de Pagamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Obrigado por sua compra!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Resumo do Pagamento:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Total Pago: \$ ${contrl.calcularTotalCarrinho(contrl.cartItems).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                focusNode:
                  FocusNode(canRequestFocus: contrl.cartItems.isNotEmpty),
              onPressed: contrl.cartItems.isEmpty
                  ? () {}
                  : () {
                contrl.cartItems.clear();

                Navigator.pushAndRemoveUntil(
                  
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              child: const Text('Voltar à Página Inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
