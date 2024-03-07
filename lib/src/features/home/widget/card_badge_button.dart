import 'package:eshop_app/src/features/cart/controller/cart_controller.dart';
import 'package:eshop_app/src/features/cart/screen/cart_screen.dart';
import 'package:flutter/material.dart';

class CardBadgeButton extends StatelessWidget {
  const CardBadgeButton({
    super.key,
    required this.cartContrl,
  });

  final CartContrl cartContrl;

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      offset: Offset.zero,
      isLabelVisible: cartContrl.cartItems.isNotEmpty ? true : false ,
      count: cartContrl.cartItems.length,
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
