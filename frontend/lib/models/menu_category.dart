import 'package:flutter/material.dart';

enum MenuCategory {
  pizza('피자', 'assets/images/menu/menu_pizza.svg'),
  burger('햄버거', 'assets/images/menu/menu_hamburger.svg'),
  cafe('카페', 'assets/images/menu/menu_cafe.svg'),
  tteokbokki('떡볶이', 'assets/images/menu/menu_tteokbokki.svg'),
  convenience('편의점', 'assets/images/menu/menu_convenienceStore.svg'),
  etc('기타', 'assets/images/menu/menu_top20.svg');

  final String label;
  final String imagePath;

  const MenuCategory(this.label, this.imagePath);
}