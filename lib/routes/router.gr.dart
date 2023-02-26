// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$Kopirouter extends RootStackRouter {
  _$Kopirouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginPage(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LoginRoute.name,
          path: '/loginpage',
        )
      ];
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/loginpage',
        );

  static const String name = 'LoginRoute';
}
