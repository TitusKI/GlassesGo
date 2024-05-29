import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassesgo/bloc/sign_in/sign_in_bloc.dart';
import 'package:glassesgo/bloc/sign_in/sign_in_event.dart';
import 'package:glassesgo/bloc/sign_in/sign_in_state.dart';
import 'package:glassesgo/views/common/values/colors.dart';
import 'package:glassesgo/views/common/widgets/common_widgets.dart';
import 'package:glassesgo/utils/controller/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.transparent,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primarySecondaryBackground,
            appBar: buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.white, Colors.grey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child: reusableText("Or use your email account to login"),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 60.h),
                      margin: EdgeInsets.only(top: 50.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(EmailEvent(email: value));
                          }),
                          reusableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(password: value));
                          }),
                        ],
                      ),
                    ),
                    forgotPassword(() {
                      Navigator.of(context).pushNamed("/reset_password");
                    }),
                    buildLogInAndRegButton("Log In", "login", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildLogInAndRegButton("Sign Up", "register", () {
                      Navigator.of(context).pushNamed("/sign_up");
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
