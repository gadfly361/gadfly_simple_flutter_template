import 'package:flow_test/flow_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/inside/blocs/counter/events.dart';
import 'package:my_app/inside/routes/home/widgets/button_decrement.dart';
import 'package:my_app/inside/routes/home/widgets/button_increment.dart';
import 'package:my_app/inside/routes/home/widgets/button_reset.dart';

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

  group('initialize', () {
    final incrementBaseDescriptions = [
      ...baseDescriptions,
      FTDescription(
        descriptionType: 'FEATURE',
        directoryName: 'initialize',
        description: '''Initializing the counter''',
      ),
    ];

    flowTest(
      'failure to read saved value',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'failure_to_read',
          description:
              '''When a user navigates to the home page, the app attempts to read the saved counter value. If there is a failure to read the value, the counter should initialize to zero.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp();

        await tester.screenshot(
          description: 'initial state',
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 0'),
              findsOneWidget,
              reason:
                  '''Counter should initialize to 0 if there is a failure to read saved value''',
            );
          },
          expectedEvents: [
            '[app_builder] INFO: locale: en',
            '[ANALYTIC] [page]: Home_Route',
            Counter_Event_Initialize,
            '[counter_bloc] WARNING: Failed to load home/counter value',
          ],
        );
      },
    );

    flowTest(
      'success',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'success',
          description:
              '''When a user navigates to the home page, the app attempts to read the saved counter value and initializes the counter to that value.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: (arrange) async {
            when(
              () => arrange.mocks.repositories.persistenceRepository.getInt(
                'home/counter',
              ),
            ).thenAnswer((_) async => 1);
          },
        );

        await tester.screenshot(
          description: 'initial state',
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 1'),
              findsOneWidget,
              reason:
                  '''Counter should initialize to saved value (1) if read is successful''',
            );
          },
          expectedEvents: [
            '[app_builder] INFO: locale: en',
            '[ANALYTIC] [page]: Home_Route',
            Counter_Event_Initialize,
          ],
        );
      },
    );
  });

  group('increment', () {
    final incrementBaseDescriptions = [
      ...baseDescriptions,
      FTDescription(
        descriptionType: 'FEATURE',
        directoryName: 'increment',
        description: '''Incrementing the counter''',
      ),
    ];

    flowTest(
      'failure to save',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'failure_to_save',
          description:
              '''When the user taps the increment button, the counter value increases by one, but there is a failure to save the new value.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: arrangeBeforeWarpToHome,
          warp: warpToHome,
        );

        await tester.screenshot(
          description: 'initial state',
        );

        await tester.screenshot(
          description: 'tap increment button',
          actions: (actions) async {
            await actions.userAction.tap(find.byType(Home_Button_Increment));
            await actions.testerAction.pumpAndSettle();
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 1'),
              findsOneWidget,
              reason: 'Counter should increment to 1, even if save fails',
            );
          },
          expectedEvents: [
            Counter_Event_Increment,
            '[counter_bloc] WARNING: Failed to save home/counter value',
          ],
        );
      },
    );

    flowTest(
      'successs',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'success',
          description:
              '''When the user taps the increment button, the counter value increases by one.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: arrangeBeforeWarpToHome,
          warp: warpToHome,
        );

        await tester.screenshot(
          description: 'initial state',
        );

        await tester.screenshot(
          description: 'tap increment button',
          arrangeBeforeActions: (arrange) {
            when(
              () => arrange.mocks.repositories.persistenceRepository.saveInt(
                'home/counter',
                any<int>(),
              ),
            ).thenAnswer((_) async => true);
          },

          actions: (actions) async {
            await actions.userAction.tap(find.byType(Home_Button_Increment));
            await actions.testerAction.pump(const Duration(milliseconds: 200));
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 1'),
              findsOneWidget,
              reason: 'Counter should increment to 1',
            );
            expectations.expect(
              find.text('+1'),
              findsOneWidget,
              reason: 'Increment animation should be visible',
            );
          },
          expectedEvents: [
            Counter_Event_Increment,
          ],
        );

        await tester.screenshot(
          description: 'pump and settle to complete animation',

          actions: (actions) async {
            await actions.testerAction.pumpAndSettle();
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 1'),
              findsOneWidget,
              reason: 'Counter should increment to 1',
            );
            expectations.expect(
              find.text('+1'),
              findsNothing,
              reason: 'Increment animation should complete and be gone',
            );
          },
          expectedEvents: [],
        );
      },
    );
  });

  group('decrement', () {
    final incrementBaseDescriptions = [
      ...baseDescriptions,
      FTDescription(
        descriptionType: 'FEATURE',
        directoryName: 'decrement',
        description: '''Decrementing the counter''',
      ),
    ];

    flowTest(
      'failure to save',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'failure_to_save',
          description:
              '''When the user taps the decrement button, the counter value decreases by one, but there is a failure to save the new value.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: arrangeBeforeWarpToHome,
          warp: warpToHome,
        );

        await tester.screenshot(
          description: 'initial state',
        );

        await tester.screenshot(
          description: 'tap decrement button',
          actions: (actions) async {
            await actions.userAction.tap(find.byType(Home_Button_Decrement));
            await actions.testerAction.pumpAndSettle();
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: -1'),
              findsOneWidget,
              reason: 'Counter should decrement to -1, even if save fails',
            );
          },
          expectedEvents: [
            Counter_Event_Decrement,
            '[counter_bloc] WARNING: Failed to save home/counter value',
          ],
        );
      },
    );

    flowTest(
      'successs',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'success',
          description:
              '''When the user taps the decrement button, the counter value decreases by one.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: arrangeBeforeWarpToHome,
          warp: warpToHome,
        );

        await tester.screenshot(
          description: 'initial state',
        );

        await tester.screenshot(
          description: 'tap decrement button',
          arrangeBeforeActions: (arrange) {
            when(
              () => arrange.mocks.repositories.persistenceRepository.saveInt(
                'home/counter',
                any<int>(),
              ),
            ).thenAnswer((_) async => true);
          },

          actions: (actions) async {
            await actions.userAction.tap(find.byType(Home_Button_Decrement));
            await actions.testerAction.pump(const Duration(milliseconds: 200));
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: -1'),
              findsOneWidget,
              reason: 'Counter should decrement to -1',
            );
            expectations.expect(
              find.text('-1'),
              findsOneWidget,
              reason: 'Decrement animation should be visible',
            );
          },
          expectedEvents: [
            Counter_Event_Decrement,
          ],
        );

        await tester.screenshot(
          description: 'pump and settle to complete animation',

          actions: (actions) async {
            await actions.testerAction.pumpAndSettle();
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: -1'),
              findsOneWidget,
              reason: 'Counter should decrement to -1',
            );
            expectations.expect(
              find.text('-1'),
              findsNothing,
              reason: 'Decrement animation should complete and be gone',
            );
          },
          expectedEvents: [],
        );
      },
    );
  });

  group('reset', () {
    final incrementBaseDescriptions = [
      ...baseDescriptions,
      FTDescription(
        descriptionType: 'FEATURE',
        directoryName: 'reset',
        description: '''Resetting the counter''',
      ),
    ];

    flowTest(
      'failure to save',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'failure_to_save',
          description:
              '''When the user taps the reset button, the counter value resets to zero, but there is a failure to save the new value.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: arrangeBeforeWarpToHome,
          warp: warpToHome,
        );

        await tester.screenshot(
          description: 'initial state',
        );

        await tester.screenshot(
          description: 'tap reset button',
          actions: (actions) async {
            await actions.userAction.tap(find.byType(Home_Button_Reset));
            await actions.testerAction.pumpAndSettle();
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 0'),
              findsOneWidget,
              reason: 'Counter should reset to 0, even if save fails',
            );
          },
          expectedEvents: [
            Counter_Event_Reset,
            '[counter_bloc] WARNING: Failed to save home/counter value',
          ],
        );
      },
    );

    flowTest(
      'successs',
      config: createFlowConfig(),
      descriptions: [
        ...incrementBaseDescriptions,
        FTDescription(
          descriptionType: 'AC',
          directoryName: 'success',
          description:
              '''When the user taps the reset button, the counter value resets to zero.''',
        ),
      ],
      test: (tester) async {
        await tester.setUp(
          arrangeBeforePumpApp: arrangeBeforeWarpToHome,
          warp: warpToHome,
        );

        await tester.screenshot(
          description: 'initial state',
        );

        await tester.screenshot(
          description: 'tap reset button',
          arrangeBeforeActions: (arrange) {
            when(
              () => arrange.mocks.repositories.persistenceRepository.saveInt(
                'home/counter',
                any<int>(),
              ),
            ).thenAnswer((_) async => true);
          },

          actions: (actions) async {
            await actions.userAction.tap(find.byType(Home_Button_Reset));
            await actions.testerAction.pump(const Duration(milliseconds: 200));
          },
          expectations: (expectations) {
            expectations.expect(
              find.text('Current count: 0'),
              findsOneWidget,
              reason: 'Counter should reset to 0',
            );
            expectations.expect(
              find.text('0'),
              findsNothing,
              reason:
                  '''Reset animation should not be visible if the count is already 0''',
            );
          },
          expectedEvents: [
            Counter_Event_Reset,
          ],
        );
      },
    );
  });
}
