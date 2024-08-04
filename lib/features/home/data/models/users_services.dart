import 'package:flutter/material.dart';
import 'package:mackenzie_academy/features/home/data/models/services_item.dart';

enum UserType {
  admin,
  coach,
  user,
}

class UsersServices {
  final List<ServicesItem> servicesList;
  final UserType userType;

  UsersServices({required this.servicesList, required this.userType});
}


UsersServices adminServices = UsersServices(userType: UserType.admin,servicesList: adminServicesItem);
UsersServices userServices = UsersServices(userType: UserType.user,servicesList: userServicesItem);
UsersServices coachServices = UsersServices(userType: UserType.coach,servicesList: coachServicesItem);
