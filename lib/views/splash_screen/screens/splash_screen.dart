import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassesgo/bloc/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:glassesgo/main.dart';
import 'package:glassesgo/views/welcome_screen/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final splashScreenBloc = SplashScreenBloc();
        splashScreenBloc.add(StartSplashScreen());
        return splashScreenBloc;
      },
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is NavigateToHome) {
            Navigator.of(context).pushReplacementNamed("/welcome");
          }
        },
        child: Scaffold(
          body: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: double.infinity,
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [Colors.white],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //   ),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  width: 115,
                  height: 115,
                  'assets/eyeglass_icon/eyeglass_icon.png',
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
