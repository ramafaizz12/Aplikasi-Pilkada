import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pilkada/ui/pages/pages.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: LoadingPage, initial: true, path: LoadingPage.routename),
    AutoRoute(page: LoginPage, path: LoginPage.routename),
    // AutoRoute(page: HomePage, path: HomePage.routename),
    // AutoRoute(page: HomePage, path: HomePage.routename),
    //AutoRoute(page: Wrapper, path: Wrapper.routename)
  ],
)
// extend the generated private router
class Kopirouter extends _$Kopirouter {}
