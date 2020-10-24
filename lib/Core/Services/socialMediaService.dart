import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neopolis/Features/Signin/Domain/Entities/profileEntity.dart';

class SocialMediaService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<Profile> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
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
}
