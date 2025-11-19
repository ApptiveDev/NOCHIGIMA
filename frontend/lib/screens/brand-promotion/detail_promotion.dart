import 'package:flutter/material.dart';

class DetailPromotion extends StatefulWidget {
  const DetailPromotion({super.key});

  @override
  State<DetailPromotion> createState() => _DetailPromotionState();
}

class _DetailPromotionState extends State<DetailPromotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("DetailPromotionPage")));
  }
}
