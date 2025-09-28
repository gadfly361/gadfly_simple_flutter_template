import 'package:auto_route/auto_route.dart';

import '../../shared/mixins/logging.dart';
import 'home/page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class Routes_Router extends RootStackRouter with SharedMixin_Logging {
  Routes_Router({
    required super.navigatorKey,
  });

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/home',
      page: Home_Route.page,
    ),
    RedirectRoute(path: '*', redirectTo: '/home'),
  ];
}
