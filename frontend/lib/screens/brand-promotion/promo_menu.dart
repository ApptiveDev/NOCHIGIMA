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
      floatingActionButton: FloatingActionButton(onPressed: (){})
    );
  }
}
