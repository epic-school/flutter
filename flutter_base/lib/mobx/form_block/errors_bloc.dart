import 'package:bloc/bloc.dart';
import 'package:validators2/validators.dart';

abstract class ValidateEvent {}

class ValidateEventPassword extends ValidateEvent {
  final String validatepass;
  ValidateEventPassword(this.validatepass);
}

class ValidateEventName extends ValidateEvent {
  final String validatename;

  ValidateEventName(this.validatename);
}

class ValidateEventEmail extends ValidateEvent {
  final String validatemail;
  ValidateEventEmail(this.validatemail);
}

class MissageErrorState {
  final String? nameMessage;
  final String? emailMessage;
  final String? passwordMessage;
  MissageErrorState({
    required this.nameMessage,
    required this.emailMessage,
    required this.passwordMessage,
  });
}

class ValidateBloc extends Bloc<ValidateEvent, MissageErrorState> {
  ValidateBloc()
      : super(
          MissageErrorState(
            nameMessage: null,
            emailMessage: null,
            passwordMessage: null,
          ),
        ) {
    on<ValidateEventName>(_addNameError);
    on<ValidateEventEmail>(_addEmailError);
    on<ValidateEventPassword>(_addPasswordError);
  }

  _addNameError(
      ValidateEventName event, Emitter<MissageErrorState> emit) async {
    if (isNull(event.validatename) || event.validatename.isEmpty) {
      emit(MissageErrorState(
          nameMessage: 'name is not empty',
          emailMessage: state.emailMessage,
          passwordMessage: state.passwordMessage));
      return;
    }
    try {
      emit(
        MissageErrorState(
            nameMessage: null,
            emailMessage: state.emailMessage,
            passwordMessage: state.passwordMessage),
      );
      final _adminli = await checkValidUsername(event.validatename);
      if (!_adminli) {
        emit(
          MissageErrorState(
              nameMessage: 'name is not admin!',
              emailMessage: state.emailMessage,
              passwordMessage: state.passwordMessage),
        );
        return;
      }
    } catch (_) {
      emit(
        MissageErrorState(
            nameMessage: null,
            emailMessage: state.emailMessage,
            passwordMessage: state.passwordMessage),
      );
    }
  }

  void _addEmailError(
      ValidateEventEmail event, Emitter<MissageErrorState> emit) {
    if (isEmail(event.validatemail)) {
      emit(MissageErrorState(
          nameMessage: state.nameMessage,
          emailMessage: null,
          passwordMessage: state.passwordMessage));
    } else {
      emit(MissageErrorState(
          nameMessage: state.nameMessage,
          emailMessage: 'enter valid email, please',
          passwordMessage: state.passwordMessage));
    }
  }

  void _addPasswordError(
      ValidateEventPassword event, Emitter<MissageErrorState> emit) {
    if (event.validatepass != 'qwerty') {
      emit(MissageErrorState(
          nameMessage: state.nameMessage,
          emailMessage: state.emailMessage,
          passwordMessage: 'ivalid password'));
    } else {
      emit(MissageErrorState(
          nameMessage: state.nameMessage,
          emailMessage: state.emailMessage,
          passwordMessage: null));
    }
  }
} //close bloc

Future<bool> checkValidUsername(String value) async {
  await Future.delayed(const Duration(seconds: 1));
  return value != 'admin';
}
