import 'package:flutter/material.dart';

class BookmarksBrand {
  final String logoImagePath;
  final String promotionText;
  final Color promotionColor;
  final String brandName;
  final String category;
  final String promotionCount;

  FavoriteBrand({
    required this.logoImagePath,
    required this.promotionText,
    required this.promotionColor,
    required this.brandName,
    required this.category,
    required this.promotionCount,
  });
}