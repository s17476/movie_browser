import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:movie_browser/app/custom_multi_bloc_provider.dart';
import 'package:movie_browser/app/custom_router.dart';

class MovieBrowser extends StatelessWidget {
  const MovieBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: GestureDetector(
        onTap: () {
          final focusScope = FocusScope.of(context);
          final focusNode = focusScope.focusedChild;
          if (!focusScope.hasPrimaryFocus && focusNode != null) {
            focusNode.unfocus();
          }
        },
        child: MaterialApp.router(
          title: 'Movie Browser',
          debugShowCheckedModeBanner: false,
          routerConfig: CustomRouter.routerConfig(),
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
          theme: ThemeData(
            colorScheme: const ColorScheme.dark().copyWith(
              primary: Colors.amber.shade800,
              error: Colors.red.shade800,
            ),
            dialogBackgroundColor: Colors.grey.shade900,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black26,
              elevation: 0.0,
            ),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
          ],
        ),
      ),
    );
  }
}
