import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';

class SocialMediaService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Profile> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    Profile profile = Profile();
    profile.firstName = user.displayName;
    profile.lastName = '';
    profile.mail = user.email;
    user.phoneNumber != null
        ? profile.tel = user.phoneNumber
        : profile.tel = '1234';
    profile.userEmergencyContact = [];
    profile.type = 'Google';

    return profile;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
  }

  //

  Future<String> loginWithFB() async {
    final result = await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final response = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = jsonDecode(response.body);
        print(profile);
        print('Connected');
        return 'Connected';
        break;

      case FacebookLoginStatus.cancelledByUser:
        print('Cancelled');
        return 'Cancelled';
        break;
      case FacebookLoginStatus.error:
        print('Error');
        return 'Error';
        break;
    }
    return 'Heree';
  }

  logout() {
    facebookSignIn.logOut();
  }
}
