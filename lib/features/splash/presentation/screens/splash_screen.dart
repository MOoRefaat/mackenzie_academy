import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mackenzie_academy/core/utils/asset_catalog.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/features/login/presentation/screens/login_screen.dart';

// class SplachScreen extends StatelessWidget {
//   const SplachScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         backgroundColor: AppColors.blue20,
//         body: Stack(children: [
//           Positioned.fill(
//             child: Image(
//                 fit: BoxFit.fitWidth,
//                 image: AssetImage(AssetCatalog.app_logo)),
//           )
//         ]));
//   }
// }

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(context),
//     );
//   }
//
//   BlocProvider<SplashBloc> _buildBody(BuildContext context) {
//     return BlocProvider(
//       builder: (context) => SplashBloc(),
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.orange,
//         child: Center(
//           // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
//           child: BlocBuilder<SplashBloc, SplashState>(
//             builder: (context, state) {
//               if ((state is SplashInitialState) || (state is SplashLoadingState)) {
//                 return _buildSplashScreenWidget();
//               } else if (state is SplashLoadedState) {
//                 return LoginScreen();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   _buildSplashScreenWidget () {
//     return const Scaffold(
//         backgroundColor: AppColors.blue20,
//         body: Stack(children: [
//           Positioned.fill(
//             child: Image(
//                 fit: BoxFit.fitWidth,
//                 image: AssetImage(AssetCatalog.app_logo)),
//           )
//         ]));
//   }
//   }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// to start time to switch to another screen
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSplashScreenWidget();
  }

    _buildSplashScreenWidget () {
    return const Scaffold(
        backgroundColor: AppColors.blue20,
        body: Stack(children: [
          Positioned.fill(
            child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage(AssetCatalog.app_logo)),
          )
        ]));
  }

  /// time to switch to home screen
  startTime() {
    var duration = const Duration(milliseconds: 1700);
    return Timer(duration, navigationPage);
  }

  /// navigate to home screen
  Future<void> navigationPage() async {
    await Navigator.of(context).pushReplacementNamed(LoginScreen.ROUTE_NAME);
  }

  }


