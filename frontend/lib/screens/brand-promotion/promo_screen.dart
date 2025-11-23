import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/screens/brand-promotion/detail_promotion.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';
import 'package:frontend/widgets/brand-promotion/brand_promotion_widgets.dart';
import 'package:frontend/models/menu_category.dart';

class PromoScreen extends StatefulWidget {
  final MenuCategory initialCategory;

  const PromoScreen({
    super.key,
    this.initialCategory = MenuCategory.pizza,
  });

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

//promo-screen build
class _PromoScreenState extends State<PromoScreen> {
  late MenuCategory _selectedCategory;

  @override
  void initState(){
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  Widget _buildMenuItem(MenuCategory category) {
    bool isSelected = (_selectedCategory == category);

    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = category;
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
            Expanded(child: SvgPicture.asset(category.imagePath, height: 35)),
            Text(
              category.label,
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
                  children: MenuCategory.values.map((category){
                    return _buildMenuItem(category);
                  }).toList(),
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
