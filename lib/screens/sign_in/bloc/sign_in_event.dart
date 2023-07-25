part of 'sign_in_bloc.dart';

@immutable
class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String email;
  final String password;

  SignInTextChangedEvent(this.email, this.password);

  SignInTextChangedEvent copyWith(String? email, String? password) {
    return SignInTextChangedEvent(
        email ?? this.email, password ?? this.password);
  }
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmittedEvent(this.email, this.password);
  SignInSubmittedEvent copyWith(String? email, String? password) {
    return SignInSubmittedEvent(email ?? this.email, password ?? this.password);
  }
}
