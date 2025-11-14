import 'package:flutter/material.dart';

class PromoMenu extends StatelessWidget {
  const PromoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                // listview menu bar
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
          onPressed: () {},
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
