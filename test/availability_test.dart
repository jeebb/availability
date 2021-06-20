import 'package:availability/availability.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'The child widget is rendered correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _testableWidget(
          Availability(
            available: true,
            childBuilder: (_) => Text('qwerty'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('qwerty'), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    },
  );

  testWidgets(
    'The child widget is rendered correctly with elseBuilder defined',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _testableWidget(
          Availability(
            available: true,
            childBuilder: (_) => Text('qwerty'),
            elseBuilder: (_) => Text('azerty'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('qwerty'), findsOneWidget);
      expect(find.text('azerty'), findsNothing);
    },
  );

  testWidgets(
    'The child widget is not rendered and shrinked SizedBox is rendered',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _testableWidget(
          Availability(
            available: false,
            childBuilder: (_) => Text('qwerty'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('qwerty'), findsNothing);
      expect(find.byType(SizedBox), findsOneWidget);
    },
  );

  testWidgets(
    'The else builder is triggered correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _testableWidget(
          Availability(
            available: false,
            childBuilder: (_) => Text('qwerty'),
            elseBuilder: (_) => Text('azerty'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('qwerty'), findsNothing);
      expect(find.text('azerty'), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    },
  );
}

Widget _testableWidget(Widget widget) => MaterialApp(home: widget);
