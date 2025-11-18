import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildMenuItem(0, "피자", "assets/images/menu_pizza.svg"),
                      _buildMenuItem(1,"햄버거", "assets/images/menu_hamburger.svg"),
                      _buildMenuItem(2, "카페", "assets/images/menu_cafe.svg"),
                      _buildMenuItem(3,"떡볶이", "assets/images/menu_tteokbokki.svg"),
                      _buildMenuItem(4,"편의점", "assets/images/menu_convenienceStore.svg"),
                      _buildMenuItem(5, "기타", ""),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  //filter
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      //FILTER
                      ElevatedButton( // 추천순 button
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "추천순",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF323439),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.expand_more_rounded,
                              color: Color(0xFF323439),
                              size: 20,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              color: Color(0xFF323439),
                              width: 1.0,
                            ),
                          ),
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  //promo view
                  // click promo -> detail page로 넘어가도록
                ),
              ],
            ),
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
