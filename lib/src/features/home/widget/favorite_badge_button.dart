import 'package:eshop_app/src/core/controller/favorite_controller.dart';
import 'package:eshop_app/src/features/favorite/screen/favorite_screen.dart';
import 'package:flutter/material.dart';

class FavoriteBadgeButton extends StatelessWidget {
  const FavoriteBadgeButton({
    super.key,
    required this.favContrl,
  });

  final FavContrl favContrl;

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      isLabelVisible: favContrl.favoriteItems.isNotEmpty ? true: false,
      count: favContrl.favoriteItems.length,
      backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      offset: Offset.zero,
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoriteScreen(),
            ),
          );
        },
        icon: const Icon(Icons.favorite_border_outlined),
      ),
    );
  }
}
