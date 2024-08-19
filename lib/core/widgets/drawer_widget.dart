import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final Image currentAccountPicture;
  final List<DrawerItem> drawerItems;

  const CustomDrawer({
    Key? key,
    required this.accountName,
    required this.accountEmail,
    required this.currentAccountPicture,
    required this.drawerItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 227,
      backgroundColor: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(accountName),
              accountEmail: Text(accountEmail),
              currentAccountPicture: currentAccountPicture,
              decoration: const BoxDecoration(
                color: Color(0xFF0A155A),
              ),
            ),
            ...drawerItems.map((item) {
              return ListTile(
                leading: item.leading,
                title: Text(item.title, style: item.titleStyle),
                onTap: item.onTap,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  final Widget? leading;
  final String title;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;

  DrawerItem({
    this.leading,
    this.titleStyle,
    required this.title,
    this.onTap,
  });
}
