import 'package:flutter/material.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';

class PromoMenu extends StatefulWidget {
  const PromoMenu({super.key});

  @override
  State<PromoMenu> createState() => _PromoMenuState();
}

class _PromoMenuState extends State<PromoMenu> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 13),
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
                      _buildMenuItem(0, "피자", ""),
                      _buildMenuItem(1, "햄버거", ""),
                      _buildMenuItem(2, "카페", ""),
                      _buildMenuItem(3, "떡볶이", ""),
                      _buildMenuItem(4, "편의점", ""),
                      _buildMenuItem(5, "기타", ""),
                    ],
                  ),
                ),
                Container(
                  //filter
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
        
                    ],
                  ),
                ),
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
