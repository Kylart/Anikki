import 'package:equatable/equatable.dart';
import 'package:anikki/features/transmission/domain/domain.dart';

class TransmissionWrapper extends Equatable {
  const TransmissionWrapper(this.transmission, this.isAuthorized);

  final Transmission transmission;
  final bool isAuthorized;

  @override
  List<Object> get props => [
        transmission,
        isAuthorized,
      ];
}
