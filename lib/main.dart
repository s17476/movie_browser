import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_browser/injection.dart';

import 'app/movie_browser.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  configureDependencies();
  runApp(const MovieBrowser());
}
