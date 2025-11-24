import 'package:flutter/material.dart';

class PopularSearchSection extends StatefulWidget {
  const PopularSearchSection({super.key});

  @override
  State<PopularSearchSection> createState() => _PopularSearchSectionState();
}

class _PopularSearchSectionState extends State<PopularSearchSection> {
  String _updateTime = "";
  List<String> _rankings = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    //_fetchRankingData();
  }

  @override
  // void _fetchRankingData(){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,

          children: [
            Text(
              "인기 검색어",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "13:00 업데이트", // _updateTime으로 수정
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Color(0xffAFB8C1),
              ),
            ),
          ],
        ),
        // 2. ranking list

      ],
    );
  }
}
