import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/custom_app_bar.dart';
import 'package:mackenzie_academy/features/app_settings/presentation/bloc/app_settings_bloc.dart';
import 'package:mackenzie_academy/generated/l10n.dart';

class AppSettingsScreen extends StatelessWidget {
  bool? isDark;
  var Language = 'en';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppSettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppSettingsBloc, AppSettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AppSettingsInitialState) {
          _getInitialSettings(context);
          //isRememberMe = state
        } else if (state is GetInitialSettingsState) {
          isDark = state.isDark;
        }
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
          child: CustomAppBar(
            scaffoldKey: _scaffoldKey,
          ),
        ),
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
                  value: isDark ?? false,
                  onChanged: (value) {
                    _ModeChangeState(context);
                  }),
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
                  _selectLanguage(context, 'en');
                },
              ),
              ListTile(
                title: const Text('العربيه'),
                onTap: () {
                  _selectLanguage(context, 'ar');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectLanguage(BuildContext context, String language) {
    BlocProvider.of<AppSettingsBloc>(context).add(LanguageChangeEvent(language));
    Navigator.pop(context);
  }

  void _ModeChangeState(BuildContext context) {
    BlocProvider.of<AppSettingsBloc>(context).add(ModeChangeEvent());
  }

  void _getInitialSettings(BuildContext context) {
    BlocProvider.of<AppSettingsBloc>(context).add(GetInitialModeEvent());
  }

}
