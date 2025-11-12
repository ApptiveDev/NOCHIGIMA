import 'package:flutter/material.dart';
import 'dart:ui';
import './setting_name.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  void _handleLogin(BuildContext context, String provider) async {
    String? socialId;
    try {
      if (provider == 'kakao') {
        print("카카오 로그인 실행");
      } else if (provider == 'google') {
        print("구글 로그인 실행");
      }

      bool isNewUser = true;
      if (isNewUser) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settingname()),
        );
      } else {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => home()),
        // )
      }
    } catch (error) {
      print("$provider 로그인Error : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // 놓치지마 로고 img
              ),
              Text(
                "세상의 모든 프로모션을 모아 한눈에",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 100), // sparser()로 해야하나?
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _handleLogin(context, 'kakao');
                  },
                  // icon: Image(im),
                  label: Text(
                    "카카오로 시작하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFDE500),
                    disabledBackgroundColor: Color(0xFFFDE500),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                // google로 시작하기 버튼
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _handleLogin(context, 'google');
                  },
                  //icon: , google icon삽입
                  label: Text(
                    "Google로 시작하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey[900]!, width: 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
