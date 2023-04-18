import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'firebase_options.dart';

@module
abstract class HttpClient {
  @lazySingleton
  http.Client get httpClient => http.Client();
}

@module
abstract class FirebaseAuthenticationService {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}

@module
abstract class GoogleSignInService {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      );
}

@module
abstract class FacebookSignInService {
  @lazySingleton
  FacebookAuth get facebookSignIn => FacebookAuth.instance;
}
