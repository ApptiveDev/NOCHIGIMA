// lib/widgets/home/category_grid.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<Map<String, dynamic>> categories = [
  {"label": "신규이벤트", "icon": "assets/images/menu/menu_newEvent.svg", "color":  const Color(0xFFFFEDED)},
  {"label": "TOP 20", "icon": "assets/images/menu/menu_top20.svg", "color": const Color(0xFFFFEDED)},
  {"label": "치킨", "icon": "assets/images/menu/menu_chicken.svg", "color": const Color(0xFFFDF5E8)},
  {"label": "피자", "icon": "assets/images/menu/menu_pizza.svg", "color": const Color(0xFFFDF5E8)},
  {"label": "햄버거", "icon": "assets/images/menu/menu_hamburger.svg", "color": const Color(0xFFFDF5E8)},
  {"label": "카페", "icon": "assets/images/menu/menu_cafe.svg", "color": const Color(0xFFFFEDED)},
  {"label": "떡볶이", "icon": "assets/images/menu/menu_tteokbokki.svg", "color": const Color(0xFFFDF5E8)},
  {"label": "편의점", "icon": "assets/images/menu/menu_convenienceStore.svg", "color": const Color(0xFFF6EEFF)},
  {"label": "기타", "icon": "", "color": const Color(0xFFF7F7F7)},
];

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
        

        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // 1개의 행에 보여줄 item 수
                crossAxisSpacing: 0.0, // 수직 padding
                mainAxisSpacing: 0.0, // 수평 Padding
                childAspectRatio: 0.8, // item의 가로 1, 세로 2의 비율
            ),

            itemCount: categories.length,

            itemBuilder: (context, index){
              return _CategoryItem(
                  categories[index]['label'] as String,
                  categories[index]['icon']! as String,
                  categories[index]['color'] as Color,
              );
            }
        )
    );
  }

  Widget _CategoryItem(String label, String SvgPath, Color color){
    return InkWell(
      onTap: () {

      },
      child: Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: color,
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

