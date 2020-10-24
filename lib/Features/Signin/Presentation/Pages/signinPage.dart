import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopolis/Core/Utils/loadingWidget.dart';
import 'package:neopolis/Features/Signin/Presentation/Widgets/loginWidget.dart';
import 'package:neopolis/Features/Signin/Presentation/Widgets/profilePage.dart';
import 'package:neopolis/Features/Signin/Presentation/bloc/login_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is Empty) {
          return LoginDisplay();
        } else if (state is Loading) {
          return LoadingWidgetDisplay();
        } else if (state is Loaded) {
          return ProfileWidget(
            profile: state.profile,
          );
        } else if (state is LogoutEvent) {
          return LoginDisplay();
        } else if (state is Error) {
          if (state.message != 'User does not exist' &&
              state.message != 'Wrong password' &&
              state.message != 'Invalid password' &&
              state.message != 'Please enter a valid email') {
            return LoginDisplay(
              message: 'Erreur de Connexion',
            );
          } else if (state.message == 'User does not exist' ||
              state.message == 'Please enter a valid email') {
            return LoginDisplay(
              message: 'User does not exist',
            );
          } else if (state.message == 'Wrong password' ||
              state.message == 'Invalid password') {
            return LoginDisplay(
              message: 'Invalid password',
            );
          }
          return LoginDisplay();
        }
        return LoginDisplay();
      },
    );
  }
}
