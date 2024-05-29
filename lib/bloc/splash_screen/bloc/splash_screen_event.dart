part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();
}

class StartSplashScreen extends SplashScreenEvent {
  @override
  List<Object> get props => [];
}
