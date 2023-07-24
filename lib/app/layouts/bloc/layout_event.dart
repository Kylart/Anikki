part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();

  @override
  List<Object> get props => [];
}

class LayoutSizeChanged extends LayoutEvent {
  const LayoutSizeChanged(this.constraints);

  final BoxConstraints constraints;

  @override
  List<Object> get props => [
        constraints,
      ];
}
