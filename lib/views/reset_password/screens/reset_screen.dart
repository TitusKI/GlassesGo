import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassesgo/bloc/reset_password/reset_password_bloc.dart';
import 'package:glassesgo/utils/controller/reset_password_controller.dart';
import 'package:glassesgo/views/common/values/colors.dart';
import 'package:glassesgo/views/common/widgets/common_widgets.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar("Sign In Help"),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary_bg,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                    child: Text(
                      "Find Your Account",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryText,
                          fontSize: 25.sp),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: reusableText(
                      "Enter your email address\n linked to your\n account.",
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  buildTextField("email", "Reset Password", "user", (value) {
                    context.read<ResetPasswordBloc>().add(
                          EmailEvent(email: value),
                        );
                  }),
                  buildLogInAndRegButton("Next", 'login', () {
                    ResetPasswordController(context).handleEmailReset();
                  }),
                  const SizedBox(
                    height: 14,
                  ),
                  const Center(
                    child: Text(
                      'Can\'t reset your password?',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
