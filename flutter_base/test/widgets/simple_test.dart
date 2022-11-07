import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_base/widget_testing/main.dart';
import 'package:flutter_base/widget_testing/with_future.dart';
import 'package:flutter_base/widget_testing/with_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';

void main() async {
  testWidgets('Поиск по дереву виджетов', (tester) async {
    await tester.pumpWidget(const TestApp());

    // Поиск по тексту
    // final titleFinder = find.text('Hello world');
    // expect(titleFinder, findsOneWidget);

    // Поиск по лейблу
    // expect(find.bySemanticsLabel("Label"), findsOneWidget);

    // Поиск по ключу
    // const textKey = Key("test:textKey");
    // await tester.pumpWidget(const TestApp(key: textKey,));
    // expect(find.byKey(textKey).at(1), findsOneWidget);
    
    // Поиск по типу
    // expect(find.byType(Text), findsOneWidget);
    
    // Поиск по иконке
    // expect(find.byIcon(Icons.add), findsOneWidget);

    // Поиск по дочерним элементам
    // expect(find.widgetWithText(Scaffold, "Hello world"), findsOneWidget);

    // Поиск по типу элемента
    // expect(find.bySubtype<FloatingActionButton>(), findsOneWidget);
    
    // Поиск по assets
    // await tester.pumpWidget(const WidgetWithState());
    // expect(find.image(const AssetImage('assets/images/bg.png')), findsOneWidget);
    // expect(find.widgetWithImage(widgetType, image)), findsOneWidget);
    // expect(find.widgetWithImage(Column, const AssetImage('assets/images/bg.png')), findsOneWidget);

    // Сравнение
    // final textContain =  find.textContaining('World');
    // expect(textContain, findsNothing);
    // expect(textContain, findsNWidgets(2));
    // expect(textContain, findsWidgets);
  });

  // Тестирование по скриншоту
  // flutter test --update-goldens
  // testWidgets('Golden widget snapshot', (tester) async {
  //   await tester.pumpWidget(const TestApp());
  //   await expectLater(find.byType(TestApp), matchesGoldenFile('main.png'));
  // });

  // Тестирование параметров
  // testWidgets('Тестирование параметров', (tester) async {
  //   await tester.pumpWidget(const TestApp());
  //
  //   // Шрифт
  //   final finder = find.textContaining("world").evaluate().single.widget as Text;
  //   expect(finder.style?.fontSize, 20);
  // });

  // testWidgets('Тестирование виджета с с состоянием', (tester) async {
  //   await tester.pumpWidget(const WidgetWithState());
  //
  //   expect(find.text('Counter 0'), findsOneWidget);
  //
  //   final buttonFinder = find.byType(FloatingActionButton);
  //   expect(buttonFinder, findsOneWidget);
  //   await tester.tap(buttonFinder);
  //   await tester.pump();
  //
  //   expect(find.text('Counter 1'), findsOneWidget);
  //   await tester.tap(find.byIcon(Icons.plus_one));
  //   await tester.pump();
  //
  //   expect(find.text('Counter 2'), findsOneWidget);
  // });

  // testWidgets('Тестирование виджета с с состоянием и параметрами', (tester) async {
  //   await tester.pumpWidget(const WidgetWithState());
  //   final WidgetWithStateState myWidgetState = tester.state(find.byType(WidgetWithState));
  //
  //   expect(myWidgetState.counter, 0);
  //
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pump();
  //
  //   expect(myWidgetState.counter, 1);
  // });

  // testWidgets('Тестирование виджета c Future', (tester) async {
  //   await tester.pumpWidget(const WidgetWithFuture());
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //   await tester.pumpAndSettle();
  //   expect(find.text('Has data'), findsOneWidget);
  // });

  // testWidgets('Тестирование виджета c Future', (tester) async {
  //   await tester.pumpWidget(const WidgetWithFuture(), const Duration(seconds: 2));
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //   await tester.pump(const Duration(seconds: 3));
  //   expect(find.byType(CircularProgressIndicator), findsNothing);
  // });
}