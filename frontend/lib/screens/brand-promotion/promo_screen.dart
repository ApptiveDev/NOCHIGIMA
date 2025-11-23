import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/screens/brand-promotion/detail_promotion.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';
import 'package:frontend/widgets/brand-promotion/brand_promotion_widgets.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

//promo-screen build
class _PromoScreenState extends State<PromoScreen> {
  int _selectedIndex = 0;

  Widget _buildMenuItem(int index, String label, String image) {
    bool isSelected = (_selectedIndex == index);
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: isSelected
                ? BorderSide(color: Colors.grey[800]!, width: 2)
                : BorderSide(color: Color(0xFFF3F4F8)!, width: 1),
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SvgPicture.asset(image, height: 35)),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                color: isSelected ? Colors.black : Colors.grey[600],
                fontFamily: "Prentendard",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildMenuItem(0, "피자", "assets/images/menu/menu_pizza.svg"),
                    _buildMenuItem(1, "햄버거", "assets/images/menu/menu_hamburger.svg"),
                    _buildMenuItem(2, "카페", "assets/images/menu/menu_cafe.svg"),
                    _buildMenuItem(3, "떡볶이", "assets/images/menu/menu_tteokbokki.svg"),
                    _buildMenuItem(4, "편의점", "assets/images/menu/menu_convenienceStore.svg"),
                    _buildMenuItem(5, "기타", ""),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                //filter
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //FILTER
                    FilterButton(
                      // 추천순 button
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "추천순",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF323439),
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.expand_more_rounded,
                            color: Color(0xFF323439),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    FilterButton(
                      // 필터 button
                      onPressed: () {},
                      padding: EdgeInsets.all(8.0),
                      borderColor: Color(0xFFE2E4EC),
                      child: Icon(Icons.tune_rounded, color: Color(0xFF323439)),
                    ),
                    SizedBox(width: 8),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Color(0xFFF3F4F8),
                      indent: 4,
                      endIndent: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView(
                  //promo view
                  children: [
                    PromotionBlock(
                      imageURL: "assets/images/test_Mask group.jpg",
                      title: "놓치지마 32% 할인",
                      deadline: "2025.09.12 ~ 2026.05.09",
                    ),
                    PromotionBlock(
                      imageURL: "assets/images/test_Mask group.jpg",
                      title: "공차데이",
                      deadline: "2025.10.11",
                    ),
                    PromotionBlock(
                      imageURL: "assets/images/test_Mask group.jpg",
                      title: "공차데이2",
                      deadline: "2025.10.11",
                    ),
                  ],
                  // click promo -> detail page로 넘어가도록
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingSearchButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
