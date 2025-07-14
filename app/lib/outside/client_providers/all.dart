import 'base.dart';
import 'sentry/client_provider.dart';

/// When adding a new client provider, be sure to add it to:
/// - [getList]
class ClientProviders_All {
  ClientProviders_All({
    required this.sentryClientProvider,
  });

  final Sentry_ClientProvider sentryClientProvider;

  List<ClientProvider_Base> getList() => [
        sentryClientProvider,
      ];

  Future<void> initialize() async {
    await Future.forEach(getList(), (r) async {
      r.log.fine('init');
      await r.init();
    });
  }
}
