import 'package:flutter/material.dart';

class MovieDetailsLoadingIndicator extends StatelessWidget {
  const MovieDetailsLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          'assets/images/loading.gif',
          width: 90,
          height: 90,
        ),
      ),
    );
  }
}
