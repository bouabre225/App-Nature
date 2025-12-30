import 'package:flutter/material.dart';

class ImageHelper {
  // Network images for plants (using placeholder services)
  static const String basil = 'https://images.unsplash.com/photo-1618375569909-3c8616cf7733?w=400';
  static const String carrots = 'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=400';
  static const String zucchini = 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=400';
  static const String gherkin = 'https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?w=400';

  // Diseases
  static const String angularDisease = 'https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=400';
  static const String ascochytaDisease = 'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=400';

  // Plants varieties
  static const String garlic = 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400';
  static const String lettuce = 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400';
  static const String tomatoes = 'https://images.unsplash.com/photo-1592841200221-a6898f307baa?w=400';

  // Helper widget to load images with fallback
  static Widget buildNetworkImage(
      String url, {
        double? width,
        double? height,
        BoxFit fit = BoxFit.cover,
        Widget? placeholder,
      }) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
              strokeWidth: 2,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: placeholder ??
              const Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 40,
              ),
        );
      },
    );
  }
}
