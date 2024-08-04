import 'package:flutter/material.dart';


class ServicesItem {
  final String title;
  final String? routeName;
  final IconData icon;

  ServicesItem({required this.title, required this.icon,this.routeName});
}

List<ServicesItem> userServicesItem = [
  ServicesItem(title: 'رحلات', icon: Icons.calendar_month),
  ServicesItem(title: 'الاشتراكات', icon: Icons.card_membership),
  ServicesItem(title: 'الإيواء', icon: Icons.add_home_outlined),
  ServicesItem(title: 'المدربين', icon: Icons.add_home_outlined),
  // Add more objects as needed
];


List<ServicesItem> coachServicesItem = [
  ServicesItem(title: 'الاشتراكات', icon: Icons.card_membership),
  // Add more objects as needed
];


List<ServicesItem> adminServicesItem = [
  ServicesItem(title: 'الاشتراكات', icon: Icons.card_membership),
  ServicesItem(title: 'الإيواء', icon: Icons.add_home_outlined),
  ServicesItem(title: 'المدربين', icon: Icons.add_home_outlined),
  // Add more objects as needed
];



