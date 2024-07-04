
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0D266C),
      body: Stack(
        children: [
      Positioned.fill(
      child: SvgPicture.asset(
        'assets/images/loogoSvg.svg',
        fit: BoxFit.fitWidth,
      ),
    )])
    );
  }
  }