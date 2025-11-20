import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/models/my_bookmarks_brand.dart';
import 'package:frontend/widgets/home/bookmarks_card.dart';

final List<BookmarksBrand> bookmarkBrands = [
  BookmarksBrand(
    logoImagePath: 'assets/images/logo_burgerking.png',
    promotionText: '할인 프로모션 진행중',
    promotionColor: Colors.grey.shade700,
    brandName: '버거킹',
    category: '햄버거',
    promotionCount: '15개 이상 진행',
  ),
  BookmarksBrand(
    logoImagePath: 'assets/images/logo_burgerking.png',
    promotionText: '신메뉴 출시',
    promotionColor: const Color.fromARGB(255, 150, 40, 37), // 맥도날드 붉은색
    brandName: '맥도날드',
    category: '햄버거',
    promotionCount: '프로모션 없음',
  ),
  BookmarksBrand(
    logoImagePath: 'assets/images/logo_burgerking.png',
    promotionText: '할인 프로모션 진행중',
    promotionColor: Colors.grey.shade700,
    brandName: '신전떡볶이',
    category: '떡볶이',
    promotionCount: '7개 진행',
  ),
  // ... 추가 브랜드
];

class MyBookmarks extends StatelessWidget {
  const MyBookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(
          height: 190.0, // 높이 고정 필수
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row( // ListView.builder 대신 Row 사용
              children: List.generate(bookmarkBrands.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0,
                    right: index == bookmarkBrands.length - 1 ? 16.0 : 8.0,
                  ),
                  child: BookmarksCard(brand: bookmarkBrands[index]),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}