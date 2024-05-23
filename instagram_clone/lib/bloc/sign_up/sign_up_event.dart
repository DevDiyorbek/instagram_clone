import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignedUpEvent extends SignUpEvent {
  BuildContext context;
  String fullName;
  String email;
  String password;

  SignedUpEvent({
    required this.context,
    required this.fullName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}
