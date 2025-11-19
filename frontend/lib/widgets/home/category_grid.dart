// lib/widgets/home/category_grid.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<Map<String, String>> categories = [
  {"label": "신규이벤트", "icon": "assets/images/menu/menu_newEvent.svg"},
  {"label": "TOP 20", "icon": "assets/images/menu/menu_top20.svg"},
  {"label": "치킨", "icon": "assets/images/menu/menu_chicken.svg"},
  {"label": "피자", "icon": "assets/images/menu/menu_pizza.svg"},
  {"label": "햄버거", "icon": "assets/images/menu/menu_hamburger.svg"},
  {"label": "카페", "icon": "assets/images/menu/menu_cafe.svg"},
  {"label": "떡볶이", "icon": "assets/images/menu/menu_tteokbokki.svg"},
  {"label": "편의점", "icon": "assets/images/menu/menu_convenienceStore.svg"},
  {"label": "기타", "icon": "assets/images/menu/menu_convenienceStore.svg"},
];

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),

        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // 1개의 행에 보여줄 item 수
                crossAxisSpacing: 1.0, // 수직 padding
                mainAxisSpacing: 0.0, // 수평 Padding
                childAspectRatio: 0.8, // item의 가로 1, 세로 2의 비율
            ),

            itemCount: categories.length,

            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child:  _CategoryItem(
                  categories[index]['label']!,
                  categories[index]['icon']!,
                ),
              );
            }
        )
    );
  }

  Widget _CategoryItem(String label, String SvgPath){
    return InkWell(
      onTap: () {

      },
      child: Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: Color(0xFFFFEDED),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: SvgPicture.asset(
              SvgPath,
              width: 40,
              height: 40,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w500,
          ),
        )
      ],
      ),
    );
  }
}

