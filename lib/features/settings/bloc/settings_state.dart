part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.settings});

  final Settings settings;

  @override
  List<Object> get props => [settings];
}

class SettingsError extends SettingsState {
  const SettingsError({required super.settings, required this.message});

  final String message;

  @override
  List<Object> get props => [settings, message];
}
