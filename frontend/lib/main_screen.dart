import 'package:flutter/material.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/mypage/mypage_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int index = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    MypageScreen(),
  ];

  void _onTapped(int index){
    setState(() {
      index = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: IndexedStack(
        index: index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
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