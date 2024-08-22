import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc() : super(AppSettingsInitialState()) {
    on<AppSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
