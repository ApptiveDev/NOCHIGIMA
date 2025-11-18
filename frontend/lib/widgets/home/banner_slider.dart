import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlider extends StatefulWidget{
  final List<Map<String, String>> items;
  const BannerSlider({super.key, required this.items});

  @override
  State<BannerSlider> createState() => _BannerSlider();
}

class _BannerSlider extends State<BannerSlider>{
  int _currentBannerPage = 0;

  @override
  Widget build(BuildContext context){
    if(widget.items.isEmpty){
      return const SizedBox.shrink();
    }

    return CarouselSlider.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index, realIndex){
          return _buildBannerItem(widget.items[index]);
        },
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 16/9,
          viewportFraction: 1.0,
          onPageChanged: (index, reason){
            setState(() {
              _currentBannerPage = index;
            });
          },
        ),
    );
  }

  Widget _buildBannerItem(Map<String, String> item) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(item['image']!, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.5), Colors.transparent, Colors.black.withOpacity(0.6)],
            ),
          ),
        ),
        Positioned(
          top: 16, right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.red,
            child: const Text('NEW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Positioned(
          bottom: 16, left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['title']!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold
                  )
              ),
              const SizedBox(height: 4),
              Text(
                  item['subtitle']!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Pretendard",
                      fontSize: 16
                  )
              ),
              const SizedBox(height: 50),
              Text("판매 기간\n${item['date']!}",
                  style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: "Pretendard",
                      fontSize: 12
                  )
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16, right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
            child: Text(
              // 7. (중요) _currentBannerPage와 widget.items.length를 사용
              '${_currentBannerPage + 1} / ${widget.items.length} | 전체보기',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
