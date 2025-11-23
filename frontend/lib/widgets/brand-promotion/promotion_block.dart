import 'package:flutter/material.dart';
// Promotion block
class PromotionBlock extends StatefulWidget {
  final String imageURL;
  final String title;
  final String deadline;
  final List<String> filters;
  final bool isLiked;

  const PromotionBlock({
    super.key,
    required this.imageURL,
    required this.title,
    required this.deadline,
    this.filters = const [],
    this.isLiked = false,
  });

  @override
  State<PromotionBlock> createState() => _PromotionBlockState();
}

class _PromotionBlockState extends State<PromotionBlock> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DetailPromotion()),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imageURL,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                // like
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Text(
                    "하트자리",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // title
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF323439),
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                // deadline
                Text(
                  "행사 기간",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF858C9A),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  height: 12,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 1,
                    indent: 2,
                    color: Color(0xFF858C9A),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.deadline,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF858C9A),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            // filter
          ],
        ),
      ),
    );
  }
}