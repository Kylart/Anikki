part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState(this.settings);

  final Settings settings;

  @override
  List<Object> get props => [settings];
}

class SettingsError extends SettingsState {
  const SettingsError(super.settings, this.message);

  final String message;

  @override
  List<Object> get props => [settings, message];
}
