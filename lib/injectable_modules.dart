import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

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
