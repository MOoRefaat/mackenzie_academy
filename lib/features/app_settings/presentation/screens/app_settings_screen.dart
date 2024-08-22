import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/features/app_settings/presentation/bloc/app_settings_bloc.dart';
import 'package:mackenzie_academy/generated/l10n.dart';

class AppSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppSettingsBloc, AppSettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
          return _settingsWidget(context: context);
        },
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
                  onChanged: (value) {}),
              onTap: () {},
            ),
            ListTile(
              title: Text(S.current.language),
              leading: const Icon(Icons.language_outlined),
              onTap: () {
                _showLanguageBottomSheet(context);
              },
            )
          ]),
        )));
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('English'),
                onTap: () {
                  _selectLanguage(context, 'English');
                },
              ),
              ListTile(
                title: const Text('العربيه'),
                onTap: () {
                  _selectLanguage(context, 'Arabic');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectLanguage(BuildContext context, String language) {
    // TODO : bloc
    Navigator.pop(context);
  }
}
