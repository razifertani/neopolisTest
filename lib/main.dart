import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopolis/Features/Signin/Presentation/Pages/signinProvider.dart';
import 'package:neopolis/injection_container.dart' as sl;

void main() {
  sl.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Found Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: Color.fromRGBO(236, 28, 64, 1.0),
      ),
      home: SigninProvider(),
    );
  }
}
