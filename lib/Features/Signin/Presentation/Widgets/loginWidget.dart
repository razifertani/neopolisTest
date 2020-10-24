import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopolis/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginDisplay extends StatefulWidget {
  final String message;

  const LoginDisplay({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  _LoginDisplayState createState() => _LoginDisplayState();
}

class _LoginDisplayState extends State<LoginDisplay> {
  String email = 'foundme.neodev@gmail.com';
  String password = 'NeoDev12345#';
  // String email;
  // String password;
  String message = 'null';
  bool isHidden = true;
  bool checkerEmail = true;
  bool checkerPassword = true;
  String checkerEmailMessage = 'Email must be like username@serveur.extension';
  String checkerPasswordMessage =
      'Password must contain at least 8 characters, 1 uppercase letter, 1 number, and 1 special character';

  void showAlert(BuildContext context, String message) {
    if (message == 'Wrong password' || message == 'Invalid password') {
      Alert(
        context: context,
        title: 'Incorrect password',
        desc: 'The password you entred is incorrect.\nPlease try again',
        style: AlertStyle(
          titleStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          descStyle: TextStyle(fontSize: 16),
        ),
        buttons: [
          DialogButton(
            color: Colors.green,
            child: Text(
              "Try Again",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            width: MediaQuery.of(context).size.width * 0.6,
          )
        ],
      ).show();
    }
    if (message == 'User does not exist') {
      Alert(
        context: context,
        title: message,
        desc: 'The email you entred does not match any user.\nPlease try again',
        style: AlertStyle(
          titleStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          descStyle: TextStyle(fontSize: 16),
        ),
        buttons: [
          DialogButton(
            color: Colors.green,
            child: Text(
              "Try Again",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            width: MediaQuery.of(context).size.width * 0.6,
          )
        ],
      ).show();
    }
  }

  @override
  void initState() {
    message = widget.message;
    if (message == 'Wrong password' ||
        message == 'Invalid password' ||
        message == 'User does not exist' ||
        message == 'Session expired') {
      Future.delayed(Duration.zero, () => showAlert(context, message));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    message = widget.message;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width * 0.92,
            padding: EdgeInsets.symmetric(vertical: height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'Assets/logo.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.04),
                  child: Center(
                    child: Image.asset(
                      'Assets/art.png',
                    ),
                  ),
                ),
                Text(
                  'Login',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.005),
                  child: TextFormField(
                    initialValue: email,
                    onChanged: (value) {
                      email = value;
                      RegExp regExpEmail = new RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      );
                      setState(() {
                        checkerEmail = regExpEmail.hasMatch(email);
                      });
                    },
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                checkerEmail
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Center(
                          child: Text(
                            checkerEmailMessage,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.005),
                  child: TextFormField(
                    initialValue: password,
                    obscureText: isHidden,
                    onChanged: (value) {
                      password = value;
                      RegExp regExpPassword = new RegExp(
                        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
                      );
                      setState(() {
                        checkerPassword = regExpPassword.hasMatch(password);
                      });
                    },
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                checkerPassword
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Center(
                          child: Text(
                            checkerPasswordMessage,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.04,
                  ),
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.08,
                    child: MaterialButton(
                      elevation: 5,
                      color: Color.fromRGBO(236, 28, 64, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        if (checkerEmail && checkerPassword) {
                          dispatchLogin();
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'Assets/facebook.png',
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'USING FACEBOOK',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'Assets/google.png',
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'USING GOOGLE',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Center(
                  child: RichText(
                    text: new TextSpan(
                      text: null,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      children: <TextSpan>[
                        new TextSpan(
                          text: 'New User? ',
                          style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        new TextSpan(
                          text: 'Create an account',
                          style: new TextStyle(
                            color: Color.fromRGBO(236, 28, 64, 1.0),
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispatchLogin() {
    BlocProvider.of<LoginBloc>(context)
        .dispatch(Signin(email: email, password: password));
  }
}
