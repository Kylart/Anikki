part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsUpdated extends SettingsEvent {
  const SettingsUpdated(this.settings);

  final Settings settings;
}

class SettingsUpdateFailed extends SettingsEvent {
  const SettingsUpdateFailed({required this.settings, required this.message});

  final Settings settings;
  final String message;
}
