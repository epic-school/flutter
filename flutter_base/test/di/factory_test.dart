// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

int constructorCounter = 0;
int disposeCounter = 0;

abstract class TestClass {}

class TestClass2 {}

class TestClassImpl extends TestClass {
  TestClassImpl() {
    constructorCounter++;
  }
  void dispose() {
    disposeCounter++;
  }
}

class TestClassParam {
  final String? param1;
  final int? param2;

  TestClassParam({this.param1, this.param2});
}

void main() {
  setUp(() async {
    await GetIt.instance.reset();
  });

  test('Регистрация фабрики', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;
    getIt.registerFactory<TestClass>(() => TestClassImpl());

    final i1 = getIt<TestClass>();

    expect(i1 is TestClass, true);

    final i2 = getIt<TestClass>();

    expect(getIt.isRegistered<TestClass>(), true);
    expect(getIt.isRegistered<TestClass2>(), false);
    expect(i1, isNot(i2)); // Matcher isNot(Object? valueOrMatcher)

    expect(constructorCounter, 2);
  });

  test('Фабрика с параметрами', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;

    getIt.registerFactoryParam<TestClassParam, String, void>(
      (p1, p2) => TestClassParam(param1: p1),
    );

    final i1 = getIt<TestClassParam>(param1: '123');
    final i2 = getIt<TestClassParam>(param1: '345');

    expect(i1 is TestClassParam, true);
    expect(i2 is TestClassParam, true);
    expect(i1.param1, '123');
    expect(i2.param1, '345');
  });

  test('Проверка типа параметра', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;

    getIt.registerFactoryParam<TestClassParam, String, int>(
      (p1, p2) => TestClassParam(param1: p1, param2: p2),
    );

    expect(
      () => getIt.get<TestClassParam>(param1: '123', param2: '123'),
      throwsA(
        const TypeMatcher<TypeError>(),
      ),
    );
  });

  test('Проверка двух экземпляров фабрики', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;
    getIt.registerFactory<TestClass>(() => TestClassImpl());

    final i1 = getIt<TestClass>();

    expect(i1 is TestClass, true);

    final i2 = getIt<TestClass>();

    expect(i2 is TestClass, true);

    expect(i1, isNot(i2));

    expect(TestClassImpl(), isNot(TestClassImpl()));

    expect(constructorCounter, 4);
  });
}
