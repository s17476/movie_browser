import 'package:flutter/material.dart';
import 'package:movie_browser/injection.dart';

import 'app/movie_browser.dart';

void main() {
  configureDependencies();
  runApp(const MovieBrowser());
}
