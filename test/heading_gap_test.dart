import 'package:flutter/material.dart';
import 'package:flutter_matrix_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';

Future<double> gapBetweenHeadingAndBody(
    WidgetTester tester, String html) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: Html(
        data: html,
        defaultTextStyle: const TextStyle(fontSize: 14),
      ),
    ),
  ));
  final heading = tester.getRect(find.text('Heading', findRichText: true));
  final body = tester.getRect(find.text('Body', findRichText: true));
  return body.top - heading.bottom;
}

void main() {
  testWidgets('a heading directly followed by a paragraph has no gap',
      (tester) async {
    expect(
      await gapBetweenHeadingAndBody(tester, '<h2>Heading</h2><p>Body</p>'),
      0,
    );
  });

  testWidgets(
      'a heading followed by a newline then a paragraph has no gap '
      '(what Element and most bots send)', (tester) async {
    expect(
      await gapBetweenHeadingAndBody(tester, '<h2>Heading</h2>\n<p>Body</p>'),
      0,
    );
  });
}
