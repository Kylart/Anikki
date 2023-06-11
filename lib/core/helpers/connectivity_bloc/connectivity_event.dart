part of 'connectivity_bloc.dart';

class ConnectivityEvent extends Equatable {
  const ConnectivityEvent(this.isConnected);

  final bool isConnected;

  @override
  List<Object> get props => [isConnected];
}
