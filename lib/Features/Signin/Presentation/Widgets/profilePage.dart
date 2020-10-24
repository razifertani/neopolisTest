import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:neopolis/Features/Signin/Presentation/bloc/login_bloc.dart';

class ProfileWidget extends StatefulWidget {
  final Profile profile;

  const ProfileWidget({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> list = [];

    widget.profile.userEmergencyContact.forEach((element) {
      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            element.relation != null
                ? Text(
                    element.firstName +
                        ' ' +
                        element.lastName +
                        ' (' +
                        element.relation +
                        ') ',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  )
                : Text(
                    element.firstName + ' ' + element.lastName,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
            element.tel != null
                ? Text(
                    element.tel,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  )
                : Text(
                    'Undefined phone number',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
            element.mail != null
                ? Text(
                    element.mail,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  )
                : Text(
                    'Undefined email',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
            Divider(
              color: Colors.transparent,
              height: 30,
            ),
          ],
        ),
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.4,
                ),
                Container(
                  width: width,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(236, 28, 64, 1.0),
                        Color.fromRGBO(245, 126, 32, 1.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.03,
                  top: height * 0.08,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                Positioned(
                  left: width * 0.18,
                  right: width * 0.18,
                  top: height * 0.085,
                  child: Text(
                    'View My Account Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.86,
                  top: height * 0.08,
                  child: Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Positioned(
                  left: width * 0.06,
                  right: width * 0.06,
                  top: height * 0.2,
                  child: Card(
                    elevation: 10,
                    child: Container(
                      width: width * 0.85,
                      height: height * 0.16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              'Assets/photo.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.profile.firstName,
                                  style: TextStyle(fontSize: 40),
                                ),
                                Text(
                                  widget.profile.lastName,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Info',
                    style: TextStyle(
                      color: Color.fromRGBO(236, 28, 64, 1.0),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Name : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Email : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Tel : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.profile.firstName +
                                ' ' +
                                widget.profile.lastName,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.profile.mail,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.profile.tel,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Contact settings',
                    style: TextStyle(
                      color: Color.fromRGBO(236, 28, 64, 1.0),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.profile.preferenceUser.idAllowChat.value == "1"
                              ? Image.asset(
                                  'Assets/ok.png',
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.asset(
                                  'Assets/error.png',
                                  fit: BoxFit.fitHeight,
                                ),
                          SizedBox(height: height * 0.012),
                          widget.profile.preferenceUser.idAllowFirstName
                                      .value ==
                                  "1"
                              ? Image.asset(
                                  'Assets/ok.png',
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.asset(
                                  'Assets/error.png',
                                  fit: BoxFit.fitHeight,
                                ),
                          SizedBox(height: height * 0.012),
                          widget.profile.preferenceUser.idIncludeTel1.value ==
                                  "1"
                              ? Image.asset(
                                  'Assets/ok.png',
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.asset(
                                  'Assets/error.png',
                                  fit: BoxFit.fitHeight,
                                ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Allow in App chat',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Include my first name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Include my phone number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Emergency contacts',
                    style: TextStyle(
                      color: Color.fromRGBO(236, 28, 64, 1.0),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.02),
                    child: Row(
                      children: [
                        Image.asset(
                          'Assets/ok.png',
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          'Personal emergency contacts',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.13,
                    ),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    reverse: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return list[index];
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  Container(
                    width: width * 0.9,
                    height: height * 0.08,
                    child: MaterialButton(
                      elevation: 5,
                      color: Color.fromRGBO(232, 229, 229, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        dispatchLogout();
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          color: Color.fromRGBO(236, 28, 64, 1.0),
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.08),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispatchLogout() {
    BlocProvider.of<LoginBloc>(context).dispatch(
      LogoutEvent(
        idUser: widget.profile.idUser,
        idSession: widget.profile.idSession,
      ),
    );
  }
}
