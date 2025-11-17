import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: GestureDetector(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/appbar_location.svg',
                  width: 15,
                  height: 18,
                  colorFilter: ColorFilter.mode(AppColors.nochigimaColor, BlendMode.srcIn),
                ),
                SizedBox(width: 4),
                Text(
                  '부산대학로 63번길 2',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ],
            ),
          ),
            actions:[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none, color: Colors.black),
              ),
              SizedBox(width: 4),
            ]
        ), // 상단

        body: Row(), // 중단

        bottomNavigationBar: Row(), // 하단

      )
    );
  }
}