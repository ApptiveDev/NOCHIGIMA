import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/widgets/home/home_widgets.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  int _currentBannerPage = 0;
  final List<Map<String, String>> bannerItems = [
    {
      "image": "assets/images/slider_burger.png",
      "title": "골든 에그\n트러플 머쉬룸 출시",
      "subtitle": "가을에 푹-빠질 골든 타임, 신제품 출시",
      "date": "2025.10.06(목) ~ 2026.01.07(수)"
    },
    {
      "image": "assets/images/slider_burger.png",
      "title": "골든 에그\n트러플 머쉬룸 출시",
      "subtitle": "가을에 푹-빠질 골든 타임, 신제품 출시",
      "date": "2025.10.06(목) ~ 2026.01.07(수)"
    },
  ];

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Text('HomeScreen'),
    );
  }
}