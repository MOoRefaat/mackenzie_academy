import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/loading_manager.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_button.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_checkbox.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_text_field.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:mackenzie_academy/features/home/data/models/users_services.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isRememberMe = false;

  LoginScreen({super.key});

  @override
  void initState () {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return
      // BlocProvider(
      // create: (context) => servicesLocator<LoginBloc>(),
      // child:
      BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginInitial) {
            // TODO  : check if email and password is remembered
            _checkUserNameAndPasswordState(context);
          } else if (state is ValidateStoredDataEvent) {
            // isRememberMe = state.isRememberMe;
            // emailController = state;
            // passwordController ;
          } else if (state is NetworkErrorState) {
            print("&&&&&&&&& ${state.message}");
            _failErrorMessage(errorMessage: state.message, context: context);
          } else if (state is ValidLoginFormState) {
            _callFirebaseLogin(state.email, state.password, state.isRememberMe, context);
            isRememberMe = state.isRememberMe;
          } else if (state is LoginLoadingState) {
            _loginLoadingState();
          } else if (state is LoginFailState) {
            _failErrorMessage(
              errorMessage: state.messageKey,
              context: context,
            );
          } else if (state is LoginSuccessState) {
            _loginSuccessState(context, state.userRole);
          } else if (state is NavigateToHomeScreenState) {
            _navigateToHome(context, state.userType);
          } else if (state is NavigateToRegisterScreenState) {
            _navigateToRegister(context);
          }
        },
        builder: (context, state) {
          return _loginWidget(context: context);
        },
      );
    // );
  }

  Widget _loginWidget({required BuildContext context}) {
    return Scaffold(
      backgroundColor: AppColors.blue20,
      body: Center(
        child: SingleChildScrollView(
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
              _buildRememberMeCheckbox(),
              const SizedBox(height: 20),
              _buildLoginButton(context),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(NavigateToRegisterScreenEvent());
                },
                child: const Text(
                  'ليس لديك حساب ؟ انضم إلينا أو المتابعه كزائر',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              _buildSocialMediaLoginButtons(),
            ],
          ),
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
    return CustomButton(
      buttonLabelText: 'تسجيل الدخول',
      buttonLabelStyle: TextStyle(color: AppColors.blue20),
      backgroundColor: AppColors.white,
      onPress: () {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonEvent(
              email: emailController.text, password: passwordController.text,isRememberMe: isRememberMe),
        );
      },
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

  Widget _buildRememberMeCheckbox() {
    return CustomCheckbox(
      isRememberMe: isRememberMe,
      onChanged: (bool? value) {
        isRememberMe = value ?? false;
        print("_buildRememberMeCheckbox ${isRememberMe}");
      },
    );
  }

  // states fun
  void _loginLoadingState() {
    LoadingManager().showLoading();
  }


  void _checkUserNameAndPasswordState(BuildContext context) {
    print("_checkUserNameAndPasswordState ----------");
    BlocProvider.of<LoginBloc>(context).add(ValidateStoredDataEvent());
  }

  void _callFirebaseLogin(String email, String password,bool isRememberMe, BuildContext context) {
    BlocProvider.of<LoginBloc>(context)
        .add(CallFirebaseLoginEvent(email: email, password: password,isRememberMe: isRememberMe));
  }

  void _loginSuccessState(BuildContext context, String? role) {
    LoadingManager().hideLoading();
    if (role == 'Admin') {
      BlocProvider.of<LoginBloc>(context)
          .add(NavigateHomeScreenEvent(userType: UserType.admin));
    } else if (role == 'Coach') {
      BlocProvider.of<LoginBloc>(context)
          .add(NavigateHomeScreenEvent(userType: UserType.coach));
    } else {
      BlocProvider.of<LoginBloc>(context)
          .add(NavigateHomeScreenEvent(userType: UserType.user));
    }
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

  void _navigateToHome(BuildContext context, UserType userType) {
    LoadingManager().hideLoading();

    if (userType == UserType.admin) {
      Navigator.pushNamed(
        context,
        RoutesName.homeRoute,
        arguments: adminServices,
      );
    } else if (userType == UserType.coach) {
      Navigator.pushNamed(
        context,
        RoutesName.homeRoute,
        arguments: coachServices,
      );
    } else {
      Navigator.pushNamed(
        context,
        RoutesName.homeRoute,
        arguments: userServices,
      );
    }
  }

  void _navigateToRegister(BuildContext context) {
    LoadingManager().hideLoading();
    Navigator.of(context).pushNamed(RoutesName.registerRoute);
  }
}
