import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _loginWidget(
        context: context
    );
  }

  _loginWidget(
      {String? errorUserName,
        String? errorPassword,
        required BuildContext context}) {
    return Scaffold(
        backgroundColor: AppColors.blue20,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildLogo()
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      TextField()
                    ],
                  ),
                ),
              )
            ]));
  }

  _buildLogo() {
    // return SvgPicture.asset(
    //   AssetCatalog.app_logo,
    //   height: 139,
    //   width: 138,
    // );
  }
}