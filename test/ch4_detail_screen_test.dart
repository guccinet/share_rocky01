import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_app/ch4/DetailScreen.dart';
import 'package:hello_app/ch4/data/UserParam.dart';

void main() {
  testWidgets('DetailScreen displays user information', (tester) async {
    final user = UserParam(name: 'Alice', age: 25, role: 'Developer');

    await tester.pumpWidget(
      MaterialApp(
        home: DetailScreen(user: user),
      ),
    );

    expect(find.text('Name: Alice'), findsOneWidget);
    expect(find.text('Age: 25'), findsOneWidget);
    expect(find.text('Role: Developer'), findsOneWidget);
  });
}
