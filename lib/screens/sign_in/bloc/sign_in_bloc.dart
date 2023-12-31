import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangedEvent>((event, emit) {
      print("EMAIL" + event.email);
      print("PASSWORD" + event.password);
      if (!EmailValidator.validate(event.email)) {
        emit(SignInErrorState("Lütfen geçerli bir email adresi girin"));
      } else if (event.password.isEmpty) {
        emit(SignInErrorState("Password Alanı Boş Bırakılamaz"));
      } else if (event.password.length < 5) {
        emit(SignInErrorState("Parola en az 6 karekter olmalı"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
