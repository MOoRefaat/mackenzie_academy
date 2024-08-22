import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/loading_manager.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_button.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_text_field.dart';
import 'package:mackenzie_academy/features/auth/presentation/register/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterInitial) {
            // TODO  : check if email and password is remembered
          }
          if (state is RegisterFailState) {
            _failErrorMessage(errorMessage: state.message, context: context);
          } else if (state is PasswordMatchState) {
            _checkValidRegisterFormState(context);
          } else if (state is PasswordNotMatchState) {
            _failErrorMessage(errorMessage: state.message, context: context);
          } else if (state is ValidRegisterFormState) {
            _callFirebaseRegister(
                state.email, state.password, state.userName, context);
          } else if (state is RegisterLoadingState) {
            _registerLoadingState();
          } else if (state is RegisterSuccessState) {
            _registerSuccessState(context);
          } else if (state is NavigateToHomeScreenState) {
            _navigateToHome(context);
          }
        },
        builder: (context, state) {
          return _registerWidget(context: context);
        },
      ),
    );
  }

  Widget _registerWidget({required BuildContext context}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue20,
        iconTheme: IconThemeData(
            color: AppColors.white),
        // TODO : CHAnge icon
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      backgroundColor: AppColors.blue20,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo
            _buildLogo(),
            const SizedBox(height: 20),
            // Username TextField
            _buildUsernameTextField(),
            const SizedBox(height: 20),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            // Password TextField
            _buildConfirmPasswordTextField(),
            const SizedBox(height: 20),
            _buildPasswordTextField(),
            const SizedBox(height: 20),
            // Register Button
            _buildRegisterButton(context),
            const SizedBox(height: 20),
            // Social Media Login Buttons
            _buildSocialMediaLoginButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset('assets/images/logo2.png', height: 200.0);
  }

  Widget _buildUsernameTextField() {
    return CustomTextField(
      controller: userNameController,
      hintText: 'اسم المستخدم',
      prefixIcon: Icons.person,
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      hintText: 'البريد الالكتروني',
      prefixIcon: Icons.email,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      hintText: 'كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: confirmPasswordController,
      hintText: 'تأكيد كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
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
              child: Image.asset('assets/images/googleLogo.png',
                  fit: BoxFit.cover),
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

  Widget _buildRegisterButton(BuildContext context) {
    return CustomButton(
      buttonLabelText: 'إنشاء حساب',
      buttonLabelStyle: TextStyle(color: AppColors.blue20),
      backgroundColor: AppColors.white,
      onPress: () {
        BlocProvider.of<RegisterBloc>(context).add(IsPasswordMatchEvent(
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ));
      },
    );
  }

  // states fun
  void _callFirebaseRegister(
      String email, String password, String userName, BuildContext context) {
    BlocProvider.of<RegisterBloc>(context).add(CallFirebaseRegisterEvent(
        email: email, password: password, userName: userName));
  }

  void _checkValidRegisterFormState(BuildContext context) {
    BlocProvider.of<RegisterBloc>(context).add(RegisterButtonEvent(
      email: emailController.text,
      password: passwordController.text,
      userName: userNameController.text,
    ));
  }

  void _registerLoadingState() {
    LoadingManager().showLoading();
  }

  void _registerSuccessState(BuildContext context) {
    LoadingManager().hideLoading();
    BlocProvider.of<RegisterBloc>(context).add(NavigateToHomeScreenEvent());
  }

  void _failErrorMessage(
      {required String errorMessage, required BuildContext context}) {
    LoadingManager().hideLoading();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${errorMessage}"),
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
  }

  void _navigateToHome(BuildContext context) {
    LoadingManager().hideLoading();
    Navigator.of(context).pushNamed(RoutesName.homeRoute);
  }
}
