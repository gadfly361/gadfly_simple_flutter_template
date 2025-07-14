import 'package:flow_test/flow_test.dart';

import '../../util/flow_config.dart';
import '../../util/warps/to_home.dart';
import 'epic_description.dart';

void main() {
  final baseDescriptions = [
    epicDescription_home,
    FTDescription(
      descriptionType: 'STORY',
      directoryName: 'counter',
      description:
          '''As a user, I want to be able to view and interact with the counter feature.''',
      atScreenshotsLevel: true,
    ),
  ];

  flowTest(
    'increment',
    config: createFlowConfig(),
    descriptions: [
      ...baseDescriptions,
      FTDescription(
        descriptionType: 'AC',
        directoryName: 'increment',
        description: '''Incrementing the counter''',
      ),
    ],
    test: (tester) async {
      await tester.setUp(
        arrangeBeforePumpApp: arrangeBeforeWarpToHome,
        warp: warpToHome,
      );

      await tester.screenshot(
        description: 'initial state',
        expectedEvents: [],
      );
    },
  );
}
