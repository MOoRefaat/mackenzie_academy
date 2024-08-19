import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    this.addingBackArrow,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final bool? addingBackArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          addingBackArrow ?? true, // This removes the back arrow
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF0A155A),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/logo1.png',
            width: 200,
            height: 75,
            //   fit: BoxFit.none,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/Menu.svg',
            width: 78,
            height: 40,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    );
  }
}
