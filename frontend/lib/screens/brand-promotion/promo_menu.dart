import 'package:flutter/material.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';


class PromoMenu extends StatefulWidget {
  const PromoMenu({super.key});

  @override
  State<PromoMenu> createState() => _PromoMenuState();
}

class _PromoMenuState extends State<PromoMenu> {
  Widget _buildMenuItem(int index, String label, String image){
    return InkWell(

    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildMenuItem("피자", ""),
                    _buildMenuItem("햄버거", ""),
                    _buildMenuItem("카페", ""),
                    _buildMenuItem("떡볶이", ""),
                    _buildMenuItem("편의점", ""),
                    _buildMenuItem("기타", ""),
                  ],
                ),
              ),
              Container(
                //filter
              ),
              Container(
                //promo view
                // click promo -> detail page로 넘어가도록
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
              MaterialPageRoute(builder: (context)=>SearchPromotion()),
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
