part of 'services.dart';

class GoogleServices {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<GoogleSignInAccount?> signGoogle() async {
    try {
      var data = await _googleSignIn.signIn();
      return data;
    } catch (err) {
      return null;
    }
  }

  Future<GoogleSignInAccount?> signOutGoogle() async {
    try {
      var data = await _googleSignIn.signOut();
      return data;
    } catch (err) {
      return null;
    }
  }
}
