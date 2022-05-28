import 'package:mobx/mobx.dart';

/// ReactionDisposer autorun(Function(Reaction) fn)

// void main() {
//   final value = Observable('Hello world!');

//   final dispose = autorun((_) {
//     print(value.value);
//   });

//   value.value = 'Hello';

//   dispose();
// }

/// ReactionDisposer reaction<T>(T Function(Reaction) fn, void Function(T) effect)
// void main() {
//   final value = Observable('Hello world!');

//   final dispose = reaction(
//     (_) => value.value,
//     (msg) => print(msg),
//   );

//   value.value = 'Hello';
//   value.value = 'Hello MOBX';

//   dispose();
// }

/// ReactionDisposer when(bool Function(Reaction) predicate, void Function() effect)
// void main() {
//   final value = Observable('Hello world!');

//   final dispose = when(
//     (_) => value.value == 'Hello',
//     () => print('When is true'),
//   );

//   value.value = 'Hello MOBX';
//   value.value = 'Hello';

//   dispose();
// }

/// Future<void> asyncWhen(bool Function(Reaction) predicate)
void main() async {
  final completed = Observable(false);

  Future wait() async {
    await asyncWhen((_) => completed.value == true);

    print('Ok');
  }

  completed.value = true;

  await wait();
}
