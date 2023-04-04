part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
  
  @override
  List<Object> get props => [];
}

class ConnectivityUnknown extends ConnectivityState {}
class ConnectivityOnline extends ConnectivityState {}
class ConnectivityOffline extends ConnectivityState {}
