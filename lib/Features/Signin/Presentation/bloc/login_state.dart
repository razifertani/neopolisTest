part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {
  final Profile profile;

  Loaded({@required this.profile});
}

class Logouted extends LoginState {}

class Error extends LoginState {
  final String email;
  final String password;
  final String message;

  Error({
    this.email,
    this.password,
    @required this.message,
  });
}
