import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/features/home/presentation/home_controller.dart';
import 'package:state_management/features/home/presentation/home_page.dart';

void main() {
  testWidgets('home page ...', (tester) async {
    final controller = HomeController();

    await tester
        .pumpWidget(MaterialApp(home: HomePage(controller: controller)));
    await tester.pumpAndSettle();

    await tester.pump();

    final faillureButtom = find.byKey(const Key('failure'));

    await tester.tap(faillureButtom);
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.thumb_down_alt_outlined), findsOneWidget);
  });
}
