part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class Signin extends LoginEvent {
  final String email;
  final String password;

  Signin({@required this.email, @required this.password})
      : super([email, password]);
}

class SigningGoogle extends LoginEvent {}

class ProfileShow extends LoginEvent {
  final String idUser;
  final String idLanguage;
  final String idSession;

  ProfileShow({
    @required this.idUser,
    @required this.idLanguage,
    @required this.idSession,
  }) : super([idUser, idLanguage, idSession]);
}

class LogoutEvent extends LoginEvent {
  final String type;
  final String idUser;
  final String idSession;

  LogoutEvent({
    @required this.type,
    this.idUser,
    this.idSession,
  }) : super([type, idUser, idSession]);
}
