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

class TestClassDisposable extends TestClass with Disposable {
  TestClassDisposable() {
    constructorCounter++;
  }
  void dispose() {
    disposeCounter++;
  }

  @override
  void onDispose() {
    dispose();
  }
}

void main() {
  setUp(() async {});

  test('Регистрация Singleton', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;

    getIt.registerSingleton<TestClass>(TestClassImpl());

    final instance1 = getIt.get<TestClass>();

    expect(instance1 is TestClass, true);

    final instance2 = getIt.get<TestClass>();

    expect(instance1, instance2);

    expect(constructorCounter, 1);

    GetIt.I.reset();
  });

  test('Очистка контейнера', () async {
    final getIt = GetIt.instance;
    int destructorCounter = 0;

    getIt.registerSingleton<TestClass>(TestClassImpl());
    getIt.registerSingleton<TestClass>(
      TestClassImpl(),
      instanceName: 'instance2',
      dispose: (_) {
        destructorCounter++;
      },
    );

    await getIt.reset();
    expect(
      () => getIt.get<TestClass>(),
      throwsA(const TypeMatcher<AssertionError>()),
    );

    expect(destructorCounter, 1);
  });

  test('Очистка контейна с Disposable', () async {
    disposeCounter = 0;
    final getIt = GetIt.instance;

    getIt.registerSingleton<TestClass>(TestClassDisposable());

    await getIt.reset();
    expect(() => getIt.get<TestClass>(),
        throwsA(const TypeMatcher<AssertionError>()));

    expect(disposeCounter, 1);
  });

  test('Регистрация ленивого Singlton', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;
    getIt.registerLazySingleton<TestClass>(() => TestClassImpl());

    expect(constructorCounter, 0);

    final instance1 = getIt.get<TestClass>();

    expect(instance1 is TestClass, true);
    expect(constructorCounter, 1);

    final instance2 = getIt.get<TestClass>();

    expect(instance1, instance2);

    expect(constructorCounter, 1);

    GetIt.I.reset();
  });

  test('Ошибка доступка к зависимости', () {
    final getIt = GetIt.instance;

    expect(
      () => getIt.get<int>(),
      throwsA(const TypeMatcher<AssertionError>()),
    );

    GetIt.I.reset();
  });

  test('Регистрация ленивого singlton объекта по имени', () {
    final getIt = GetIt.instance;
    constructorCounter = 0;
    getIt.registerLazySingleton<TestClass>(() => TestClassImpl(),
        instanceName: 'LazyByName');

    expect(constructorCounter, 0);

    final TestClass instance1 = getIt<TestClass>(instanceName: 'LazyByName');

    expect(instance1 is TestClass, true);
    expect(constructorCounter, 1);

    final TestClass instance2 = getIt<TestClass>(instanceName: 'LazyByName');

    expect(instance1, instance2);

    expect(constructorCounter, 1);
    GetIt.I.reset();
  });
}
