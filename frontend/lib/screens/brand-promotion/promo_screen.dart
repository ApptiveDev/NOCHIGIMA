import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/screens/brand-promotion/detail_promotion.dart';
import 'package:frontend/screens/brand-promotion/search_promotion.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

// filter button
class FilterButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const FilterButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: borderColor ?? Color(0xFF323439), width: 1.0),
        ),
        minimumSize: Size.zero,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: child,
    );
  }
}

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPromotion()),
        );
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

// floatingSearchButton
class FloatingSearchButton extends StatelessWidget {
  const FloatingSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,

      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPromotion()),
          );
        },
        child: Icon(Icons.search, color: Colors.grey[600], size: 35),
        shape: CircleBorder(
          side: BorderSide(color: Colors.grey[200]!, width: 1.0),
        ),
        elevation: 4.5,
        backgroundColor: Colors.white,
      ),
    );
  }
}


//promo-screen build
class _PromoScreenState extends State<PromoScreen> {
  int _selectedIndex = 0;

  Widget _buildMenuItem(int index, String label, String image) {
    bool isSelected = (_selectedIndex == index);
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: isSelected
                ? BorderSide(color: Colors.grey[800]!, width: 2)
                : BorderSide(color: Color(0xFFF3F4F8)!, width: 1),
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SvgPicture.asset(image, height: 35)),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                color: isSelected ? Colors.black : Colors.grey[600],
                fontFamily: "Prentendard",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildMenuItem(0, "피자", "assets/images/menu_pizza.svg"),
                    _buildMenuItem(
                      1,
                      "햄버거",
                      "assets/images/menu_hamburger.svg",
                    ),
                    _buildMenuItem(2, "카페", "assets/images/menu_cafe.svg"),
                    _buildMenuItem(
                      3,
                      "떡볶이",
                      "assets/images/menu_tteokbokki.svg",
                    ),
                    _buildMenuItem(
                      4,
                      "편의점",
                      "assets/images/menu_convenienceStore.svg",
                    ),
                    _buildMenuItem(5, "기타", ""),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                //filter
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //FILTER
                    FilterButton(
                      // 추천순 button
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "추천순",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF323439),
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.expand_more_rounded,
                            color: Color(0xFF323439),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    FilterButton(
                      // 필터 button
                      onPressed: () {},
                      padding: EdgeInsets.all(8.0),
                      borderColor: Color(0xFFE2E4EC),
                      child: Icon(Icons.tune_rounded, color: Color(0xFF323439)),
                    ),
                    SizedBox(width: 8),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Color(0xFFF3F4F8),
                      indent: 4,
                      endIndent: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView(
                  //promo view
                  children: [
                    PromotionBlock(
                      imageURL: "assets/images/test_Mask group.jpg",
                      title: "놓치지마 32% 할인",
                      deadline: "2025.09.12 ~ 2026.05.09",
                    ),
                    PromotionBlock(
                      imageURL: "assets/images/test_Mask group.jpg",
                      title: "공차데이",
                      deadline: "2025.10.11",
                    ),
                    PromotionBlock(
                      imageURL: "assets/images/test_Mask group.jpg",
                      title: "공차데이2",
                      deadline: "2025.10.11",
                    ),
                  ],
                  // click promo -> detail page로 넘어가도록
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingSearchButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
