import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ngdemo17/bloc/sing_in/sign_in_event.dart';
import 'package:ngdemo17/bloc/sing_in/sign_in_state.dart';
import 'package:ngdemo17/services/auth_service.dart';

import '../../pages/home_page.dart';
import '../../pages/signup_page.dart';
import '../../services/prefs_service.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc() : super(SignInInitialState()){
    on<SignedInEvent>(_onSignedInEvent);
  }

  Future<void> _onSignedInEvent(SignedInEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    User? firebaseUser = await AuthService.signInUser(event.context, event.email, event.password);
    if (firebaseUser == null) {
      emit(SignInFailureState("Your email or password is incorrect"));
    } else {
      await Prefs.saveUserId(firebaseUser.uid);
      emit(SignInSuccessState());
    }
  }


  callHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  callSignUpPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, SignUpPage.id);
  }
}
