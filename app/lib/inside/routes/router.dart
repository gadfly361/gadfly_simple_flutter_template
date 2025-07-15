import 'package:auto_route/auto_route.dart';

import '../../shared/mixins/logging.dart';
import 'home/page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class Routes_router extends RootStackRouter with SharedMixin_Logging {
  Routes_router({
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
