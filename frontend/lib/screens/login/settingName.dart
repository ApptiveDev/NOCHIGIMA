import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

class Settingname extends StatefulWidget {
  const Settingname({super.key});

  @override
  State<Settingname> createState() => _SettingnameState();
}

class _SettingnameState extends State<Settingname> {

  void submitButton(buttons){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "닉네임을 입력하세요",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                )
            ),
            SizedBox(height: 20),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "닉네임 입력",
                  hintStyle: TextStyle(
                    color: Colors.grey[400]
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF333F), width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF333F), width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "2~8자까지 입력할 수 있어요.",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.normal
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity, // 너비를 화면에 꽉 채움
              height: 70, // 버튼 높이 지정 (선택 사항)
              child: ElevatedButton(
                onPressed: () {
                  submitButton('next');
                },
                child: Text(
                  "다음",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFD9DC),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
            ),
            ),
            SizedBox(height: 20),
            ],
        ),
      ),
    );
  }
}
