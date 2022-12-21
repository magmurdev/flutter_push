import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push/main.dart';

import 'lesson_1/task_1.dart';
import 'lesson_1/task_2.dart';
import 'lesson_1/task_3.dart';
import 'lesson_1/task_4.dart';
import 'lesson_1/task_5.dart';
import 'lesson_1/task_6.dart';

void main() {
   group('l01h01', () => runTestLesson1Task1());
   group("l01h02", () => runTestLesson1Task2());
   group('l01h03', () => runTestLesson1Task3());
   group('l01h04', () => runTestLesson1Task4());
   group('l01h05', () => runTestLesson1Task5());
   group('l01h06', () => runTestLesson1Task6());
}


void runTestLesson1Task1() {
  testWidgets('module1', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(
      (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
      const Color(0xFF282E3D),
    );
  });
}


void runTestLesson1Task2() {
  testWidgets('module2', (WidgetTester tester) async {
    const TextStyle correctStyle =
    const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white);
    await tester.pumpWidget(MyApp());
    expect((tester.firstWidget(find.textContaining("Test your")) as Text).style, correctStyle);
    expect(
        (tester.firstWidget(find.textContaining("Test your")) as Text).textAlign, TextAlign.center);
  });
}



void runTestLesson1Task3() {
  testWidgets('module3', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final List<Stack> stackWidgets =
    tester.widgetList<Stack>(find.byWidgetPredicate((widget) => widget is Stack)).toList();
    final Stack? stackWithThreeWidgets =
    stackWidgets.firstWhere((stack) => stack.children.length == 3);
    expect(stackWithThreeWidgets, isNotNull);
    final Widget? centeredWidget = stackWithThreeWidgets!.children.firstWhere((element) =>
    (element is Align && element.alignment == Alignment.center) || element is Center);
    expect(centeredWidget, isNotNull);
    expect(centeredWidget, isInstanceOf<Align>());
    expect((centeredWidget as Align).child, isInstanceOf<ColoredBox>());
    final ColoredBox coloredBox = centeredWidget.child as ColoredBox;
    expect(coloredBox.color, const Color(0xFF6D6D6D));
  });
}




void runTestLesson1Task4() {
  testWidgets('module4', (WidgetTester tester) async {
    const TextStyle correctStyle =
    const TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: Colors.white);
    await tester.pumpWidget(MyApp());
    final Text? text = tester
        .firstWidget(find.byWidgetPredicate((widget) => widget is Text && widget.data == ""));
    expect(text, isNotNull);
    expect(text!.style, correctStyle);
  });
}



void runTestLesson1Task5() {
  testWidgets('module5', (WidgetTester tester) async {
    const TextStyle correctStyle =
    const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white);
    await tester.pumpWidget(MyApp());
    final Text? text = tester
        .firstWidget(find.byWidgetPredicate((widget) => widget is Text && widget.data == "START"));
    expect(text, isNotNull);
    expect(text!.style, correctStyle);
  });
}



void runTestLesson1Task6() {
  testWidgets('module6', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final List<Stack> stackWidgets =
    tester.widgetList<Stack>(find.byWidgetPredicate((widget) => widget is Stack)).toList();
    final Stack? stackWithThreeWidgets =
    stackWidgets.firstWhere((stack) => stack.children.length == 3);
    expect(stackWithThreeWidgets, isNotNull);
    final Widget? topWidget = stackWithThreeWidgets!.children
        .firstWhere((element) => element is Align && element.alignment == const Alignment(0, -0.8));
    expect(topWidget, isNotNull);
    final Widget? bottomWidget = stackWithThreeWidgets.children
        .firstWhere((element) => element is Align && element.alignment == const Alignment(0, 0.8));
    expect(bottomWidget, isNotNull);
  });
}
