import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mackenzie_academy/core/utils/asset_catalog.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_button.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginInitial) {

      } else if (state is NavigateToHomeState) {
        _navigateToHome();
      } else if (state is NavigateToHomeState) {
        _navigateToHome();
      }
    }, builder: (context, state) {
      return _loginWidget(
          errorUserName: null, errorPassword: null, context: context);
    });
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
                    _buildLogo(),
                    _buildUsernameTextField(),
                    SizedBox(
                      height: 12.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 12.0,
                    ),
                    _buildLoginButton()
                  ],
                ),
              ),
            ]));
  }

  _buildLogo() {
    return SvgPicture.asset(
      AssetCatalog.mackenzie_logo,
      height: 139,
      width: 138,
    );
  }

  _buildUsernameTextField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        // Background color of the text field
        hintText: 'Enter your text',
        prefixIcon: Icon(Icons.person),
        // Icon to display at the start of the text field
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }

  _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        // Background color of the text field
        hintText: 'Enter your text',
        prefixIcon: Icon(Icons.key),
        // Icon to display at the start of the text field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }

  _buildLoginButton() {
    return CustomButton(
      buttonLabelText: "تسجيل الدخول",
      onPress: (){
        print("object");
      },
    );
  }

  void _loginSuccessState() {
    // BlocProvider.of<LoginBloc>(contexttext).add(NavigateToHomeEvent());
  }

  void _navigateToHome(){

  }


}
