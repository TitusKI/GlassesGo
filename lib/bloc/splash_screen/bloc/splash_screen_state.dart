part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState extends Equatable {
  const SplashScreenState();
}

final class SplashScreenInitial extends SplashScreenState {
  @override
  List<Object> get props => [];
}

final class NavigateToHome extends SplashScreenState {
  @override
  List<Object> get props => [];
}
