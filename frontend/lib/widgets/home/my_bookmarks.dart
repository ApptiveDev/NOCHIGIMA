import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class MyBookmarks extends StatelessWidget{
  final List<Map<String, String>> bookmarks;
  const MyBookmarks({super.key, required this.bookmarks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '나의 즐겨찾기',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '전체보기 >',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w400,
                  color: AppColors.nochigimaColor,
                ),
              ),
            ],
          ),
        ),
        Container(

        ),
      ],
    );
  }
}