import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

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

  Widget _buildRankingItem(int rank, String keyword) {
    Color rankColor = (rank >= 3) ? AppColors.nochigimaColor : Color(0xFF323439);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.0),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              "$rank",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: rankColor,
              ),
            ),
          ),
          SizedBox(
            width: 8
          ),
          Text(
            keyword,
            style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF323439),
            ),
          )
        ],
      ),
    );
  }

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
              _updateTime,
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Color(0xffAFB8C1),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        // 2. ranking list
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: List.generate(5, (index) {
                  return _buildRankingItem(index + 1, _rankings[index]);
                }),
              ),
            ),
            Expanded(child: Column(
              children: List.generate(5, (index){
                return _buildRankingItem(index + 6, _rankings[index+5]);
              }),
            )),
          ],
        ),
      ],
    );
  }
}
