import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FavoriteButton extends HookWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isFavorite = useState(false);
    return GestureDetector(
      onTap: () {
        isFavorite.value = !isFavorite.value;
      },
      child: Icon(
        isFavorite.value ? Icons.star : Icons.star_outline,
      ),
    )
        .animate(
          target: isFavorite.value ? 1.0 : 0.0,
          autoPlay: false,
        )
        .scale(
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.3, 1.3),
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          begin: const Offset(1.3, 1.3),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeInOut,
        );
  }
}
