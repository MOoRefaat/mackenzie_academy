import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/loading_manager.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_button.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_text_field.dart';
import 'package:mackenzie_academy/features/add_users_by_admin/presentation/register/bloc/adding_users_bloc.dart';

class AddingUsersScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<AddingUsersBloc>(),
      child: BlocConsumer<AddingUsersBloc, AddingUsersState>(
        listener: (context, state) {
          if (state is RegisterInitial) {
            // TODO : check if email and password is remembered
          }
          if (state is RegisterFailState) {
            _failErrorMessage(errorMessage: state.message, context: context);
          } else if (state is PasswordMatchState) {
            _checkValidRegisterFormState(context);
          } else if (state is PasswordNotMatchState) {
            _failErrorMessage(errorMessage: state.message, context: context);
          } else if (state is ValidRegisterFormState) {
            _callFirebaseRegister(state.email, state.password, state.userName,
                state.role, context);
          } else if (state is RegisterLoadingState) {
            _registerLoadingState();
          } else if (state is RegisterSuccessState) {
            _registerSuccessState(context);
          } else if (state is NavigateToHomeScreenState) {
            _navigateToHome(context);
          }
        },
        builder: (context, state) {
          return _registerWidget(context: context, state: state);
        },
      ),
    );
  }

  Widget _registerWidget(
      {required BuildContext context, required AddingUsersState state}) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set the color to white
          ),
          backgroundColor: Color(0xFF0A155A),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo1.png',
                width: 200,
                height: 75,
                //   fit: BoxFit.none,
              ),
            ],
          ),
        ),
      ),
    //  backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // Logo
            const Text('إنشاء حساب لمستخدم جديد ',
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold,
                  color: Color(0xFF0A155A), // Navy blue
                )),
            const SizedBox(height: 40),
            _buildUsernameTextField(),
            const SizedBox(height: 20),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            _buildConfirmPasswordTextField(),
            const SizedBox(height: 20),
            _buildPasswordTextField(),
            const SizedBox(height: 20),
            _buildRoleDropdown(context, state),
            const SizedBox(height: 60),
            _buildRegisterButton(context),
            //     _buildSocialMediaLoginButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return CustomTextField(
      controller: userNameController,
      hintText: 'اسم المستخدم',
      prefixIcon: Icons.person,
      fillColor: AppColors.black.withOpacity(.5),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      hintText: 'البريد الالكتروني',
      prefixIcon: Icons.email,
      fillColor: AppColors.black.withOpacity(.5),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      hintText: 'كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
      fillColor: AppColors.black.withOpacity(.5),
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: confirmPasswordController,
      hintText: 'تأكيد كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
      fillColor: AppColors.black.withOpacity(.5),
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

  Widget _buildRoleDropdown(BuildContext context, AddingUsersState state) {
    return BlocBuilder<AddingUsersBloc, AddingUsersState>(
      builder: (context, state) {
        String? selectedRole = (state is RoleSelectedState)
            ? state.role
            : null; // Use null to trigger the hint text
        return DropdownButtonFormField<String>(
          value: selectedRole,
          iconEnabledColor: Colors.white,
          focusColor: Colors.black,
          hint: const Text('أختر نوع الحساب',
              style: TextStyle(color: Colors.white)),
          items: ['User', 'Coach'].map((String role) {
            return DropdownMenuItem<String>(
              value: role,
              child: Text(role),
            );
          }).toList(),
          onChanged: (newValue) {
            context.read<AddingUsersBloc>().add(RoleSelectedEvent(newValue!));
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withOpacity(.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomButton(
      buttonLabelText: 'إنشاء حساب',
      buttonLabelStyle: TextStyle(color: AppColors.white),
      backgroundColor: AppColors.blue20,
      onPress: () {
        final role = (BlocProvider.of<AddingUsersBloc>(context).state
                is RoleSelectedState)
            ? (BlocProvider.of<AddingUsersBloc>(context).state
                    as RoleSelectedState)
                .role
            : 'User';
        BlocProvider.of<AddingUsersBloc>(context).add(IsPasswordMatchEvent(
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ));
        if (BlocProvider.of<AddingUsersBloc>(context).state
            is PasswordMatchState) {
          BlocProvider.of<AddingUsersBloc>(context).add(RegisterButtonEvent(
            email: emailController.text,
            password: passwordController.text,
            userName: userNameController.text,
            role: role,
          ));
        }
      },
    );
  }

  void _callFirebaseRegister(String email, String password, String userName,
      String role, BuildContext context) {
    BlocProvider.of<AddingUsersBloc>(context).add(CallFirebaseRegisterEvent(
        email: email, password: password, userName: userName, role: role));
  }

  void _checkValidRegisterFormState(BuildContext context) {
    final role = (BlocProvider.of<AddingUsersBloc>(context).state
            is RoleSelectedState)
        ? (BlocProvider.of<AddingUsersBloc>(context).state as RoleSelectedState)
            .role
        : 'User';
    BlocProvider.of<AddingUsersBloc>(context).add(RegisterButtonEvent(
      email: emailController.text,
      password: passwordController.text,
      userName: userNameController.text,
      role: role,
    ));
  }

  void _registerLoadingState() {}

  void _registerSuccessState(BuildContext context) {
    LoadingManager().hideLoading();
    BlocProvider.of<AddingUsersBloc>(context).add(NavigateToHomeScreenEvent());
  }

  void _failErrorMessage(
      {required String errorMessage, required BuildContext context}) {
    LoadingManager().hideLoading();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(errorMessage),
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
