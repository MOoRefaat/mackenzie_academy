import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff0D266C),
        body: Stack(children: [
          Positioned.fill(
            child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/logo1.png')),
          )
        ]));
  }
}
