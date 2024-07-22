import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_text_field.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {

          if (state is LoginInitial) {
            // TODO  : check if email and password is remembered
          }
          if (state is EmailEmptyFormatState) {
            _emailEmptyFormatState("translate(state.emailValidatorMessage)",context);
          } else if (state is EmailFormatCorrectState) {
            _emailFormatCorrectState();
          } else if (state is PasswordEmptyFormatState) {
            _passwordEmptyFormatState(
                "translate(state.passwordValidatorMessage)",context
            );
          } else if (state is PasswordFormatCorrectState) {
            _passwordFormatCorrectState();
          } else if (state is NetworkErrorState) {
            _failErrorMessage(errorMessage: "translate(state.message)",context: context);
          } else if (state is ValidLoginFormState) {
            _callApiLogin(state.email, state.password,context);
          } else if (state is LoginLoadingState) {
            _loginLoadingState();
          } else if (state is LoginFailState) {
            _failErrorMessage(errorMessage: "translate(state.messageKey)", context: context,);
          } else if (state is LoginSuccessState) {
            _loginSuccessState(context);
          } else if (state is NavigateToHomeScreenState) {
            _navigateToHome(context);
          } else if (state is NavigateToRegisterScreenState) {
            _navigateToRegister(context);
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
                BlocProvider.of<LoginBloc>(context).add(NavigateToRegisterScreenEvent());
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

  // states fun
  void _loginLoadingState() {
    showLoading();
  }

  void _emailEmptyFormatState(String errorMessage,BuildContext context) {
    hideLoading();
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

  void _emailFormatCorrectState() {
    // passwordErrorMessage = "";
  }

  void _passwordEmptyFormatState(String errorMessage,BuildContext context) {
    hideLoading();
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

  void _passwordFormatCorrectState() {
    // passwordErrorMessage = "";
  }

  void _callApiLogin(String email, String password,BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(CallApiLoginEvent(email: email, password: password));
  }

  void _loginSuccessState(BuildContext context) {
    hideLoading();
    BlocProvider.of<LoginBloc>(context).add(NavigateHomeScreenEvent());
  }

  void _failErrorMessage({required String errorMessage,required BuildContext context}) {
    hideLoading();
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
    hideLoading();
    Navigator.of(context).pushReplacementNamed(RoutesName.authPageRoute);
  }

  void _navigateToRegister(BuildContext context) {
    hideLoading();
    Navigator.of(context).pushNamed(RoutesName.registerRoute);
  }

  // TODO : Move to file LoadingManager
  void changeState() {
    // setState(() {});
  }

  void runChangeState() {
    changeState();
  }

  void showLoading() async {
    if (!isLoading) {
      isLoading = true;
      runChangeState();
    }
  }

  void hideLoading() async {
    if (isLoading) {
      isLoading = false;
      runChangeState();
    }
  }

  Widget loadingManagerWidget() {
    if (isLoading) {
      return customLoadingWidget();
    } else {
      return getEmptyWidget();
    }
  }

  Widget customLoadingWidget() {
    return FullScreenLoaderWidget.onlyAnimation();
  }

  Widget getEmptyWidget() {
    return const SizedBox.shrink();
  }


}
// TODO : Move to file custom Widget
class FullScreenLoaderWidget extends StatelessWidget {
  final String? message;

  const FullScreenLoaderWidget({super.key, this.message});

  factory FullScreenLoaderWidget.onlyAnimation() {
    return const FullScreenLoaderWidget();
  }

  factory FullScreenLoaderWidget.message(String message) {
    return FullScreenLoaderWidget(message: message);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.primaryColor.withOpacity(0.10),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
        ),
      ),
    );
  }

  Widget txtWithLoading(Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 20),
        Text(message ?? "", style: TextStyle(fontSize: 25, color: color))
      ],
    );
  }
}