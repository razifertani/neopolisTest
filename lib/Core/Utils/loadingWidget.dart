import 'package:flutter/material.dart';

class LoadingWidgetDisplay extends StatelessWidget {
  const LoadingWidgetDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            Color.fromRGBO(236, 28, 64, 1.0),
          ),
        ),
      ),
    );
  }
}
