import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_text_field.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginInitial) {
          } else if (state is NavigateToRegisterScreenState) {
            _navigateToRegister();
          } else if (state is NavigateToHomeScreenState) {
            _navigateToHome();
          }
        },
        builder: (context, state) {
          return _loginWidget(context: context);
        },
      ),
    );
  }

  Widget _loginWidget({required BuildContext context}) {
    return Scaffold(
      backgroundColor: AppColors.blue20,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildLogo(),
            const SizedBox(height: 20),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            _buildPasswordTextField(),
            const SizedBox(height: 20),
            _buildLoginButton(context),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.registerRoute);
              },
              child: const Text(
                'ليس لديك حساب ؟ انضم إلينا أو المتابعه كزائر',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            _buildSocialMediaLoginButtons()
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset('assets/images/logo2.png', height: 200.0);
      //SvgPicture.asset(AssetCatalog.mackenzie_logo,height: 139,width: 138,);
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      hintText: 'البريد الالكتروني',
      prefixIcon: Icons.person,
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      hintText: 'كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
    );

  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Email and password cannot be empty"),
                actions: <Widget>[
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          return;
        }
        // Perform login logic here
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFF0A155A),
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text('تسجيل الدخول'),
    );
  }

  Widget _buildSocialMediaLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 52.0,
          height: 52.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFECE9EC),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipOval(
              child: Image.asset('assets/images/googleLogo.png', fit: BoxFit.cover),
            ),
          ),
        ),
        IconButton(
          icon: Image.asset('assets/images/AppleLogo.png'),
          iconSize: 50,
          onPressed: () {},
        ),
        Container(
          width: 52.0,
          height: 52.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFECE9EC),
          ),
          child: IconButton(
            icon: Icon(Icons.phone, color: Colors.black87, size: 28),
            onPressed: () {
              // Handle Phone login
            },
          ),
        ),
      ],
    );
  }

  void _navigateToHome() {
    // Add navigation to home logic here
  }

  void _navigateToRegister() {
    // Add navigation to register logic here
  }
}
