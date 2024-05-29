import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassesgo/bloc/sign_up/sign_up_bloc.dart';
import 'package:glassesgo/bloc/sign_up/sign_up_event.dart';
import 'package:glassesgo/views/common/widgets/flutter_toast.dart';
import 'package:regexpattern/regexpattern.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController(this.context);

  void handleEmailSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (!email.isEmail()) {
      toastInfo(msg: "Please Enter a Valid Email Address");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }

    if (repassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    if (repassword != password) {
      toastInfo(msg: "The Password doesn't match the previous password");
      return;
    }

    try {
      context.read<SignUpBloc>().add(SignUpLoadingEvent());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your email. To activate it please check your email box and click on the link");
        context.read<SignUpBloc>().add(SignUpSuccessEvent());
        Navigator.of(context).pop();
      }
      String userID = credential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userID).set({
        "email": email,
        "username": userName,
      });
    } on FirebaseAuthException catch (e) {
      context.read<SignUpBloc>().add(SignUpFailureEvent(error: e.code));
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      }
      if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email is already in use");
      }
      if (e.code == "invalid-email") {
        toastInfo(msg: "Your email is invalidT");
      }
    }
  }

  getUserInfo(String uid) async {
    try {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return userData.data();
    } catch (e) {
      print("Error getting user Info ${e.toString()}");
    }
  }
}
