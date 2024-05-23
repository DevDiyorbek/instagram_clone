import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ngdemo17/bloc/sign_up/sign_up_event.dart';
import 'package:ngdemo17/bloc/sign_up/sign_up_state.dart';

import '../../model/member_model.dart';
import '../../pages/home_page.dart';
import '../../pages/signin_page.dart';
import '../../services/auth_service.dart';
import '../../services/db_service.dart';
import '../../services/prefs_service.dart';

abstract class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignedUpEvent>(_onSignedUpEvent);
  }

  Future<void> _onSignedUpEvent(
      SignedUpEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());
    User? firebaseUser = await AuthService.signUpUser(
      event.context,
      event.fullName,
      event.email,
      event.password,
    );

    if (firebaseUser == null) {
      emit(SignUpFailureState("Please fill all the fields"));
    } else {
      // _saveMemberIdToLocal(firebaseUser);
      await Prefs.saveUserId(firebaseUser.uid);
      // _saveMemberToCloud(member);
      Member member = Member(event.fullName, event.email);
      await DBService.storeMember(member);

      emit(SignUpSuccessState());
    }
  }

  callHomePage(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  callSignInPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }

}
