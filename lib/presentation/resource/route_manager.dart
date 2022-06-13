import 'package:flutter/material.dart';
import 'package:instructify/presentation/screens/forgot_password/forgot_password_view.dart';
import 'package:instructify/presentation/screens/login/login_view.dart';
import 'package:instructify/presentation/screens/main/main_view.dart';
import 'package:instructify/presentation/screens/on_boarding/on_boarding_view.dart';
import 'package:instructify/presentation/screens/payment/payment_view.dart';
import 'package:instructify/presentation/screens/register/register_view.dart';
import 'package:instructify/presentation/screens/splash/splash_view.dart';

import '../screens/category/category_view.dart';
import '../screens/course_detail/course_detail_view.dart';
import '../screens/course_progress/course_progress_view.dart';
import '../screens/courses/courses_view.dart';
import '../screens/search/search_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerOneRoute = "/registertwo";
  static const String registerTwoRoute = "/registerone";
  static const String choosePositionRoute = "/chooseposition";
  static const String chooseSignInMehtodRoute = "/choosesigninmethod";
  static const String forgotPasswordRoute = "/forgotpassword";
  static const String mainRoute = "/main";
  static const String categoryRoute = "/category";
  static const String courseDetailRoute = "/coursedetail";
  static const String coursesRoute = "/courses";
  static const String courseProgressRoute = "/courseprogress";
  static const String searchRoute = "/seach";
  static const String paymentRoute = "/payment";
  static const String noRouteFound = "No Route Found";
}
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.categoryRoute:
        return MaterialPageRoute(builder: (_) => const CategoryView());
      case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentView());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchView());
      case Routes.courseProgressRoute:
        return MaterialPageRoute(builder: (_) => const CourseProgressView());
      case Routes.coursesRoute:
        return MaterialPageRoute(builder: (_) => const CoursesView());
      case Routes.courseDetailRoute:
        return MaterialPageRoute(builder: (_) => const CourseDetailView());
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
            ),);
  }
}