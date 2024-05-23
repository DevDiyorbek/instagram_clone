import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable{}

class SignUpInitialState extends SignUpState{
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends SignUpState{
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends SignUpState{
  @override
  List<Object?> get props => [];
}

class SignUpFailureState extends SignUpState{
  final String errorMessage;
  SignUpFailureState(this.errorMessage);
  @override
  List<Object?> get props => [];
}