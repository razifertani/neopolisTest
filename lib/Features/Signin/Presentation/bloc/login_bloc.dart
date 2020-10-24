import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/login.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/loginGoogle.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/logout.dart';
import 'package:neopolis/Features/Signin/Domain/Usecases/logoutGoogle.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final LoginGoogle loginGoogle;
  final Logout logout;
  final LogoutGoogle logoutGoogle;

  LoginBloc({
    @required this.login,
    @required this.loginGoogle,
    @required this.logout,
    @required this.logoutGoogle,
  }) : assert(login != null, logout != null);

  @override
  LoginState get initialState => Empty();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Signin) {
      yield Loading();
      final params = Params(email: event.email, password: event.password);
      if (event.email == null) {
        yield Error(
          message: 'Please enter a valid email',
        );
      } else if (event.password == null) {
        yield Error(
          message: 'Invalid password',
        );
      } else {
        yield Loading();
        final failureOrToken = await login(params);
        yield* failureOrToken.fold((failure) async* {
          yield Error(
            message: 'Server failure it will be up in a minute',
          );
        }, (profile) async* {
          if (profile.idUser == "User does not exist") {
            yield Error(
              message: profile.idUser,
            );
          } else if (profile.idUser == "Wrong password") {
            yield Error(
              message: profile.idUser,
            );
          } else if (profile.idUser == "Session expired") {
            yield Error(
              message: profile.idUser,
            );
          } else {
            yield Loaded(profile: profile);
          }
        });
      }
    }
    if (event is SigningGoogle) {
      yield Loading();
      final failureOrToken = await loginGoogle('Test');
      yield* failureOrToken.fold((failure) async* {
        yield Error(
          message: 'Server failure it will be up in a minute',
        );
      }, (profile) async* {
        yield Loaded(profile: profile);
      });
    }
    if (event is LogoutEvent) {
      yield Loading();
      final paramss = Paramss(idUser: event.idUser, idSession: event.idSession);
      final failureOrToken = await logout(paramss);
      yield* failureOrToken.fold((failure) async* {
        yield Error(
          message: 'Server failure it will be up in a minute',
        );
      }, (message) async* {
        if (message == "An error occured") {
          yield Error(
            message: message,
          );
        } else {
          yield Logouted();
        }
      });
    }
    if (event is LogoutGoogleEvent) {
      yield Loading();
      final failureOrToken = await logoutGoogle('Test');
      yield* failureOrToken.fold((failure) async* {
        yield Error(
          message: 'Server failure it will be up in a minute',
        );
      }, (message) async* {
        yield Logouted();
      });
    }
  }
}
