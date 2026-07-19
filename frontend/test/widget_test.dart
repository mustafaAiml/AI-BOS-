// This is a basic Flutter widget test for AI BOS.
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_bos/app/app.dart';

void main() {
  testWidgets('AI BOS App initialization test', (WidgetTester tester) async {
    // Build our app under ProviderScope and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: AiBosApp(),
      ),
    );

    // Settle the splash screen delayed navigation timer
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify that the app launches successfully (e.g. renders a widget)
    expect(find.byType(AiBosApp), findsOneWidget);
  });
}
