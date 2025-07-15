import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// This package should come with flutter, so we aren't depending on it
// explicitly
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../inside/i18n/translations.g.dart';
import '../inside/routes/router.dart';
import '../outside/effect_providers/all.dart';
import '../outside/effect_providers/mixpanel/route_observer.dart';
import '../outside/repositories/all.dart';
import '../outside/theme/theme.dart';

final _log = Logger('app_builder');

/// This function builds the root widget of our application. We consider this
/// function to be the "front-door" to the inside of our application's widget
/// tree. This function is also used as the starting point for our Flow Tests.
Future<Widget> appBuilder({
  required Key key,
  required AppLocale appLocale,
  required OutsideTheme theme,
  required EffectProviders_All effectProviders,
  required Repositories_All repositories,
}) async {
  // Set locale
  await LocaleSettings.setLocale(appLocale);
  _log.info('locale: ${appLocale.languageCode}');

  final appNavigatorKey = GlobalKey<NavigatorState>();

  final router = Routes_router(
    navigatorKey: appNavigatorKey,
  );

  return TranslationProvider(
    child: App(
      key: key,
      theme: theme,
      router: router,
      effectProviders: effectProviders,
      repositories: repositories,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    required this.theme,
    required this.router,
    required this.effectProviders,
    required this.repositories,
    super.key,
  });

  final OutsideTheme theme;
  final EffectProviders_All effectProviders;
  final Repositories_All repositories;

  final Routes_router router;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ...effectProviders.createProviders(),
        ...repositories.createProviders(),
      ],
      child: MaterialApp.router(
        theme: theme.materialThemeData,
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        routeInformationParser: router.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routerDelegate: AutoRouterDelegate(
          router,
          rebuildStackOnDeepLink: true,
          navigatorObservers: () => [
            AutoRouteObserver(),
            Mixpanel_Effect_RouteObserver(
              mixpanelEffect: effectProviders.mixpanelEffectProvider
                  .getEffect(),
            ),
            SentryNavigatorObserver(),
          ],
        ),
      ),
    );
  }
}
