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
        iconTheme: IconThemeData(color: Color(0xFFAFB8C1)),
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before_rounded,
            color: Colors.black,
            size: 30,
          ),
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
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[050]!),
          elevation: MaterialStateProperty.all<double>(0.0),
          trailing: [
            IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          shape: MaterialStateProperty.all(
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          constraints: BoxConstraints(maxHeight: 60),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,

                children: [
                  Text(
                    "인기 검색어",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "13:00 업데이트",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Color(0xffAFB8C1),
                    ),
                  ),
                ],
              ),
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
