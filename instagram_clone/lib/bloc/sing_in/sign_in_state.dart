import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable{}

class SignInInitialState extends SignInState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SignInLoadingState extends SignInState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInFailureState extends SignInState{
  final String errorMessage;
  SignInFailureState(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInSuccessState extends SignInState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
