import 'package:flutter/material.dart';

class Namecomplete extends StatelessWidget {
  final String nickName;
  const Namecomplete({
    super.key,
    required this.nickName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
              ),
              SizedBox(height: 37),
              Text(
                "회원가입 완료!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: nickName,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: " 님,\n환영해요!",
                      ),
                    ]
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed:(){

                  },
                  child: Text(
                    "놓치지마 시작하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF333F),
                      disabledBackgroundColor: Color(0xFFFF333F),
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
      ),
    );
  }
}
