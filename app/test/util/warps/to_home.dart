import 'package:flow_test/flow_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocked_app.dart';

Future<void> arrangeBeforeWarpToHome(
  FTArrange<MocksContainer> arrange,
) async {}

Future<void> warpToHome(
  FTWarp<MocksContainer> warp,
) async {
  await warp.testerAction.pumpAndSettle();
}
