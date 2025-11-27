import 'package:flutter/material.dart';
import 'package:frontend/widgets/brand-promotion/popular_search_section.dart';

class SearchPromotion extends StatefulWidget {
  const SearchPromotion({super.key});

  @override
  State<SearchPromotion> createState() => _SearchPromotionState();
}

class _SearchPromotionState extends State<SearchPromotion> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFAFB8C1)),
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SearchBar(
            controller: _textController,
            hintText: "매장명, 프로모션 검색",
            hintStyle: WidgetStateProperty.all(
              TextStyle(
                color: Colors.grey[400],
                fontFamily: "Pretendard",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.grey[050]!),
            elevation: WidgetStateProperty.all<double>(0.0),
            trailing: [
              IconButton(onPressed: () {_textController.clear();}, icon: Icon(Icons.cancel)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
            shape: WidgetStateProperty.all(
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            constraints: BoxConstraints(maxHeight: 60),
          ),
        ),
      ),
      // 인기 검색어
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0,20.0,20.0,25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PopularSearchSection(
                onKeywordTap: (keyword){
                  setState(() {
                    _textController.text = keyword;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
