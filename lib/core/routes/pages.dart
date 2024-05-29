// The UNIFICATION Of BlocProvider and routes and pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassesgo/bloc/sign_in/sign_in_bloc.dart';
import 'package:glassesgo/bloc/sign_up/sign_up_bloc.dart';
import 'package:glassesgo/bloc/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:glassesgo/bloc/welcome/welcome_bloc.dart';
import 'package:glassesgo/core/routes/names.dart';
import 'package:glassesgo/main/global.dart';
import 'package:glassesgo/main/home.dart';
import 'package:glassesgo/main.dart';
import 'package:glassesgo/views/sign_in_screen/screens/sign_in.dart';
import 'package:glassesgo/views/sign_up_screen/screens/sign_up.dart';
import 'package:glassesgo/views/splash_screen/screens/splash_screen.dart';
import 'package:glassesgo/views/welcome_screen/screens/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.WELCOME,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const SplashScreen(),
        bloc: BlocProvider(
          create: (_) => SplashScreenBloc(),
          child: const SplashScreen(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        page: const SignUp(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const MyHomePage(title: 'GlassesGo'),
        // bloc: BlocProvider(
        //   create: (_) => ApplicationBl(),
        // ),
      )
    ];
  }

  static List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        // Check if bloc is not null before adding
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  // models that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    print('GenerateRouteSettings');
    if (settings.name != null) {
      // check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("first log");
        print(result.first.route);
        print(result.indexed);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.WELCOME && deviceFirstOpen) {
          print("Second Log");
          bool getIsLoggedIn = Global.storageService.getIsLoggedIn();
          if (getIsLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const MyHomePage(
                      title: 'GlassesGo',
                    ),
                settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid route name: ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
