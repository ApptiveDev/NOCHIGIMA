import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  int index = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    PromoScreen(),
    SocialScreen(),
    MypageScreen(),
  ];

  void _onTapped(int index){
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context){

    final Color activeColor = Color(0xFF333F);
    final Color inactiveColor = Colors.grey[300]!;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: IndexedStack(
        index: index,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/nav_home.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  inactiveColor,
                  BlendMode.srcIn,
                )
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '검색',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_mall),
              label: '우리동네',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.commute),
              label: '소셜',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '마이'
            ),
          ],
      currentIndex: index,
      selectedItemColor: Colors.red,
      onTap: _onTapped,
      ),
    );
  }
}