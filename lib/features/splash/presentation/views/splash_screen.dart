import 'package:bookly/constants.dart';
import 'package:bookly/features/splash/presentation/views/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getHeight=MediaQuery.of(context).size.height;
    print("getHeight=$getHeight");
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}