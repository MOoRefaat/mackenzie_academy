import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/loading_manager.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_card.dart';
import 'package:mackenzie_academy/features/app_settings/presentation/bloc/app_settings_bloc.dart';
import 'package:mackenzie_academy/features/home/data/models/services_item.dart';
import 'package:mackenzie_academy/features/home/presentation/bloc/home_bloc.dart';
import 'package:mackenzie_academy/features/service_details_screen.dart';

class AppSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<AppSettingsBloc>(),
      child: BlocConsumer<AppSettingsBloc, AppSettingsState>(
        listener: (context, state) {
          if (state is AppSettingsInitial) {
            // TODO : check if email and password is remembered
          }
        },
        builder: (context, state) {
          return _settingsWidget(context: context);
        },
      ),
    );
  }

  Widget _settingsWidget({
    required BuildContext context,
  }) {
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
        body: Center(
            child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(children: [
            ListTile(
              title: const Text("Dark Mode"),
              leading: const Icon(Icons.dark_mode_outlined),
              trailing: Switch(
                  // activeColor: AppColors.gray30,
                  //   activeTrackColor: AppColors.green30,
                  value: false,
                  onChanged: (value) {
                  }),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Language"),
              leading: const Icon(Icons.language_outlined),
              trailing: Switch(value: false, onChanged: (value) {}),
              onTap: () {},
            )
          ]),
        )));
  }
}
