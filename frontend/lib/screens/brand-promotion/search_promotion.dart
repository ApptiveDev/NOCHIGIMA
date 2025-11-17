import 'package:flutter/material.dart';

class SearchPromotion extends StatefulWidget {
  const SearchPromotion({super.key});

  @override
  State<SearchPromotion> createState() => _SearchPromotionState();
}

class _SearchPromotionState extends State<SearchPromotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.navigate_before_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SearchBar(

          hintText: "매장명, 프로모션 검색",
          hintStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.grey[400],
              fontSize: 18,
              fontWeight: FontWeight.w500
            )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[050]!),
          elevation: MaterialStateProperty.all<double>(0.0),
          trailing: [Icon(Icons.search)],
          shape: MaterialStateProperty.all(
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          constraints: BoxConstraints(maxHeight: ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // text
            ),
            Container(
              // 인기 순위
            ),
          ],
        ),
      ),
    );
  }
}
