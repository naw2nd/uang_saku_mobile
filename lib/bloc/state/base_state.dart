import 'package:equatable/equatable.dart';

class BaseState extends Equatable {
  BaseState();

  @override
  List<Object> get props => [];
}

class EmptyState extends BaseState {}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {
  final String message;

  ErrorState({this.message});

  @override
  List<Object> get props => [message];
}

class SuccesState<T> extends BaseState {
  final T data;

  SuccesState({this.data});

  @override
  List<Object> get props => [data];
}
