import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/core/app_colors.dart';

import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/mypage/mypage_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/screens/brand-promotion/promo_screen.dart';
import 'package:frontend/screens/social/social_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    PromoScreen(),
    SocialScreen(),
    MypageScreen(),
  ];

  void _onTapped(int index){
    setState(() {
      this._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){

    BottomNavigationBarItem svgItem(String asset, String label, int idx){
      final bool active = _selectedIndex == idx;
      final Color color = active? AppColors.nochigimaColor : Colors.grey[300]!;

      return BottomNavigationBarItem(icon: SvgPicture.asset(
        asset,
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      label: label,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main screen'),
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 89,

        color: Colors.white,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildCustomNavItem(
              index:0,
              assetName: 'assets/images/nav_home.svg',
              label:'홈',
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.white,
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: _selectedIndex,
      //     onTap: _onTapped,
      //
      //     selectedItemColor: AppColors.nochigimaColor,
      //     unselectedItemColor: Colors.grey[300],
      //     items: <BottomNavigationBarItem>[
      //       svgItem('assets/images/nav_home.svg', '홈', 0),
      //       svgItem('assets/images/nav_search.svg', '검색', 1),
      //       svgItem('assets/images/nav_ourtown.svg', '우리동네', 2),
      //       svgItem('assets/images/nav_social.svg', '소셜', 3),
      //       svgItem('assets/images/nav_mypage.svg', '마이', 4),
      //     ],
      // ),
    );
  }
}