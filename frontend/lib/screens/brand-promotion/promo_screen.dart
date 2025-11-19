import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class FilterButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const FilterButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: borderColor ?? Color(0xFF323439), width: 1.0),
        ),
        minimumSize: Size.zero,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: child,
    );
  }
}

class PromotionBlock extends StatefulWidget {
  
  const PromotionBlock({super.key});

  @override
  State<PromotionBlock> createState() => _PromotionBlockState();
}

class _PromotionBlockState extends State<PromotionBlock> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        child: Column(
          children: [
            // img + like
            // title, detail
            // filter
          ],
        ),
      ),
    );
  }
}


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
                : BorderSide(color: Colors.grey[200]!, width: 0.5),
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
                    _buildMenuItem(0, "피자", "assets/images/menu_pizza.svg"),
                    _buildMenuItem(1,"햄버거","assets/images/menu_hamburger.svg"),
                    _buildMenuItem(2, "카페", "assets/images/menu_cafe.svg"),
                    _buildMenuItem(3,"떡볶이","assets/images/menu_tteokbokki.svg"),
                    _buildMenuItem(4,"편의점","assets/images/menu_convenienceStore.svg"),
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
                child: Container(
                  //promo view
                  // click promo -> detail page로 넘어가도록
                ),
              ),
            ],
          ),
        ),
      ),
      // floating search
      floatingActionButton: Container(
        height: 60,
        width: 60,

        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPromotion()),
            );
          },
          child: Icon(Icons.search, color: Colors.grey[600], size: 35),
          shape: CircleBorder(
            side: BorderSide(color: Colors.grey[200]!, width: 1.0),
          ),
          elevation: 4.5,
          backgroundColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
