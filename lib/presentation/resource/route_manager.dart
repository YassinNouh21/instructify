import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/application/bloc/favorite_bloc.dart';
import 'package:instructify/application/bloc/fetch_bloc.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/injection.dart';
import 'package:instructify/presentation/screens/account/account_view.dart';
import 'package:instructify/presentation/screens/account/favorite/favorite_view.dart';
import 'package:instructify/presentation/screens/download/download_view.dart';
import 'package:instructify/presentation/screens/forgot_password/forgot_password_view.dart';
import 'package:instructify/presentation/screens/home/home_view.dart';
import 'package:instructify/presentation/screens/login/login_view.dart';
import 'package:instructify/presentation/screens/main/main_view.dart';
import 'package:instructify/presentation/screens/on_boarding/on_boarding_view.dart';
import 'package:instructify/presentation/screens/payment/payment_view.dart';
import 'package:instructify/presentation/screens/register/register_view.dart';
import 'package:instructify/presentation/screens/register_two/register_two_view.dart';
import 'package:instructify/presentation/screens/splash/splash_view.dart';
import '../screens/category/category_view.dart';
import '../screens/choose_position/choose_position_view.dart';
import '../screens/choose_sigin_method/choose_signin_method_view.dart';
import '../screens/course_detail/course_detail_view.dart';
import '../screens/course_progress/course_progress_view.dart';
import '../screens/courses/courses_view.dart';
import '../screens/no_connection/no_connection_screen.dart';
import '../screens/search/search_view.dart';

// TODO: Add profile screen

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String registerTwoRoute = "/registerone";
  static const String choosePositionRoute = "/chooseposition";
  static const String chooseSignInMehtodRoute = "/choosesigninmethod";
  static const String forgotPasswordRoute = "/forgotpassword";
  static const String homeRoute = "/home";
  static const String downloadRoute = "/download";
  static const String accountRoute = "/account";
  static const String mainRoute = "/main";
  static const String categoryRoute = "/category";
  static const String courseDetailRoute = "/coursedetail";
  static const String coursesRoute = "/courses";
  static const String courseProgressRoute = "/courseprogress";
  static const String searchRoute = "/search";
  static const String paymentRoute = "/payment";
  static const String favoriteRoute = "/favorite";
  static const String noConnectionRoute = "/noconnection";
  static const String noRouteFound = "No Route Found";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
            builder: (_) =>
                PreferenceRepository.pref.getBool('isFirstTime') == null ||
                        PreferenceRepository.pref.getBool('isFirstTime') == true
                    ? const OnBoardingView()
                    : PreferenceRepository.pref.getString('user') == null
                        ? const ChooseSignInMethodView()
                        : const MainView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.favoriteRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => getIt<FavoriteBloc>()
                    ..add(FavoriteEvent.favoriteCoursesPressed(
                        getIt<AuthenticationBloc>()
                            .localUser
                            .favoriteCourses!)),
                  child: const FavoriteScreen(),
                ));
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.categoryRoute:
        return MaterialPageRoute(builder: (_) => CategoryView());
      case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentView());
      case Routes.courseProgressRoute:
        return MaterialPageRoute(builder: (_) => const CourseProgressView());
      case Routes.coursesRoute:
        return MaterialPageRoute(builder: (_) => const CoursesView());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchView());
      case Routes.noConnectionRoute:
        return MaterialPageRoute(builder: (_) => const NoConnectionScreen());
      case Routes.courseDetailRoute:
        return MaterialPageRoute(
            builder: (_) => const CourseDetailView(), settings: routeSettings);
      case Routes.registerTwoRoute:
        return MaterialPageRoute(builder: (_) => RegisterTwoView());
      case Routes.downloadRoute:
        return MaterialPageRoute(builder: (_) => const DownloadView());
      case Routes.accountRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FavoriteBloc>(),
                  child: AccountView(),
                ));
      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FetchBloc>(),
                  child: const HomeView(),
                ));
      case Routes.choosePositionRoute:
        return MaterialPageRoute(builder: (_) => const ChoosePositionView());
      case Routes.chooseSignInMehtodRoute:
        return MaterialPageRoute(
            builder: (_) => const ChooseSignInMethodView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(Routes.noRouteFound),
        ),
        body: const Center(child: Text(Routes.noRouteFound)),
      ),
    );
  }
}
