import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class PopularSearchSection extends StatefulWidget {
  final Function(String) onKeywordTap;
  const PopularSearchSection({
    super.key,
    required this.onKeywordTap,
  });

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
    _fetchRankingData();
  }

  @override // 백엔드 api 연결
  Future<void> _fetchRankingData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _updateTime = "13:00";
        _rankings = [
          "버거킹",
          "맥도날드",
          "롯데리아",
          "순위",
          "순위",
          "버거킹",
          "맥도날드",
          "롯데리아",
          "순위",
          "순위",
        ];
        _isLoading = false;
      });
    }
  }

  Widget _buildRankingItem(int rank, String keyword) {
    Color rankColor = (rank <= 3)
        ? AppColors.nochigimaColor
        : Color(0xFF323439);

    return InkWell(
      onTap: (){
        widget.onKeywordTap(keyword);
        print("$rank등 $keyword");
        },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 11.0),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              child: Text(
                "$rank",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: rankColor,
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              keyword,
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF323439),
              ),
            ),
          ],
        ),
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
              "$_updateTime 업데이트",
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
        if (_isLoading)
          const Center(child: CircularProgressIndicator())
        else
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Expanded(
                    child: Column(
                      children: List.generate(5, (index) {
                        return _buildRankingItem(index + 1, _rankings[index]);
                      }),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: Column(
                      children: List.generate(5, (index) {
                        return _buildRankingItem(index + 6, _rankings[index + 5]);
                      }),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
