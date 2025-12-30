import 'package:flutter/material.dart';

class ImageHelper {

  static const String angularDisease = 'https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=400';
  static const String ascochytaDisease = 'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=400';

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
