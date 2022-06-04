import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators2/validators.dart';

abstract class MyFormEvents {}

class UsernameChanged extends MyFormEvents {
  final String username;

  UsernameChanged(this.username);
}

class EmailChanged extends MyFormEvents {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends MyFormEvents {
  final String password;

  PasswordChanged(this.password);
}

class FormSubmitted extends MyFormEvents {}

class MyFormState {
  final String username;
  final String? errorUsername;
  final String email;
  final String? errorEmail;
  final String password;
  final String? errorPassword;
  final bool isUsernameCheck;

  MyFormState({
    required this.username,
    required this.errorUsername,
    required this.email,
    required this.errorEmail,
    required this.password,
    required this.errorPassword,
    required this.isUsernameCheck,
  });

  MyFormState copyWith({
    String? username,
    String? errorUsername,
    String? email,
    String? errorEmail,
    String? password,
    String? errorPassword,
    bool? isUsernameCheck,
  }) {
    return MyFormState(
      username: username ?? this.username,
      errorUsername: errorUsername,
      email: email ?? this.email,
      errorEmail: errorEmail,
      password: password ?? this.password,
      errorPassword: errorPassword,
      isUsernameCheck: isUsernameCheck ?? this.isUsernameCheck,
    );
  }

  bool get noErrors =>
      username.isNotEmpty &&
      errorUsername == null &&
      email.isNotEmpty &&
      errorEmail == null &&
      password.isNotEmpty &&
      errorPassword == null;
}

class MyFormBloc extends Bloc<MyFormEvents, MyFormState> {
  MyFormBloc()
      : super(MyFormState(
          username: '',
          errorUsername: null,
          email: '',
          errorEmail: null,
          password: '',
          errorPassword: null,
          isUsernameCheck: false,
        )) {
    on<UsernameChanged>(_onUsernameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onUsernameChanged(
      UsernameChanged event, Emitter<MyFormState> emit) async {
    emit(state.copyWith(
      username: event.username,
      errorUsername: _checkUsername(event.username),
      errorEmail: state.errorEmail,
      errorPassword: state.errorPassword,
    ));

    try {
      emit(state.copyWith(
        errorUsername: state.errorUsername,
        errorEmail: state.errorEmail,
        errorPassword: state.errorPassword,
        isUsernameCheck: true,
      ));
      final _isValid = await _checkValidUsername(event.username);
      emit(state.copyWith(
        errorUsername: state.errorUsername,
        errorEmail: state.errorEmail,
        errorPassword: state.errorPassword,
        isUsernameCheck: false,
      ));
      if (!_isValid) {
        emit(state.copyWith(
          username: event.username,
          errorUsername: 'Username cannot be "admin"',
          errorEmail: state.errorEmail,
          errorPassword: state.errorPassword,
        ));
        return;
      }
    } catch (_) {
      emit(state.copyWith(
        errorUsername: null,
        errorEmail: state.errorEmail,
        errorPassword: state.errorPassword,
      ));
    }
  }

  void _onEmailChanged(EmailChanged event, Emitter<MyFormState> emit) =>
      emit(state.copyWith(
        errorUsername: state.errorUsername,
        email: event.email,
        errorEmail: _checkEmail(event.email),
        errorPassword: state.errorPassword,
      ));

  void _onPasswordChanged(PasswordChanged event, Emitter<MyFormState> emit) =>
      emit(state.copyWith(
        errorUsername: state.errorUsername,
        errorEmail: state.errorEmail,
        password: event.password,
        errorPassword: _checkPassword(event.password),
      ));

  void _onFormSubmitted(FormSubmitted event, Emitter<MyFormState> emit) {
    emit(state.copyWith(
      errorUsername: state.username.isEmpty
          ? _checkUsername(state.username)
          : state.errorUsername,
      errorEmail: _checkEmail(state.email),
      errorPassword: _checkPassword(state.password),
    ));
  }

  String? _checkUsername(String username) {
    return isNull(username) ? 'Field is required' : null;
  }

  Future<bool> _checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));
    return value != 'admin';
  }

  String? _checkEmail(String email) {
    return !isEmail(email) ? 'Not a valid email' : null;
  }

  String? _checkPassword(String password) {
    return isNull(password) ? 'Field is required' : null;
  }
}
