import 'package:flutter/material.dart';
import 'dart:ui';
import './setting_name.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

      return Settingname(); // login -> if 기존 회원: nickname 패쓰, db에 있는거 가져오기/elif 새로운회원: nickname 설정 -> 시작하기page
  }
}

