import 'package:bloc/bloc.dart';
import 'package:validators2/validators.dart';

abstract class ValidateEvent {}

class ValidateUsernameEvent extends ValidateEvent {
  final String username;
  ValidateUsernameEvent(this.username);
}

class ValidatePasswordEvent extends ValidateEvent {
  final String password;
  ValidatePasswordEvent(this.password);
}

class ValidateEmailEvent extends ValidateEvent {
  final String email;
  ValidateEmailEvent(this.email);
}

class FormErrorState {
  final String? errorUsername;
  final String? errorEmail;
  final String? errorPassword;

  FormErrorState({
    required this.errorUsername,
    required this.errorEmail,
    required this.errorPassword,
  });

  bool get hasErrors => errorUsername != null || errorEmail != null || errorPassword != null;

}

class ValidateBloc extends Bloc<ValidateEvent, FormErrorState> {
  ValidateBloc()
      : super(
    FormErrorState(
      errorUsername: null,
      errorEmail: null,
      errorPassword: null,
    ),
  ) {
    on<ValidateUsernameEvent>((ValidateUsernameEvent event, Emitter<FormErrorState> emit) async {
      if (isNull(event.username) || event.username.isEmpty) {
        emit(FormErrorState(
            errorUsername: 'Field is required',
            errorEmail: state.errorEmail,
            errorPassword: state.errorPassword));
        return;
      }
      try {
        emit(
          FormErrorState(
              errorUsername: null,
              errorEmail: state.errorEmail,
              errorPassword: state.errorPassword),
        );
        final isValid = await checkValidUsername(event.username);
        if (!isValid) {
          emit(
            FormErrorState(
                errorUsername: 'Username cannot be "admin"',
                errorEmail: state.errorEmail,
                errorPassword: state.errorPassword),
          );
          return;
        }
      } catch (_) {
        emit(
          FormErrorState(
              errorUsername: null,
              errorEmail: state.errorEmail,
              errorPassword: state.errorPassword),
        );
      }
    });
    on<ValidatePasswordEvent>((ValidatePasswordEvent event, Emitter<FormErrorState> emit) {
      if (!isNull(event.password) && event.password.isNotEmpty) {
        emit(FormErrorState(
            errorUsername: state.errorUsername,
            errorEmail: state.errorEmail,
            errorPassword: null));
      } else {
        emit(FormErrorState(
            errorUsername: state.errorUsername,
            errorEmail: state.errorEmail,
            errorPassword: 'Field is required'));
      }
    });
    on<ValidateEmailEvent>((ValidateEmailEvent event, Emitter<FormErrorState> emit) {
      if (isEmail(event.email)) {
        emit(FormErrorState(
            errorUsername: state.errorUsername,
            errorEmail: null,
            errorPassword: state.errorPassword));
      } else {
        emit(FormErrorState(
            errorUsername: state.errorUsername,
            errorEmail: 'Not a valid email',
            errorPassword: state.errorPassword));
      }
    });
  }


} //close bloc

Future<bool> checkValidUsername(String value) async {
  await Future.delayed(const Duration(seconds: 1));

  return value != 'admin';
}
