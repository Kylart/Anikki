part of 'layout_bloc.dart';

sealed class LayoutState extends Equatable {
  const LayoutState();

  @override
  List<Object> get props => [];
}

final class LayoutPortrait extends LayoutState {}

final class LayoutLandscape extends LayoutState {}
